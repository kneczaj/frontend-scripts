#!/usr/bin/env bash

# check for changes
UNCOMMITED_CHANGES=`git status -uno --porcelain=v1 2>/dev/null | wc -l`
GENERATE_COMMAND="${@:2}"
COMMIT_MESSAGE=$1

if [ $UNCOMMITED_CHANGES -gt 0 ]; then
  echo "There are uncommited changes in your code."
  echo "Stashing changes..."
  git stash
fi

${GENERATE_COMMAND}

SCHEMA_CHANGES=`git status --porcelain=v1 2>/dev/null | wc -l`

if [ $SCHEMA_CHANGES -gt 0 ]; then
  echo "Committing the generated changes as '${COMMIT_MESSAGE}'..."
  git commit -a -m "${COMMIT_MESSAGE}"
fi

if [ $UNCOMMITED_CHANGES -gt 0 ]; then
  echo "Reverting previously uncommited changes to your code with git stash."
  git stash pop
fi
