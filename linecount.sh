#linecount.sh
#needs to be a function with a path as input
#should only consider normal files and directories
#report any unreadable files and directories on stderr
function linecount ()
{	echo "Which path?"
	read path
	cd $path
	for file in *; do 
	if [ -f "$file" ];  
	then a=$(wc -l $file | awk '{print $1}'); 
	a_tot=$((a=a+a)); 
	fi; 
	done 
	2> error.txt
	echo "$(<error.txt)"
	echo $a_tot
	return 0
}

#call the function
linecount
