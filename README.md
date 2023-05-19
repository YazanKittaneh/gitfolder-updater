# gitfolder-updater

This script sets up a daily git update task using launchd on macOS. It updates all the git repositories in the current folder.

### Setup Instructions

1. Open Terminal.
2. Navigate to the folder where you want to set up the git update script.
3. Run the following commands:

```bash
# Make the script executable
chmod +x setup_git_update.sh

# Run the script with sudo
sudo ./setup_git_update.sh
```

4. Enter your administrator password when prompted.

The script will then perform all the necessary steps to set up the git update script using launchd in the current folder. The repositories in that folder will be updated daily.

### Customization

- To change the update interval, open the com.user.gitupdate.plist file and modify the <integer>86400</integer> value. The value is specified in seconds.
- To exclude specific repositories from being updated, you can modify the git_update.sh script. You can add conditional statements or modify the repository list as per your requirements.

### Troubleshooting

If you encounter any issues, you can check the log file at /tmp/git_update.log for more details.
