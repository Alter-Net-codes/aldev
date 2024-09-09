#!/bin/bash

while true; do
    # Prompt user for input to search for packages
    echo -n "Enter the package name to search (or type 'exit' to quit): "
    read package_name

    # Check if the user wants to exit
    if [ "$package_name" == "exit" ]; then
        echo "Exiting the script."
        break
    fi

    # Search for packages using winget
    echo "Searching for packages related to '$package_name'..."
    winget search "$package_name"

    # Ask if the user wants to download a package
    echo -n "Do you want to download a package from the list above? (yes/no): "
    read download_choice

    if [ "$download_choice" == "yes" ]; then
        # Ask for the exact package name to download
        echo -n "Enter the exact package name to download: "
        read package_to_download

        # Install the selected package
        echo "Downloading and installing $package_to_download..."
        winget install "$package_to_download"

        # Check if the installation was successful
        if [ $? -eq 0 ]; then
            echo "$package_to_download installed successfully."
        else
            echo "Failed to install $package_to_download."
        fi
    fi
done
