#!/bin/bash
find . -name \*.aux -type f -delete
find . -name \*.fdb_latexmk -type f -delete
find . -name \*.fls -type f -delete
find . -name \*.log -type f -delete
find . -name \*.nav -type f -delete
find . -name \*.out -type f -delete
find . -name \*.snm -type f -delete
find . -name \*.synctex.gz -type f -delete
find . -name \*.toc -type f -delete
find . -name \*.vrb -type f -delete

