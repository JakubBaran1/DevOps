#!/bin/bash

####################################################################
# Define repository name and remote URLs
repo_name="DevOps"
github_remote_name="github"
github_remote_url="https://github.com/JakubBaran1/DevOps.git"
bitbucket_remote_name="bitbucket"
bitbucket_remote_url="https://agile.fis.agh.edu.pl/bitbucket/scm/~1kokot/devops.git"

####################################################################

# Check if the repository exists locally
if [ ! -d "$repo_name" ]; then
    # If the repository doesn't exist, clone it
    git clone "$github_remote_url"
    cd "$repo_name" || exit
else
    cd "$repo_name" || exit
fi

####################################################################

# Check and add remote
check_and_add_remote() {
    remote_name="$1"
    remote_url="$2"

    # Check if the remote already exists
    if ! git remote | grep -q "^$remote_name$"; then
        # If the remote doesn't exist, add it
        git remote add "$remote_name" "$remote_url"
        #echo "Remote '$remote_name' added."
    #else
        #echo "Remote '$remote_name' already exists."
    fi
}

####################################################################

### Invoke check_and_add_remote function to add remotes if not exist

# GitHub 
check_and_add_remote "$github_remote_name" "$github_remote_url"

# Bitbucket 
check_and_add_remote "$bitbucket_remote_name" "$bitbucket_remote_url"
