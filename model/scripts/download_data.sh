#!/bin/bash

file1_id="1l86uyjZfNGwJnNwrIgN2CIoynjxtXLQc"
file2_id="1qDP0Z4aHq4Ki0-V6pcCBKneQOv5D56kD"

# Set the destination folders
imgs_folder="../data/imgs"
masks_folder="../data/masks"

download_file() {
    file_id=$1
    folder=$2
    confirmation_code=$(curl -sc /tmp/gdrive_confirm "https://drive.google.com/uc?id=${file_id}" | \
                        awk '/confirm=/{print $NF}')
    curl -Lb /tmp/gdrive_confirm "https://drive.google.com/uc?id=${file_id}&confirm=${confirmation_code}" \
         -o "${folder}/file.zip"
    unzip "${folder}/file.zip" -d "${folder}"
    rm "${folder}/file.zip"
}

# Create folders if they don't exist
mkdir -p "${imgs_folder}"
mkdir -p "${masks_folder}"

# Download files
download_file "${file1_id}" "${imgs_folder}"
download_file "${file2_id}" "${masks_folder}"

echo "Files downloaded successfully to ${imgs_folder} and ${masks_folder}."
