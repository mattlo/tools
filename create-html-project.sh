#!/bin/sh

echo "=== Bare HTML Project Scaffold ==="

echo "Project Name (e.g.: project-name):"
read projectName

echo "Angular App Name (e.g.: projectName):"
read angularProjectName

if [ "$projectName" != "" ] 
then
	git init $projectName
	cd $projectName
	printf '# %s\n\n' $projectName $projectName > README.md;
	git add .
	git commit -m 'added bare README'

	cp -r /Users/mlo/tools/assets/html-project/. ./

	sed -i '' "s/PROJECT_NAME/$angularProjectName/g" "./src/views/index.html"
	sed -i '' "s/PROJECT_NAME/$angularProjectName/g" "./src/js/config.js"
	sed -i '' "s/PROJECT_NAME/$angularProjectName/g" "./src/js/bootstrap.js"

	sh -x build.sh
fi

echo -e "\n\033[33;32mDone \033[0m"