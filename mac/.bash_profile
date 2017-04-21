
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
	cat ~/.bash_history | egrep -E $@ | sed -n 1p
}
# deleted commentt checking launch daemon ok
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


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
