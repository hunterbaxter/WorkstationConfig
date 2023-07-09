#!/usr/bin/bash

EMAIL="$1"

# NOTE: requires defining a task warrior report named "email"
task minimal -lc | mutt -s "$(date +'%B %d %Y'): Open Tasks" "$EMAIL"
