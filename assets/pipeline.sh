
echo "(0) Preparing pipeline by running npm install."
npm install
echo "(1) Building/Compiling the application."
if npm run build; then
	echo "Build Successful."
else
	echo "Build Failed, exiting pipeline."
	exit
fi

echo "(2) Test number: (Code that is being tested, for example unit  tests go here.)"
#add unit test commands

echo "(3) Committing to the repo."
#Git commands go here
git pull
git add .
git commit -m “COMPX341-22A-A3 Commiting from CI/CD Pipeline”
git push
git status

echo "(4) Deploying the application."
#Deployed to AWS
npm run start
