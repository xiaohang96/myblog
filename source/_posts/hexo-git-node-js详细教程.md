---
title: hexo+git+node.js详细教程
date: 2016-07-25 21:22:40
tags:
 教程
---
这里默认安装了git+github；
#### 安装Hexo

``` bash
$ cd d:/hexo
$ npm install hexo-cli -g
$ hexo init blog
$ cd blog
$ npm install
$ hexo g # 或者hexo generate
$ hexo s # 或者hexo server，可以在http://localhost:4000/ 查看
```

这里有必要提下Hexo常用的几个命令：
hexo generate (hexo g) 生成静态文件，会在当前目录下生成一个新的叫做public的文件夹
hexo server (hexo s) 启动本地web服务，用于博客的预览
hexo deploy (hexo d) 部署播客到远端（比如github, heroku等平台）
另外还有其他几个常用命令：

$ hexo new "postName" #新建文章
$ hexo new page "pageName" #新建页面
常用简写

$ hexo n == hexo new
$ hexo g == hexo generate
$ hexo s == hexo server
$ hexo d == hexo deploy
常用组合

$ hexo d -g #生成部署
$ hexo s -g #生成预览
现在我们打开http://localhost:4000/ 已经可以看到一篇内置的blog了。
![这是一张图片](/images/image.jpg)

### Github Pages设置
推荐教程：
https://pages.github.com/
在这里我创建了一个github repo叫做 xiaohang96.github.io. 创建完成之后，需要有一次提交(git commit)操作，然后就可以通过链接http://xiaohang96.github.io/ 访问了。

### 部署Hexo到Github Pages

使用git命令行部署
不幸的是，上述命令虽然简单方便，但是偶尔会有莫名其妙的问题出现，因此，我们也可以追本溯源，使用git命令来完成部署的工作。

#### clone github repo

``` bash
$git init
$ cd d:/hexo/blog
$ git clone https://github.com/xiaohang96/xiaohang96.github.io.git .deploy/xiaohang96.github.io
```
将我们之前创建的repo克隆到本地，新建一个目录叫做.deploy用于存放克隆的代码。
创建一个deploy脚本文件
``` bash
hexo generate
cp -R public/* .deploy/jiji262.github.io
cd .deploy/jiji262.github.io
git add .
git commit -m “update”
git push origin master
```
简单解释一下，hexo generate生成public文件夹下的新内容，然后将其拷贝至github.io的git目录下，然后使用git commit命令提交代码到github.io这个repo的master branch上。

需要部署的时候，执行这段脚本就可以了（比如可以将其保存为deploy.sh）。
命令行输入： sh deploy.sh
执行过程中可能需要让你输入Github账户的用户名及密码，按照提示操作即可


