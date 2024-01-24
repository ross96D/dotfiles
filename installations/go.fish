#!/bin/env fish

argparse h/help s/system -- $argv

# Show help message
if set -q _flag_help
    echo "Usage: [options] FILE"
    echo "Options:"
    echo " -h, --help      Show this help message"
    echo " -s, --system    Install Go in /usr/local/"
    echo ""
    echo "Arguments:"
    echo " FILE            Tar file for Go installation"
    exit 0
end

# Check if a file was provided
if not set -q argv[1]
    echo "Error: No file provided."
    exit 1
end

# Extract the file name from the path
set file_path $argv[1]
# set file_name (basename $file_path)

if not test -f $file_path
    echo "Error: file does not exist or is not a regular file"
    exit 1
end

exit 0

# Create temporary directory
mkdir .temp_dir
tar -xf $file_path -C temp_dir

if not test $status -eq 0
    echo "could not untar $file_path"
    exit 1
end

# Get the directory where Go will be installed
set install_dir "~/.local/"
if not set -q _flag_system
    set install_dir /usr/local/
end

rm -rf "$install_dir/go"

# Move the extracted Go files to the installation directory
mv .temp_dir/* $install_dir

# Remove the temporary directory
rmdir .temp_dir

# set is_in_path (echo $PATH | grep -o "$install_dir/go/bin")

fish_add_path "$install_dir/go/bin"

echo "please note that this installation is for fish only. To add bash support please add $install_dir/go/bin to your path"
