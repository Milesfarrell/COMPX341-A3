#!/bin/bash
# get current branch and push
current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

# git pull
git pull origin "$current_branch"
echo "(0) Preparing pipeline by running npm install."
npm install
echo "(1) Building/Compiling the application."
if npm run build; then
	echo "Build Successful."
else
	echo "Build Failed, exiting pipeline."
	exit
fi
#argument for commit message
#commit_message ="$1" 
#if [[ -z "${commit_message// }" ]]
#	then
#		echo "No commit message supplied!"
#fi
echo "(2) Test number: (Code that is being tested, for example unit  tests go here.)"
#add unit test commands

echo "(3) Committing to the repo."
#Git commands go here
git add . 
git commit -m "COMPX341-22A-A3 Commiting from CI/CD Pipeline"
git push

echo "(4) Deploying the application."
#Deployed to AWS
npm run start
