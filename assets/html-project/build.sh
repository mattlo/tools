#!/bin/sh

# make css folder
mkdir src/css

# make deps folder (bower)
mkdir src/bower_components

# scss
scss src/scss/main.scss:src/css/main.css

# install/update front end dependencies
bower install
bower update
