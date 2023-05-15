#!/bin/bash 

echo -n "Checking seqkit ..."

LATEST_SEQKIT=$(curl -s -H "Accept: application/vnd.github+json" https://api.github.com/repos/shenwei356/seqkit/releases | jq '.[]."tag_name"' -r | sort -r | head -1 | sed 's/^v//')

grep -q ${LATEST_SEQKIT} seqkit/*/BUILD.md

if [ $? == 1 ]; then
    echo " new version available: ${LATEST_SEQKIT}"
else
    echo " up-to-date"
fi

echo -n "Checking BLAST ..."

LATEST_BLAST=$(wget -q ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/VERSION -O-)

grep -q ${LATEST_BLAST} blast/*/BUILD.md

if [ $? == 1 ]; then
    echo " new version available: ${LATEST_BLAST}"
else
    echo " up-to-date"
fi

echo -n "Checking fastqc ..."

LATEST_FASTQC=$(wget -q https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc -O- | grep 'fastqc_v' | grep 'zip' | sed 's/.*fastqc_v//g; s/.zip.*//')

docker run --rm pegi3s/utilities dockerhub_list_repo_with_tags pegi3s/fastqc | grep -q "${LATEST_FASTQC}"

if [ $? == 1 ]; then
    echo " new version available: ${LATEST_FASTQC}"
else
    echo " up-to-date"
fi
