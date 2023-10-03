#!/bin/bash

# Read the requirements.txt file
while IFS= read -r requirement
do
  # Try to add each requirement to the poetry project
  if ! poetry add "${requirement}"
  then
    echo "Failed to add ${requirement}"
    exit 1
  else
    echo "Successfully added ${requirement}"
  fi

done < requirements.txt

# Check if requirements file was read successfully
if ! IFS= read -r requirement < requirements.txt
then
    echo "Failed to read requirements file"
    exit 1
fi

echo "All requirements added successfully"
