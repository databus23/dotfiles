@echo off
SET DOTFILES=%~dp0

copy %DOTFILES%vimrc %USERPROFILE%\_vimrc /Y
copy %DOTFILES%gvimrc %USERPROFILE%\_gvimrc /Y
xcopy %DOTFILES%vim   %USERPROFILE%\vimfiles /I /E /Y

pause
