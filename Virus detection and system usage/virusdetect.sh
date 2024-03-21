#!/bin/bash


# Check the virus detection
check_for_viruses() {
    # Directories for virus
    scan_directories=("/var/www/html" "/home/user/Documents")

    # Start the virus scan
    echo "Virus Detection Report"
    echo "----------------------"
    for dir in "${scan_directories[@]}"; do
        echo "Scanning directory: $dir"
        suspicious_files=$(find "$dir" -type f -executable -exec file {} + | grep "ELF" | cut -d: -f1)
        if [ -n "$suspicious_files" ]; then
            echo "Suspicious files found:"
            echo "$suspicious_files"
        else
            echo "No suspicious files found in $dir"
        fi
    done
}

# Main function to run system usage check and virus detection
main() {
    check_system_usage
    echo ""
    check_for_viruses
}

# Execute the main function
main
