#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Please give the commit message. Aborting!"
    exit
fi

#ignore large files. note it appends to gitignore. It might be huge.
find ./* -size +100M | sed 's|^./||'| cat >> .gitignore


#### example
# echo "hrnet/data" >> .gitignore
# echo "!hrnet/data/list" >> .gitignore


echo "dynaboa/Outputs" >> .gitignore

echo "__pycache__/" >> .gitignore
echo "*.pyc" >> .gitignore
echo "*.ipynb_checkpoints" >> .gitignore
echo "*.so" >> .gitignore
echo "*.DS_Store" >> .gitignore
echo "*._*" >> .gitignore
echo "*.egg" >> .gitignore


#push using the git command
git add -A
git commit -m "$1"
git push