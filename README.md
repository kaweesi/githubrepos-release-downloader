Github repositories latest release downloader
______________________________________________
This is a simple script that uses curl and jq (added shell tools) to download attached files from the latest github release or a provided specific version if set.
By default it runs for the Rwanda Upgraded OpenMRS modules, to change the repos edit repos.json file maintaining its json format
It assumes that the releases are managed on github including its binary or attached downloadable files, for each used extension this script expects to find one binary downloadable file to pull it from github

Requirements:
_________________
+ Shell/terminal access (unix based system such as ubuntu or osx)
+ Install curl (sudo apt-get install curl on ubuntu or brew install curl on osx)
+ Install jq (sudo apt-get install jq or brew install jq on osx)
+ Add your repos and repo owners in repos.json file
+ Run downloader.sh file using bash downloader.sh

Usage
__________________
bash downloader.sh .omod where .omod is the final extension point of the release binary files to be downloaded

References:
___________________
+ https://stedolan.github.io/jq/download/