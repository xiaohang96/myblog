hexo generate
cp -R public/* .deploy/xiaohang96.github.io
cd .deploy/xiaohang.github.io
git add .
git commit -m ¡°update¡±
git push origin master