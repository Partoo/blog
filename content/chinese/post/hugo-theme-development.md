---
author: Partoo
title: Hugo主题开发心得
date: 2022-11-28
description: Hugo主题开发心得
thumbnail: https://raw.githubusercontent.com/Partoo/blog/main/static/images/skillsbar.jpg
---
### 背景
很久没有写技术博客了，这段时间想把在Notion中的一些笔记整理出来，于是在Hexo、Hugo、VuePress中进行了选择，最终决定使用Hugo。
### 开发流程
开发还是非常简单的，查看官方文档了解一下基本概念就可以上手了。我参考了 [Alex Bilz's](https://www.alexbilz.com) 的一个不错的主题 - [Anatole](https://github.com/lxndrblz/anatole.git) 并且自己加上一个Skills Bar的功能：

1. 首先在“data”目录下创建一个json文件用来存放相关数据:
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
2. 在 about.md 文件中添加下列代码:
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
3. 样式文件:
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
4. 做成组件以重复使用:
简单的调用可以使用"shortcode", 不过仅限于content目录下的文件，最好做成"partial"，在 layouts/partials 文件夹下创建一个"skillbar.html" 之后把第2步的代码复制进来: 
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
这样就可以在任意地方通过 `{{partial "skillsbar" .}}` 进行调用了
### 部署
有很多种部署方案，netify/github pages 等等，我选择使用cloud flare + github pages，然后绑定自己的域名。这部分很简单，也都有相关的说明文档。

### 总结
Hugo 是成熟度很高的一款产品，也非常稳定，不过如果想做一些例如SPA之类的现代页面还是使用 [Nuxt](https://nuxt.com/v3) 更好，这也是我日后的一个小目标。