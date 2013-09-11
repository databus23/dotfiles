@ECHO OFF
powershell.exe -Command "$a,$b,$c,$d,$f=(cat %~f0);$params='%~f0 %*' -split 's+';$f|Out-String|iex"
pause
EXIT /B

function temp_location($url)
{
  $url -match "([^/?]+)(\?|$)" > $null
  return "$env:TEMP\$($matches[1])"
}

function programm_files
{
  if (${env:ProgramFiles(x86)}) {${env:ProgramFiles(x86)}} else {${env:ProgramFiles}}
}

function getfile($url, $filename)  
{ 
  Write-Host "Downloading $url to $filename"
  $wc = New-Object System.Net.WebClient   
  $wc.DownloadFile($url, $filename)
  Write-Host "Download finished"     
  $wc.Dispose()      
}

function install_git
{
  if (Test-Path "$(programm_files)\Git\Cmd\git.exe") {
    Write-Host "Git already installed"
    return
  }
  Write-Host "Installing Git"
  $git_installer_url = "http://msysgit.googlecode.com/files/Git-1.8.3-preview20130601.exe"
  $dest = temp_location $git_installer_url
  getfile $git_installer_url $dest
  Write-Host "Executing $dest"
  Start-Process "$dest" -ArgumentList "/verysilent", "/norestart" -Wait
  Write-Host "Installation finished"
}

function install_vim
{
  where.exe gvim.bat /Q
  if ($?) {
    Write-Host "Vim already installed"
    return
  }
  Write-Host "Installing vim"
  $vim_url = "ftp://ftp.vim.org/pub/vim/pc/gvim74.exe"
  $dest = temp_location $vim_url
  getfile $vim_url $dest
  Write-Host "Executing $dest"
  Start-Process $dest -Wait
}

install_git
install_vim