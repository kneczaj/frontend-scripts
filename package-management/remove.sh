#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
YARN_ARGS="${@:1}"
LABEL=${CONTEXT-""}
COMMIT_MESSAGE="[PackageRemove]${LABEL} ${YARN_ARGS}"

${SCRIPT_DIR}/generate_commit.sh "${COMMIT_MESSAGE}" yarn remove ${YARN_ARGS}
