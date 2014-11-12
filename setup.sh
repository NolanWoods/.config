#!/bin/sh

echo "Downloading git-completion & git-prompt..."

curl -o git/git-completion.bash --progress-bar \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

curl -o git/git-prompt.sh --progress-bar \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

echo "Done."
