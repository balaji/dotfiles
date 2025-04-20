Import-Module posh-git

Set-Alias g "git"

function gst() {
    g status @Args
}

function ga {
   g add @Args
}
