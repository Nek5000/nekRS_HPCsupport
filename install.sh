#!/bin/bash

# Ensure NEKRS_HOME is set
if [ -z "$NEKRS_HOME" ]; then
    echo "Error: NEKRS_HOME is not set."
    exit 1
fi

# Loop over all subdirectories in the current directory
for dir in */; do
    # Remove trailing slash
    dir_name="${dir%/}"

    # Skip hidden directories like .git
    [[ "$dir_name" == .* ]] && continue

    # Check if nrsqsub exists inside this directory
    src="$dir_name/nrsqsub"
    if [ -f "$src" ]; then
        # Destination filename with directory suffix
        dest="$NEKRS_HOME/bin/nrsqsub_$dir_name"

        # Copy the file
        cp "$src" "$dest"
        chmod +x "$dest"  # make executable
        echo "Installed $src -> $dest"
    fi
done
