#!/bin/bash

projectName=$ROOT_DIR/shop-angular-cloudfront

cd $projectName
eslint --fix --ext .js,.ts .
jest
npm audit
