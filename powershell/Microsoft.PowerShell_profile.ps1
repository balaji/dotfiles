Set-Alias g "git"

function gst() {
    g status @Args
}

function ga {
   g add @Args
}

Set-PSReadLineOption -EditMode Emacs
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (&starship init powershell)
