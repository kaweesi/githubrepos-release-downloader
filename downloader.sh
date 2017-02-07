#!/bin/bash

GITHUB_REST_API="https://api.github.com"
GITHUB_REST_REPOS_API="$GITHUB_REST_API/repos"
EXTENSION=$1
REPOS_FILE="repos.json"

echo ""
echo "WARNING: Github limits the number of times its API is accessed daily for your IP, try with a different IP when that happens"
echo ""

downloadExtension() {
	REPO_OWNER=${1//\"}
	REPO=${2//\"}
	VERSION=${3//\"}
	
	if [ -z "$VERSION" ]; then
		URL=$GITHUB_REST_REPOS_API/$REPO_OWNER/$REPO/releases/latest
	else
		URL=$GITHUB_REST_REPOS_API/$REPO_OWNER/$REPO/releases/tags/$VERSION
	fi
	DOWNLOAD_URL=`curl -s $URL | jq -r ".assets[] | select(.name | test(\"$EXTENSION\")) | .browser_download_url"`
	
	
	if [ ! -z "$DOWNLOAD_URL" ]; then
		echo ""
		echo "Downloading:::: $DOWNLOAD_URL"
		echo ""
		curl -O "$DOWNLOAD_URL";
	fi
}

jq -c '.[]' $REPOS_FILE | while read i; do
    downloadExtension `echo $i | jq '.owner'` `echo $i | jq '.repo'` `echo $i | jq '.version'` 
done