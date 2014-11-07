@ECHO Ready to symlink dotfiles into: %USERPROFILE%
@PAUSE


MKLINK %USERPROFILE%\.gitconfig "%~dp0"git\gitconfig
MKLINK /d %USERPROFILE%\.vim "%~dp0"vim
MKLINK %USERPROFILE%\.vimrc "%~dp0"vim\vimrc

@ECHO.
@ECHO All done.
@PAUSE