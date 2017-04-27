# set color options
export PS1='\[\033[32m\]\u@\h\[\033[00m\] \[\033[34m\]\w\[\033[00m\]\$ '
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export BLOCKSIZE=1k

# set useful aliases
alias google-chrome="open -a 'Google Chrome'"
alias safari="open -a 'Safari'"
alias mail="open -a 'Mail'"
alias icloud-drive="open -a Finder ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias lshw="system_profiler SPDiagnosticsDataType SPDisplaysDataType SPHardwareDataType SPMemoryDataType SPStorageDataType SPSoftwareDataType"

# print a tree-structure view of the current directory
function tree(){
	pwd
	ls -R | grep ":$" |   \
	sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}
