#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

ping github.com -c 1 1>2 2>/dev/null

readonly RETURN_STATUS=$?

touch "reports/$(date +%s)_${RETURN_STATUS}"

git add .
git -c user.name='anonymous' \
	-c user.email='anonymous@example.com' \
	commit -m "Report quick save $(date)"

git -c user.name='anonymous' \
	-c user.email='anonymous@example.com' \
	push 1>2 2>/dev/null