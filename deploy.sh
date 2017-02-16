#!/bin/bash
MODELNAME="$(sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)"
MODELVERS="$(sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)"
MODELSRC="$(basename `pwd`)"
AUTHORNAME="Ajayi"
AUTHOREMAIL="boraton2010@gmail.com"
RENDERDIR="../new_version"
GITURL="https://github.com/boratonAJ/Logistic-Regression.git"

git remote set-url origin $GITURL
git checkout master
git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

Rscript -e 'rmarkdown::render("README.Rmd", output_format = rmarkdown::github_document(), output_dir="docs")'

git add .
git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
