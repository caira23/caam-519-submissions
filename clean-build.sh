#takes as input a project name which is "project". Then the script needs to make a hidden directory in the current directy named .build. Then it needs to compile project.tex using pdflatex so all auxiliary build files are contained in .build directoy but project.pdf is contained in the original directory. Then commit this script to caam-519-submissions/homework-2

instructions()
{
	#read project name as input
	echo "What is the project name?"
	read ProjectName
	echo "The project's name is $ProjectName"

	#make hidden directory named .build
	#make directory first
	mkdir build 
	echo "made build directory"

	#rename/move the directory into hidden version
	mv build .build
	echo "hidden .build made"
	
	#cd to .build directory
	cd .build
	echo "cd .build"
	
	#create latex doc
	touch $ProjectName.tex
	echo "tex doc created"

	#put stuff in it
	echo "cat is used to fill the tex file. put the tex preamble and content. don't forget begin and end doc"
	cat > $ProjectName.tex

	#run latex to produce .dvi file as output
	latex $ProjectName.tex

	#compile project.tex
	pdflatex $ProjectName.tex

	#move pdf from .build to original directory
	mv $ProjectName.pdf /mnt/c/Users/caira

	echo "done"
	return 0
}

#call instructions function
instructions
