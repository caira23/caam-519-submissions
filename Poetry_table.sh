#Poetry_table.sh

#help message
echo "Do you need help?"
read Answer

if [ "$Answer" == "Yes" ] || [ "$Answer" == "yes" ] 
then
	echo "Poetry program generates a table that contains student number correlated with the first verse of their favorite poem and then the first seven characters of that first verse."

fi


#separate out the Student# values
awk '/tudent/' poetry.txt > Student_ID.txt

#separate out the full poem verses
awk '/Poem/' poetry.txt | cut -c 7- poetry.txt > verse.txt

awk '$1 !~ /^t/ && $1> 0' verse.txt > verse2.txt

#separate out the first 7 characters of the verses
cut -c -7 verse2.txt > seven.txt

#combine the files into one
paste -d "|" Student_ID.txt verse2.txt seven.txt > kindof_table.txt

#use awk to make like a table
awk 'BEGIN {FS="|"; print "Student_ID\t\tFav_Poem\t\t\t\tFirst_Seven"; }
{print $1,"\t\t",$2,"\t\t\t\t",$3;}
END {print "Complete" }' kindof_table.txt 
