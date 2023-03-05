
#!/bin/bash

#directory for analysis
directory=$1
echo "The content of directory - $directory ."
echo "Amount of directories = " 
ls -d $directory*/ 2>>/dev/null  | wc -l
ls -d $directory*/ 2>>/dev/null
echo "Amount of files = " 
find $directory -maxdepth 1 -type f | wc -l
find $directory -maxdepth 1 -type f 

