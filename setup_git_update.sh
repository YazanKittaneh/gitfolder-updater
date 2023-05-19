#!/bin/bash

# Path to the folder containing the git repositories
repo_folder=$(pwd)

# Create the git_update.sh script
echo '#!/bin/bash
for repo in "$repo_folder"/*; do
    if [ -d "$repo" ]; then
        echo "Updating repository: $repo"
        cd "$repo" || continue
        git pull
        echo "=========================="
    fi
done' > git_update.sh

# Make the script executable
chmod +x git_update.sh

# Create the launchd plist file
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.gitupdate</string>
    <key>Program</key>
    <string>./git_update.sh</string>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/git_update.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/git_update.log</string>
    <key>StartInterval</key>
    <integer>86400</integer> <!-- Update interval in seconds (24 hours) -->
</dict>
</plist>' > com.user.gitupdate.plist

# Move the files to the appropriate directory
mv git_update.sh com.user.gitupdate.plist /Library/LaunchDaemons/

# Load the launchd job
sudo launchctl load /Library/LaunchDaemons/com.user.gitupdate.plist

echo "Git update script has been set up and will run daily to update the repositories."
