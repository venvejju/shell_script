#!/bin/bash
 
while IFS= read -r line; do
    #aws s3api restore-object --bucket vejju-bucket --key "$line" --restore-request Days=1,GlacierJobParameters={Tier=Standard} || true
      if ! aws s3api restore-object --bucket vejju-bucket --key "$line" --restore-request Days=1,GlacierJobParameters={Tier=Standard} 2>> errors.log; then
         echo "Error restoring object: $line" >&2  # Print error to console
      fi
done < list.txt
