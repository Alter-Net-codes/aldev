#!/bin/bash

while true; do
    echo "Enter a keyword to search for packages (or type 'exit' to quit):"
    read keyword

    if [ "$keyword" == "exit" ]; then
        echo "Exiting..."
        break
    fi

    if [ -z "$keyword" ]; then
        echo "No keyword entered. Please try again."
        continue
    fi

    # Search for packages using winget
    echo "Searching for packages matching '$keyword'..."
    winget search "$keyword"
    
    echo
done
