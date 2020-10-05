#!/bin/sh -l

# https://stackoverflow.com/questions/16886179/scp-or-sftp-copy-multiple-files-with-single-command

echo -e "$INPUT_KEY" > __key

chmod 700 __key

scp -v -r \
    -o ConnectTimeout=15 \
    -o StrictHostKeyChecking=no \
    -i __key \
    -P $INPUT_PORT \
    $INPUT_USER@$INPUT_HOST:"$INPUT_REMOTE" "$INPUT_LOCAL"

shred __key -f -n 10 -z -v -u
