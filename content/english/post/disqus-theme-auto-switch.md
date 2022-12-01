---
title: Make Disqus Auto-Switch theme
date: 2022-12-01
description: Reloading a Disqus thread within an AJAX application
tags:
    - hugo
    - disqus
categories:
    - front
---
### Background
Disqus Management supply "Color scheme" options to choose, but how to auto switch light/dark mode like this site? It's very easy to implement.
### Process
1. Firstly, login disqus dashboard and click "Settings" - "General" tab, choose "auto" in "Color Scheme" options.
2. Locate to your theme-switcher event, add code snippet below:
```javascript
{
    if (typeof DISQUS !== 'undefined') {
    DISQUS.reset({
      reload: true,
      config: window.disqus_config
    })
  }
}
```

Hugo intergrated Disqus already, so you can invoke 'window.DISQUS' in your javascript.

3. Full code:
```javascript
const getStoredThemeStyle = () => localStorage.getItem('theme');

const setThemeClass = (style) => {
  const html = document.documentElement;
  const prevTheme = [...html.classList].find((c) => c.match(/theme--(light|dark)/));
  if (!prevTheme) return;
  html.classList.remove(prevTheme);
  html.classList.add(`theme--${style}`);
};

const setThemeStyle = (style) => {
  localStorage.setItem('theme', style);
  setThemeClass(style);
};

const switchTheme = () => {
  const currThemeStyle = getStoredThemeStyle();
  // const e = new Event('themeChanged')
  // document.dispatchEvent(e)

  switch (currThemeStyle) {
    case 'light':
      setThemeStyle('dark');
      break;
    case 'dark':
      setThemeStyle('light');
      break;
    default:
      setThemeStyle('dark');
      break;
  }
  if (typeof DISQUS !== 'undefined') {
    DISQUS.reset({
      reload: true,
      config: window.disqus_config
    })
  }
};

document.addEventListener(
  'DOMContentLoaded',
  () => {
    const themeSwitcher = document.querySelector('.themeswitch');
    themeSwitcher.addEventListener('click', switchTheme, false);
  },
  false,
);

window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', switchTheme, false);

const currThemeStyle = getStoredThemeStyle();
if (currThemeStyle) {
  setThemeStyle(currThemeStyle);
} else {
  const userPrefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
  if (userPrefersDark) {
    setThemeStyle('dark');
  }
}

```

You can click [Github](https://github.com/Partoo/blog/blob/main/assets/js/theme-switcher.js)

### Summarize
Hugo intergrated Disqus already. We can create a theme-switch event and reloads the Disqus theme on time.  When you trigger theme switching event, Disqus will intelligently provide corresponding color scheme according to the color of your current page text.