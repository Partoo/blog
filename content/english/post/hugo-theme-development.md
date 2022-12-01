---
title: How to make a skills-bar in your Hugo theme
date: 2022-11-28
description: How to make a skills-bar in your Hugo theme
tags:
    - hugo
categories:
    - front
thumbnail: https://raw.githubusercontent.com/Partoo/blog/main/static/images/skillsbar.jpg
thumbnailPosition: right
---
### Background
I need to organize the study notes in Notion into a technical blog, and finally chose Hugo from Hexo, Hugo, and vuepress, mainly because of its low learning cost and a lot of reference materials.
### Process
Basically, we can start simple development after reading the document. I refer to [Alex Bilz's](https://www.alexbilz.com) great theme - [Anatole](https://github.com/lxndrblz/anatole.git) and add a skills bar component:

1. First we need to create a json data and place it to "data" folder:
```json
{
    "HTML": {
        "color": "#188e49",
        "score": 95
    },
    "CSS": {
        "color": "#0d91a5",
        "score": 95
    },
    "JavaScript/Vue": {
        "color": "#e44d49",
        "score": 90
    },
    "PHP/Laravel": {
        "color": "#916626",
        "score": 90
    },
    "JAVA/SpringBoot": {
        "color": "#333d72",
        "score": 80
    }
}
```
2. Add the snippet into about.md:
```html
<div class="post__content skills">
      <h1>{{ i18n "skills" }}</h1>
      {{ $map:=($.Site.Data.skills)}}
        {{range $key, $val :=$map }}
        <div id="skillbar">
          <div class="box" style="background-color:{{$val.color}}; width:{{$val.score}}%">
            <span class="name">{{$key}}</span>
            <span class="score">{{$val.score}}%</span>
          </div>
        </div>
      {{end}}
    </div>
```
3. Style it:
```sass
#skillbar {
    @include themed {
        color: #fff;
        background-color: rgb(114, 114, 114);
    }
    .box {
        padding: 8px;
        margin: 10px 0;
        display: flex;
        justify-content: space-between;
    }
}
```
4. Make a "partial" to reuse:
Simply snippet can use "shortcode", just easy to place the code snippet to "shortcode" folder then we can use it where the file in "content" folder. 
We also can use "partial", it more functionally:
Create a file named "skillbar.html" in "layouts/partials" folder and paste the code in step 2 to it: 
```html
<div class="post__content skills">
      <h1>{{ i18n "skills" }}</h1>
      {{ $map:=($.Site.Data.skills)}}
        {{range $key, $val :=$map }}
        <div id="skillbar">
          <div class="box" style="background-color:{{$val.color}}; width:{{$val.score}}%">
            <span class="name">{{$key}}</span>
            <span class="score">{{$val.score}}%</span>
          </div>
        </div>
      {{end}}
    </div>
```
Then we can use it by `{{partial "skillsbar" .}}` anywhere.
### Deploy
There are many deployment schemes, using netify, github page, etc., I choose to use custom domain name + github page + cloud flare.
I wrote a bash called deploy.sh to simplify deployment
```bash
#!/bin/bash -e
cd /yourLocalDevFolder && hugo --minify
commit_message="$1"
git add .
git commit -m "$commit_message"
git push -u origin main
```
You can run the shell command with commit description as the parameter to push file to github. Also, you can add an alias to .zshrc/.bashrc to reduce operating procedures further.
```
alias ttd="cd /projectFolder && bash deploy.sh
```
After wrote a post, just run:
```bash
ttd "post a new article about bash"
```

### Summarize
Hugo is highly mature and stable, but it is still necessary to use [Nuxt](https://nuxt.com/v3) to make some modern single-page applications.