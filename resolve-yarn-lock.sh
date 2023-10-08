#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
REPO_DIR="$(git rev-parse --show-toplevel)"
cd $REPO_DIR
CONFLICTED="$(git diff --name-only --diff-filter=U --relative | grep "yarn\.lock")"

if [ -z "$var" ]
then
  echo "No conflicted yarn.lock"
  exit 1
fi

for f in $CONFLICTED
do
	FILE_PATH=${REPO_DIR}/${f}
	echo $FILE_PATH
	YARN_LOCK_DIR="$(dirname "${FILE_PATH}")"
	echo $YARN_LOCK_DIR
	git restore --staged ${FILE_PATH}
	git restore ${FILE_PATH}
	cd ${YARN_LOCK_DIR}
	yarn
	git add $FILE_PATH
	cd $REPO_DIR
done

echo "Fixed yarn.lock conflicts"
