
for i in $(ls -d /Users/ibrahim/Desktop/MyCapstone/commitersCounter/*/); do 

	echo =========== 1 =================;
	echo ${i%%/}; 
	echo ============================; 

	alias proj="cd"${i%%/};
	cd ${i%%/}; 
	
	
	git ls-tree -r --name-only master ./ | grep '\.java$' | while read file ; do
    echo "=== $file" 
    git log --follow --pretty=format:%an -- $file | sort | uniq | wc -l



    committers=$(git log --follow --pretty=format:%an -- $file | sort | uniq | wc -l)

 #    alias proj="cd /Users/ibrahim/Desktop/MyCapstone/commitersCounter/";
	# cd  '/Users/ibrahim/Desktop/MyCapstone/commitersCounter/';
    echo ${i%%/}, $file, $committers  >> /Users/ibrahim/Desktop/MyCapstone/commitersCounter/log.csv

	done




done

