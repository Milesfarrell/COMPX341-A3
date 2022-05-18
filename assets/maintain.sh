
# store all the ts files in the directory into an array of paths.
files=( $(find . -type f -name "*.ts") )

# then replace each ts file with my student ID and name.
for f in "${files[@]}"
do 
#TODO: Maybe use &f in echo to show whats being edited?
   echo "Files are being edited."
   sed -f '1d' $f
   sed -f '1i //Full Name: Miles Farrell, ID Number: 1269393' $f
done

# commit then push the updates to github.
#git add .
#git commit -m "Commit using CI/CD to Maintain Files."
#git push
