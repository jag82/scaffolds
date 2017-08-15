#Run this file if you're creating a new project from a scaffold.
#If you're working on the scaffold itself, DO NOT run this file.

#validate arguments
if [ $# -eq 0 ]
then
	echo 'expected a project name as argument: ./init.sh myProject'l
	exit 1;
fi

#reassign arguments to meaningful variable names
PROJECT_NAME=$1;




#*find* all files and then used *sed* replace all placeholders with real values 
find . -type f \( -iname "*" ! -iname "init.sh" \) -exec sed -i "s/!projectName!/$PROJECT_NAME/g" {} \;

#clear scaffolding README.md
echo "#$PROJECT_NAME" > README.md

#delete .git because we are not continuing development on the scaffold
rm -rf .git

#intialize a new git repo because this should be a new project
git init

echo "Project $PROJECT_NAME initialized from scaffold." 
echo "Remember to set up a remote repo if needed."
echo "Deleting initialization script (init.sh)."

#finally, delete this file
rm init.sh