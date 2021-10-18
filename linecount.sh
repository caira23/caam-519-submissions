#linecount.sh
#needs to be a function with a path as input
#should only consider normal files and directories
#report any unreadable files and directories on stderr
function linecount ()
{	#asks the user which path they want to use as input
	echo "Which path?"
	read path
	#changes from current directory to given path input
	cd $path
	#loops through all files in the current path/directory
	#uses wc -l $file to get the number of lines in the current file
	#pipe with awk to select just the number and exclude the filename
	#direct number of lines of file to variable a
	#a_tot is the sum of all a values in the loop
	for file in *; do 
	if [ -f "$file" ];  
	then a=$(wc -l $file | awk '{print $1}'); 
	a_tot=$((a=a+a)); 
	fi; 
	done 
	#direct stderr to error.txt file
	2> error.txt
	#print out contents of error.txt file
	echo "$(<error.txt)"
	#print out total number of lines in given path
	echo $a_tot
	return 0
}

#call the function
linecount
