#!/bin/bash

# git remote add github github_as_luleq:luleq/reporter.git

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

ping github.com -c 1 > /dev/null

readonly RETURN_STATUS=$?

touch "reports/$(date +%s)_${RETURN_STATUS}"

git add . > /dev/null
git -c user.name='anonymous' \
	-c user.email='anonymous@example.com' \
	commit -m "Report quick save $(date)" > /dev/null

git push 2&1> /dev/null