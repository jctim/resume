FROM node:18.17.0 as build

# RUN apt-get upgrade && apt-get update && apt-get install chromium -y

RUN git clone https://github.com/jctim/resume.git
# RUN cd resume
WORKDIR /resume

RUN npm install -g resume-cli
RUN npm install jsonresume-theme-macchiato

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
