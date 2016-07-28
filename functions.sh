#/bin/bash


function bashreload() {
	if [ -f ~/.bash_profile ]; then 
		source ~/.bash_profile
	else
		if [ -f ~/.bashrc ]; then
			source ~/.bashrc
		fi
	fi	
}

function cs {
	
	cd "$@" && ll;
}

function cdl()
{
	if [ "$#" -ne 1 ]; then
		
		echo "Illegal number of parameters"
		
		return
		
	fi
	
	if [[ "$1" == *"."* ]]; then
	
		echo "Illegal character in folder name"
		
		return
		
	fi
		
	cd "$1"
	
	target="./"
	
	if test "$(ls -A "$target")"; then
	    ll
	else
	    echo The directory $target is empty '(or non-existent)'
	fi
}

function mcd()
{
	if [ $# -ne 1 ]; then
		return
	fi
	
	if [[ ! "$1" =~ [^0-9a-z-] ]] ; then  
	    echo "Valid String"; 
	else 
		echo "String not valid";
		return
	fi
	
	mkdir -p "$1"
	
	if [ $? -ne 0 ] ; then
	    echo "Directory not created.";
	    return
	else
	
		echo "Directory created";
		cd "$1";
		pwd;
		ll;
	fi
}

function up()
{
	cd ..
	ll;
}


oi()
{
	if [ $# -lt 1 ]; then
		return
	fi
	
	if hash git 2>/dev/null; then
		
	else
		echo "Git is not installed"
		return
	fi
	
	git_string=""
	i=0
	
	for var in "$@"
	do
		if [ $i -eq 0 ]; then
			git_string="$var"
		else
			git_string="$git_string $var"
		fi
		i=$((i+1))
	done
	
	git_string="\"$git_string\""
	
	git commit -am "$git_string"
	
}