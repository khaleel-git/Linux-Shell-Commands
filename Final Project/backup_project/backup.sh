#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print an error message and exit

if [[ $# != 2 ]]; then
  echo "Usage: $0 target_directory_name destination_directory_name"
  exit 1
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "Invalid directory path provided"
  exit 1
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
echo "Argument 1 = $targetDirectory"
echo "Argument 2 = $destinationDirectory"

# [TASK 3]
currentTS=$(date +%s)
echo "Current timestamp is $currentTS"

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"
echo "backupFileName is $backupFileName"

# We're going to:
# 1: Go into the target directory
# 2: Create the backup file
# 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath="/home/apkfuel/linux-system-administration/week4/backup_project"

# [TASK 6]
destDirAbsPath="/home/apkfuel/linux-system-administration/week4/backup_project"

# [TASK 7]
# Since we're using absolute paths, there's no need to change directories.

# [TASK 8]
yesterdayTS=$((currentTS - 24*60*60))
echo "yesterdayTS in epoch is = $yesterdayTS"

declare -a toBackup # this is an array
declare -a tmpBackup # this is my tmp array

tmpBackup=($(ls "$targetDirectory"))
echo "${tmpBackup[@]}"

echo "[TASK 10] and [TASK 11]"
for file in "${tmpBackup[@]}"; do
  # [TASK 10]
  fileTS=$(date -r "$targetDirectory/$file" +%s)
  if [ "$fileTS" -lt "$yesterdayTS" ]; then
    # [TASK 11]
    toBackup+=("$file")
  fi
done

echo "toBackup: ${toBackup[@]}"

# [TASK 12]
echo "[TASK 12]"
#tar -czvf "$origAbsPath/$targetDirectory/$backupFileName" "$origAbsPath/$targetDirectory/${toBackup[@]}"
tar -czvf "$destDirAbsPath/$backupFileName" -C "$targetDirectory" "${toBackup[@]}"

# [TASK 13]
echo "[TASK 13]"
#mv "$backupFileName" "$destDirAbsPath"
#mv "$destDirAbsPath/$backupFileName" "$destinationDirectory"

echo "Congratulations! You completed the final project for this course!"
