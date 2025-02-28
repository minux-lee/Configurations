cp ~/.vimrc ./.vimrc
cp -r ~/.vim ./.vim

cd .vim
find . -name ".git" -type d -exec rm -rf {} \;
cd ..
