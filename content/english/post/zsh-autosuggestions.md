+++
title = "How to make ZSH auto-suggestions"
date = "2022-12-01"
summary = "ZSH is a very popular shell. This post we will add the auto-suggestions plugin on it."
tags = [
    "shell",
    "zsh"
]
+++

### Background
ZSH is a very popular Unix shell built on top of bash, and the Bash shell will ultimately be dropped from the macos core. I chose to use [oh-my-zsh](https://ohmyz.sh/#install) and customize the color style. Here is a record of the plugin usage using auto-suggestions as an example.
### Process
Install ```zsh-autosuggestions``` very easy, you can [view here](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md), below are my steps:
1. Download the plugin to oh-my-zsh default plugins folder:
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
2. Add the plugins:
```shell
# in ~/.zshrc
plugins=( 
    zsh-autosuggestions
)
```
Don't forget excute 
```shell
source ~/.zshrc
```
3. Now you can use it! But if you want to use "TAB" key to choose, need to add keybind in .zshrc file:
```shell
bindkey '\t' end-of-line
```
Remember "source" the file let it available.
Preview:
![preview](https://raw.githubusercontent.com/Partoo/blog/main/static/images/terminal.jpg)
My plugin list:
```shell
plugins=(
    colored-man-pages
    zsh-autosuggestions
    colorize
    git
    sudo
    vi-mode
    z
)
```
### Summarize
Command-line tools are loved by many developers because of their powerful functions, and the products are becoming more and more abundant, such as the recently popular [Fig](https://fig.io/). However, using oh-my-zsh can make some personalized adjustments to suit my preferences 😄.

