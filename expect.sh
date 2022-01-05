#!/bin/bash
set -e

[ $# -eq 2 ] || (echo invalid parameter count "$#": "$@" && exit 1)

cleanup() {
  LOCATION="$(pwd)"
  LOCATION="${LOCATION%testdir*}"
  cd "$LOCATION"
  if [ -d testdir ]; then
    rm -rf testdir
  fi
  sleep 1
  echo "::endgroup::"
}
trap cleanup EXIT

echo "::group::Commits like \"$1:...\" generate $2 releases" 

# Compute the branch
if [ -z "$BRANCH" ]; then
    BRANCH="$(git rev-parse --abbrev-ref HEAD)"
fi
echo "Running on branch $BRANCH"
[ -n "$BRANCH" ]

# Verify that grep can work
echo 'Checking grep support for PERL Regex' | grep -P '\sPERL\s'

# Create the repository structure
echo "initializing a new repository"
mkdir -p testdir
sed -n "/### TEST ###*/q;p" .releaserc.yml > "testdir/.releaserc"
cp package.json testdir/

# Install the required npm stuff
cd testdir
npm install
rm package.json

# Initialize the repository
git init -b "$BRANCH"
git config user.email "noreply@danilopianini.org"
git config user.name "test bot"
git commit --allow-empty -m 'initial commit'
git tag -a '1.0.0' -m 'example tag'

# Create the test commit
echo testing that commit message \""$1: something"\" generates a release of type \""$2"\"
git commit --allow-empty -m "$1: something"

# Run semantic-release
COMMAND="npx semantic-release --debug --dry-run --branches=$BRANCH -r ."
echo "running command: $COMMAND"
LOG="$($COMMAND)"
echo "$LOG"

# Cleanup
echo 'removing the test repository'
cd ..
rm -rf testdir

# Compute the expected output pattern
if [ "$2" == "no" ]; then
    REGEX='no\s+new\s+version\s+is\s+released'
else
    REGEX='Analysis\s+of\s+\d+\s+commits\s+complete:\s+'"$2"'\s+release$'
fi

# Computing results
echo "searching the semantic-release output for something matching: $REGEX"
RESULT="$(if echo "$LOG" | grep -P "$REGEX" > /dev/null; then echo "true"; else echo "false"; fi)"
echo "Search result: $RESULT"
echo "Exiting with result: $RESULT"
$RESULT
