
# store all the ts files in the directory into an array of paths.
files=( $(find . -type f -name "*.ts") )

# then replace each ts file with my student ID and name.
for f in "${files[@]}"
do 
#TODO: Maybe use &f in echo to show whats being edited?
   echo "File $f is being edited."
   sed -i '1d' $f
   sed -i '1i //Full Name: Miles Farrell, ID Number: 1269393' $f
done

# commit then push the updates to github.
git add .
git commit -m "COMPX341-22A-Maintenance commit message."
git push
