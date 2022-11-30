---
author: Partoo
title: Hugo Theme Development
date: 2022-11-28
description: A brief guide to how to setup series part 2
---
### Background
I need to organize the study notes in Notion into a technical blog, and finally chose Hugo from Hexo, Hugo, and vuepress, mainly because of its low learning cost and a lot of reference materials.
### Process
Basically, we can start simple development after reading the document. I refer to [Alex Bilz's](https://www.alexbilz.com) great theme - [Anatole](https://github.com/lxndrblz/anatole.git) and add a skills bar component:
![Skills Bar]((https://raw.githubusercontent.com/Partoo/blog/master/static/successbar.png)

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

### Summarize
Hugo is highly mature and stable, but it is still necessary to use [Nuxt](https://nuxt.com/v3) to make some modern single-page applications.