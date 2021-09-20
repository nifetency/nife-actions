#!/bin/sh -l

if [ -n "$NIFE_PROJECT_PATH" ]; then
  PREV_PATH=$(pwd)
  # Allow user to change directories in which to run Nife
  cd "$NIFE_PROJECT_PATH" || exit
fi
sh -c "nifectl $*"

ACTUAL_EXIT="$?"

if [ -n "$PREV_PATH" ]; then
  # If we changed directories before, we should go back to where we were.
  cd "$PREV_PATH" || exit
fi

exit $ACTUAL_EXIT
