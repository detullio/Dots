#!/bin/bash
#     lsbytesum - sum the number of bytes in a directory listing
#     and output the size in B, KiB, MiB, or GiB as appropriate.
#
#     There are a number of compromises here:
#     - "ls -l" outputs a file count as the first line, but it doesn't have
#       a fifth field, so it can be ignored ...
#     - "ls -l" doesn't list hidden files: that could be done with "ls -lA"

# How many decimal places? (zero or positive integer)
let scale=2

# Use awk to sum the fifth field of the list of files (only):
TotalBytes="$(ls -l | awk '/^-/ {total+=$5} ; END {printf ("%.0f", total) }')"

# if TotalBytes is empty, set it to zero:
if [ "${TotalBytes}x" = "x" ]
then
  let TotalBytes=0
fi

# Count digits, then print out B, KiB, MiB, GiB, or TiB:
case $(echo -n $TotalBytes | wc -c) in
  1 | 2 | 3) echo -n "${TotalBytes}B" ;;
  4 | 5 | 6) echo "$(echo -e "scale=${scale} \n${TotalBytes}/1024 " | bc)KiB" ;;
  7 | 8 | 9) echo "$(echo -e "scale=${scale} \n${TotalBytes}/1048576 " | bc)MiB" ;;
  10 | 11 | 12) echo "$(echo -e "scale=${scale} \n${TotalBytes}/1073741824 " | bc)GiB" ;;
  *) echo "$(echo -e "scale=${scale} \n${TotalBytes}/1099511627776 " | bc)TiB" ;;
esac
