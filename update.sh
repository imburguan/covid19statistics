#!/bin/bash

cd /home/pi/projects/covid19statistics/

rm -rf ./covid-19_files/

jupyter nbconvert --to notebook --ExecutePreprocessor.timeout=300 --inplace --execute covid-19.ipynb 

jupyter nbconvert --to markdown --ExecutePreprocessor.timeout=300 --TemplateExporter.exclude_input=True covid-19.ipynb

jupyter nbconvert --to html --ExecutePreprocessor.timeout=300 --TemplateExporter.exclude_input=True covid-19.ipynb

mv covid-19.html index.html

mv covid-19.md README.md

rm -rf *.png

rm -rf *.log

git add .

git commit -m "Automatic Update"

source .env

git push https://$GIT_USER:$GIT_PASSWD@github.com/rdenadai/covid-19-stats.git

export GIT_USER=
export GIT_PASSWD=
