# Resume

My **[resume.json](resume.json)** is created using the open source initiative of
a [JSON-based standard for resumes](https://jsonresume.org/).

The JSON file is based on the schema https://jsonresume.org/schema/

The latest version of the résumé is always available at https://registry.jsonresume.org/jctim.

## Export to PDF

### Install CLI tool

You should have `node` and `npm` installed.
To install `resume-cli` you need to run command

```bash
npm install -g resume-cli
```

You can check if `resume` CLI is installed via

```bash
resume --help
````

#### Install themes

Install at least one theme, or all of them (visit https://jsonresume.org/themes/ for more details)

```bash
npm install jsonresume-theme-even
npm install jsonresume-theme-elegant
npm install jsonresume-theme-kendall
npm install jsonresume-theme-macchiato
npm install jsonresume-theme-rickosborne
```

#### Generate a PDF file

```bash
resume export cv.pdf --theme jsonresume-theme-macchiato
```

