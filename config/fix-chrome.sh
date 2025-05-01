#! /bin/bash

#Simple script for removing lock files incase chrome is profile locked

echo "Closing any and all running Chrome processes"
killall chrome 2>/dev/null

echo "Removing lock files"
rm -f ~/.config/google-chrome/SingletonLock ~/.config/google-chrome/SingletonSocket* ~/.config/google-chrome/SingletonCookie

echo "Done! Please try launcing Chrome again"
