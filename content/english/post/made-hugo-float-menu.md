---
title: "How to Create A Hugo Float Menu"
date: 2022-12-03T01:46:49+08:00
Description: "Technical articles often belong to a series, and related series of articles need to be displayed for easy browsing when reading these articles. Building a floating menu is the best option."
summary: Technical articles often belong to a series, and related series of articles need to be displayed for easy browsing when reading these articles. Building a floating menu is the best option.
Tags: [hugo]
Categories: [front]
DisableComments: false
---
### Background
Technical articles often belong to a series, and related series of articles need to be displayed for easy browsing when reading these articles. Building a floating menu is the best option.
The effect like [here](/post/series-part-1/), you will see the menu floats nicely on the right side of the page.
### Process
1. First, we need to understand the background of Series in Hugo. "Series is an array of series this page belongs to, as a subset of the series taxonomy; used by the opengraph internal template to populate og:see_also". That means we can use front matter to defin it.
```yml
---
title: My Title
date: 2022-12-02
categories:
  - front
series:
  - mastering-vue3
---
```
2. Then, we create a partial named "series.html":
```html
{{ $related := where .Site.RegularPages ".Params.series" "intersect" .Params.series }}

<div id="series" class="expanded">
  <div id="bar">
    <a id="post_list_btn" class="button"><i id="button_icon" class="fa-solid fa-chevron-right"></i></a>
  </div>
  <div class="post_list" id="post_list">
   <h3>{{ i18n "series_posts" }}</h3>
   <ul>
    {{ range $num,$post := (index .Site.Taxonomies.series (index .Params.series 0 | urlize)).Pages.ByDate }}
    {{ if eq $post.Permalink $.Page.Permalink }}
    <li class="list-group-item active">
      {{ add $num 1 }}: {{i18n "this_post"}}
    </li>
    {{ else }}
    <li class="list-group-item">
      <a href="{{$post.Permalink}}">
        {{ add $num 1 }}: {{ $post.Params.title}}
      </a>
    </li>
    {{end}}
    {{end}}
  </ul> 
</div>
</div>
```
3. Now let's style it.
```sass
#series {
  position: fixed;
  display: flex;
  align-items: center;
  right: 0;
  top: 35%;
  transition: right .5s;
  ul {
    list-style: none;
    padding: 0;
  }
  #bar {
    background-color: t('success');
    border-radius: 0 5px 5px 0;
    padding: 3px;
    color: #fff;
    cursor: pointer;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    a {
      color: #fff;
      &:hover {
        color: #fff !important;
      }
    }
  }
  .post_list {
    margin-left: 8px;
    padding: 5px 10px 20px 5px;
  }
  @include themed() {
    box-shadow: t('shadow');
    border-color: t('primary-light');
    border-radius: 10px 0 0 10px;
    background-color: darken($color: t('accent'), $amount: 2);
    background-image: linear-gradient(45deg, t('accent') 25%, transparent 25%, transparent 75%, t('accent') 75%, t('accent')),
    linear-gradient(-45deg, t('accent') 25%, transparent 25%, transparent 75%, t('accent') 75%, t('accent'));
    background-size: 60px 60px;
  }
}
```
4. Finally wrote the javascript into html file:
```javascript
<script type="text/javascript">
  const do_post_list = () => {
    var post_list = document.getElementById('post_list')
    var list_width = post_list.offsetWidth
    var series_box = document.getElementById('series')
    var icon = document.getElementById('button_icon')

// Actually, we can use localstorage to record the expanded/collapsed state.
    if (series_box.classList.contains('expanded')) {
      series_box.classList.remove('expanded')
      series_box.classList.add('collapsed')
      series_box.style.right = "-" + post_list.offsetWidth + "px"
      icon.style.transform = "scale(-1, 1)"
    } else {
      series_box.classList.remove('collapsed')
      series_box.classList.add('expanded')
      series_box.style.right = 0
      icon.style.transform = "scale(1, -1)"
    }
  }
  document.addEventListener(
    'DOMContentLoaded',
    () => {
      document.getElementById('bar').addEventListener('click', do_post_list, false);
    },
    false,
    )
  </script>
```
As you can see, we built the HTML and use javascript to manipulate the DOM. When we clicking the button, the menu can be collapsed or expanded as we want.

Full code [Here](https://www.github.com/Partoo/blog)