#!/bin/sh

echo -e "=== Bare HTML Project Scaffold ==="

echo -e "\033[33;35mProject Name (e.g.: project-name): \033[0m "
read projectName

echo -e "\033[33;35mAngular App Name (e.g.: projectName): \033[0m "
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