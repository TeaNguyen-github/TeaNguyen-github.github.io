# Portofolio Site

## Working with the project

You can make edits to this project using Github's own online editor, or by cloning and working with it locally. If you want to build the site locally, look at [Setup](#Setup). Any changes pushed to the `main` branch will go live.


### Setup

1. To work with the project, you need to install either [Nix](https://determinate.systems/posts/determinate-nix-installer/), or [Zola](https://www.getzola.org/documentation/getting-started/installation/).


2. If you use Nix, get it installed, open this project in a terminal, and type `nix develop` to automatically install the toolchain. 

3. Run `git submodule init` in the root of this directory, this will load in the base theme data.

4. Run `zola serve --drafts` to build the site, serve it and automatically watch for changes in it's source files. 

5. If you need to build the site non interactively, run `zola build`. If you have Nix installed, you can run `nix build` for an optimized build of the website.

### Projects

```
+++
title = "<Title of the project>" 
description = "<Optional extra description, shown only on project page.>"
[extra]
link_text = "<These words will be on the button on the project list. Optional.>"
personal = put `true` or `false` here, no quotes, to sort it into professional or personal column.
img = "<Put the path to an image file here, omitting `static/`, eg, `img/mountains.jpg`>" 
img_alt = "<Alt text describing the image.>"
+++

Content written here will be shown on the projects list, and on top of the projects own page.

<!-- more -->

Content down below the `<!-- more -->` will be only visible on the projects page.
```

To create a new project, make a new file under `content/projects/<project name>.md`
The file name will determine the URL, so keep it short and unique.


### Images

put all image files under `/static/img/`. Basic image optimazation will be applied automatically.

TODO: Work out markdown driven image embeds.

### Videos

To embed a Youtube video in a markdown file, use this shortcode.

```
{{ youtube(id="<video id>")}}
```
Further options can be seen in the [Zola docs.](https://www.getzola.org/documentation/content/shortcodes/#shortcodes-without-body)

### Links

Links to resources offsite are normal markdown links. Links between pages on the site take this form.

```
[<the link's text.>](@/<Path from /content/ to the file you want to link to >.md)
```

### Pages

`/content/_index.md` will be rendered to the homepage.

`/conent/education/_index.md` will be rendered to to education page.