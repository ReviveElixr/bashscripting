#!/bin/bash

# Function to display manual page
display_manual() {
    echo "internsctl - Custom Linux Command"
    echo "Version: v0.1.0"
    echo
    echo "DESCRIPTION:"
    echo "  Custom Linux command for various operations."
    echo
    echo "USAGE:"
    echo "  internsctl [command] [options]"
    echo
    echo "COMMANDS:"
    echo "  cpu getinfo         Display CPU information."
    echo "  memory getinfo      Display memory information."
    echo "  user create <username>    Create a new user."
    echo "  user list                 List all regular users."
    echo "  user list --sudo-only    List users with sudo permissions."
    echo "  file getinfo <file-name>  Get information about a file."
    echo
    echo "OPTIONS:"
    echo "  --version, -v    Display the command version."
    echo "  --help, -h       Display this help message."
    echo
}

# Function to display help
display_help() {
    echo "USAGE: internsctl [command] [options]"
    echo
    echo "COMMANDS:"
    echo "  cpu getinfo         Display CPU information."
    echo "  memory getinfo      Display memory information."
    echo "  user create <username>    Create a new user."
    echo "  user list                 List all regular users."
    echo "  user list --sudo-only    List users with sudo permissions."
    echo "  file getinfo <file-name>  Get information about a file."
    echo
    echo "OPTIONS:"
    echo "  --version, -v    Display the command version."
    echo "  --help, -h       Display this help message."
    echo
}

# Function to display version
display_version() {
    echo "internsctl v0.1.0"
}

# Function to get CPU information
get_cpu_info() {
    lscpu
}

# Function to get memory information
get_memory_info() {
    free
}

# Function to create a new user
create_user() {
    username=$1
    sudo useradd -m $username
    sudo passwd $username
}

# Function to list users
list_users() {
    if [ "$1" == "--sudo-only" ]; then
        getent passwd | grep -E '\s+/bin/(bash|sh)\s*$' | cut -d: -f1
    else
        getent passwd | cut -d: -f1
    fi
}

# Function to get file information
get_file_info() {
    file=$1
    size=$(stat -c%s $file)
    permissions=$(stat -c%a $file)
    owner=$(stat -c%U $file)
    last_modified=$(stat -c%y $file)
    
    echo "File: $file"
    echo "Access: $permissions"
    echo "Size(B): $size"
    echo "Owner: $owner"
    echo "Modify: $last_modified"
}

# Main script logic
case "$1" in
    "cpu")
        case "$2" in
            "getinfo")
                get_cpu_info
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    "memory")
        case "$2" in
            "getinfo")
                get_memory_info
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    "user")
        case "$2" in
            "create")
                create_user $3
                ;;
            "list")
                list_users $3
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    "file")
        case "$2" in
            "getinfo")
                shift 2
                get_file_info "$@"
                ;;
            *)
                display_help
                ;;
        esac
        ;;
    "--version" | "-v")
        display_version
        ;;
    "--help" | "-h")
        display_manual
        ;;
    *)
        display_help
        ;;
esac
