#!/bin/bash

spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

echo "Animation Running... for 10"

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`
sleep 10
echo "Finished."

# If the script is going to exit here, there is nothing to do.
# The trap above will kill the spinner when this script exits.
# kill the spinner now:
kill -9 $SPIN_PID
