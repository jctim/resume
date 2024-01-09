FROM node:18.17.0 as build

# RUN apt-get upgrade && apt-get update && apt-get install chromium -y

WORKDIR /resume

RUN npm install -g resume-cli
RUN npm install jsonresume-theme-macchiato
RUN npm install jsonresume-theme-elegant

COPY . .
RUN mkdir public
RUN resume export public/index.html --theme macchiato
# RUN resume export public/cv.pdf --theme macchiato


FROM busybox:1.35

# Create a non-root user to own the files and run our server
RUN adduser -D static
USER static
WORKDIR /home/static

COPY --from=build /resume/public .

EXPOSE 4000
CMD ["busybox", "httpd", "-f", "-v", "-p", "4000"]
