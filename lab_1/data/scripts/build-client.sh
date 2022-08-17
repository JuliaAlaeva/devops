#!/bin/bash

projectName=shop-angular-cloudfront
builtFolder=$projectName/dist
builtFile=$builtFolder/client-app.zip

if [[ -e $projectName ]]; then
    git clone https://github.com/EPAM-JS-Competency-center/${projectName}
elif [[ -e $clientBuiltFile ]]
    rm -R $clientBuildFile
    echo "Old built $clientBuildFile has been deleted"
fi

cd $projectName
npm install
ng build --configuration=$ENV_CONFIGURATION --output-path=$builtFolder
7z -tzip $builtFile $builtFolder/*
