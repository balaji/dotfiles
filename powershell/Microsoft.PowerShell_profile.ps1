Import-Module posh-git

Set-Alias g "git"

function gst() {
    g status @Args
}

function ga {
   g add @Args
}

Set-PSReadLineOption -EditMode Emacs
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\pure.omp.json" | Invoke-Expression
