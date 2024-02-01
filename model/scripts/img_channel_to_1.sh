#!/bin/bash

input_folder="path"
output_folder="path"

# Ensure the output folder exists
mkdir -p "$output_folder"

# Function to convert images to the specified number of channels
convert_images() {
    for file in "$input_folder"/*; do
        filename=$(basename "$file")
        output_path="$output_folder/$(basename "$file" | cut -f1 -d.)_$1channels.jpg"
        
        # Convert the image to the specified number of channels
        convert "$file" -colorspace $1 "$output_path"
    done
}

# Convert images to 3 channels (RGB)
convert_images "RGB"
