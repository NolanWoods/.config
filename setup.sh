#!/bin/sh

echo "Checking for or downloading git-completion & git-prompt..."

[ -e "git/git-completion.bash" ] ||  curl -o git/git-completion.bash --progress-bar \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

[ -e "git/git-prompt.sh" ] || curl -o git/git-prompt.sh --progress-bar \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

echo "Done."
