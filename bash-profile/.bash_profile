# sets color options
export PS1='\[\033[32m\]\u@\h\[\033[00m\] \[\033[34m\]\w\[\033[00m\]\$ '
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export BLOCKSIZE=1k

# sets useful aliases
alias google-chrome="open -a 'Google Chrome'"
alias safari="open -a 'Safari'"
alias mail="open -a 'Mail'"
alias icloud-drive="open -a Finder ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias lshw="system_profiler SPDiagnosticsDataType SPDisplaysDataType SPHardwareDataType SPMemoryDataType SPStorageDataType SPSoftwareDataType"

function photoshop(){
    if [ -f $1 ]; then
        open -a "Adobe Photoshop CC 2017" $1
    else echo "'$1' does not exist"
    fi
}

# toggles between showing/hiding hidden files
function show-hidden(){
    defaults write com.apple.finder AppleShowAllFiles $1
    killall Finder /System/Library/CoreServices/Finder.app
}

# prints a tree-structure view of the current directory
function tree(){
	pwd
	ls -R | grep ":$" |   \
	sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

# opens a new terminal and ssh to the given netID
function ews-remote(){
    osascript -e 'tell application "Terminal" to do script "ssh '$1'@remlnx.ews.illinois.edu"'
}

# cd is always followed by a ls
cd () {
    builtin cd $1
    ls
}

# prints connection status of a given url
function web-status () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }