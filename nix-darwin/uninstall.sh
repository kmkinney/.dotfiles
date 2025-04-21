sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist
sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist

sudo dscl . -delete /Groups/nixbld
for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done
