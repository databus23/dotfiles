@echo off
SET DOTFILES=%~dp0
cd %DOTFILES%
git submodule init
git submodule update

copy %DOTFILES%vimrc %USERPROFILE%\_vimrc /Y
copy %DOTFILES%gvimrc %USERPROFILE%\_gvimrc /Y
copy %DOTFILES%gitconfig %USERPROFILE%\.gitconfig /Y
xcopy %DOTFILES%vim   %USERPROFILE%\vimfiles /I /E /Y

git config --file=%USERPROFILE%\.gitconfig.local core.editor "'C:/Program Files (x86)/Vim/vim74/gvim.exe' --nofork '%%*'"
pause
