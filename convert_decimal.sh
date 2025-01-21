#!/bin/bash

# Function to check if the input is a valid decimal number smaller than 100000
is_valid_decimal() {
    local num="$1"
    if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -lt 100000 ]; then
        return 0  # Valid decimal
    else
        return 1  # Invalid decimal
    fi
}

# Get user input
echo "Enter a decimal number smaller than 100000:"
read decimal_number

# Check if the input is a valid decimal number
if is_valid_decimal "$decimal_number"; then
    # Convert decimal to hexadecimal and binary
    hex_value=$(printf "%X" "$decimal_number")
    bin_value=$(echo "obase=2; $decimal_number" | bc)

    # Prepare the result to be written to the file
    result="Decimal: $decimal_number, Hexadecimal: $hex_value, Binary: $bin_value"

    # Define the file path for storing results
    result_file="$(dirname "$0")/conversion_result.txt"

    # Append the result to the file
    echo "$result" >> "$result_file"

    # Output the result
    echo "Conversion successful!"
    echo "$result"

else
    # Inform the user if the input is invalid
    echo "Error: Invalid input. Please enter a decimal number smaller than 100000."
fi
