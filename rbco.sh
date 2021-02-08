#!/bin/bash

# Push ruby file and markup to log.txt
printf "\`\`\`ruby\n" >> log.txt
cat $1 >> log.txt
printf "\`\`\`\n" >> log.txt


# Push ruby file output and markup to log.txt
printf "\nOutput:\n\`\`\`\n" >> log.txt
script -q -c "ruby $1" output.txt  # script adds header and footer to generated file. Removed in lines below.
head -n -2 output.txt >> output_trimb.txt
tail -n +2 output_trimb.txt >> output_trimmed.txt
cat output_trimmed.txt >> log.txt
printf "\`\`\`" >> log.txt

# Copy log.txt to clipboard and remove log.txt file
xclip -sel clip < log.txt
rm log.txt output.txt output_trimb.txt output_trimmed.txt
