#!/bin/bash
# get the current branch and push
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
commit_message="$1" 
if [[ -z "${commit_message// }" ]] #if no commut message is supplied, output helpful error message and exit.
	then
		echo "Error, No commit message supplied! Exiting pipeline..."
		exit
fi
echo "(2) Test number: (Code that is being tested, for example unit  tests go here.)"
#add unit test commands

echo "(3) Committing to the repo."
#Git commands go here
git add . 
git commit -m "$commit_message"
git push

echo "(4) Deploying the application."
#Deployed to AWS
npm run start
