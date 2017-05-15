alias 😆='\echo 'HAHAH''
alias ls='\ls -ltr'
export DELOREAN_PATH=/Users/joshua-apple/Documents/Work/delorean 
export your_opendirectory_username=joshua_mccloskey
export your_appleconnect_username=joshua.mccloskey

export CMAKE_C_COMPILER=/usr/bin/gcc
export C=/usr/bin/gcc

export CMAKE_CXX_COMPILER=/usr/bin/g++
export CXX=/usr/bin/g++
function execHist(){
	command="$(history | tail -n2 | sed -n 1,1p | sed -E s/[0-9]+/' '/)"
	repeat=$@
	echo $command
	echo "repeating $command every $repeat seconds"
	repeatLastCommand.js $repeat "$command"
}
# deleted commentt checking launch daemon ok

function linesOfCodeMatchingRegex(){
	echo "Counting lines of javascript code!";
	totalLines="$(find ./ -regex ".$@$"  | xargs cat | wc -l)"
	echo "Total lines for $PWD : $totalLines";

	echo "Counting lines of top level directories";

	topDirs="$(find . -maxdepth 1)"
	for topDir in $topDirs
	do
		    topDirLine="$(find topDir -regex ".$@$"  | xargs cat | wc -l)"
		    printf "Total lines(JS) in %30s : %10s\n" $topDir,$topDirLine
    	done
}
# kill a process
function jkill(){
	ps ax | grep $@ | sed -Ee 's/([0-9]+).*/\1/' | sed -n 1p | xargs kill
	echo "GOOD SHOT"
}
# figure out who changed what line of code
function whoDoneIt(){
	git blame $1 -L $2
}
# you'll never guess what this does
function gitCreateBranch(){
	git checkout master
	git pull
	git checkout -b $@ 
}
# deletes all branches that are merged with master ( except of course master itself)
function gitCleanMergedBranches(){
	git branch --merged master | egrep -v 'master' | xargs git branch -D
}
function gsl(){
	git stash list
}
function gl1(){
	git log --oneline
}
function gs(){
	git status
}
# git change branch
# takes a regexp in order to decide which one to match
function gcb(){
	git branch | egrep "$@" | xargs git checkout
}
# lists the current branch you are in
function gb(){
	git branch | egrep '\*.*' | egrep -o "[^*]+"
}
function gitPushToBranch(){
	gb | xargs git push origin
}
# resets all files to match master
function gitCheckResetAll(){
	git status | sed -E 's/.*:(.*)/\1GRAB/' | egrep 'GRAB' | sed -E 's/GRAB//' | xargs git checkout --
}
function sd(){
	saveDir=$PWD
}
function bd(){
	curr=$PWD
	cd $saveDir
	saveDir=$curr
}
function cd(){
	saveDir=$PWD
	builtin cd "$@" && ls
}

function pscpu(){
	 top -o cpu -O +rsize -s 5 -n 20
}
# Thanks https://martinfitzpatrick.name/article/add-git-branch-name-to-terminal-prompt-mac/
# Git branch in promp.
parse_git_branch() {
	    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\e[34m\]\$(parse_git_branch)\[\e[0m\] $ "
export col_green='\e[42m'
export col_red='\e[41m'
export col_blue='\e[44m'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
