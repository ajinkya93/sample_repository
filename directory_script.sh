#!/bin/bash
cat /dev/null > directory_names
dir=/home/ajiinkkya_93/sample_repository
find $dir -type d > directory_names
count=1
limit=$(cat directory_names | wc -l)
while [ $count -le $limit ]
do
	d=$(sed "${count}q;d" directory_names)
	#echo "$d"
	file_list=$(ls "$d")
	for file in file_list
	do
		if [ -f file ]
		then
			creation_year=$(git log --format=%aD "$file" | tail -1 | awk '{print $4}')
			if [ $creation_year -ge 2016]
			then
				echo "$file" >> /home/ajiinkkya_93/sample_repository/Files_Created_In_Or_After_2016
			fi
		fi
	done
	((count++))
done
#for D in `find . -type d`
#do
#	printf "Directory Name: $D\nContents:\n" >> directory_names
#	ls "$D" >> directory_names
#	printf "\n" >> directory_names
#done
