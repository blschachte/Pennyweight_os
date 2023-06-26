#!/bin/sh

set -e

echo "-- Updating Host System"
sudo apt update && sudo apt upgrade -y

echo "-- Entering Build Directory"
cd build
echo "-- Preparing Build Directory"
sudo lb clean
echo "-- Creating Config Folder"
lb config
echo "-- Leaving Build Directory"
cd ..
echo "-- Modifying Config Folder"
#insert modified files into config/
cp -r files-modified/* build/config/includes.chroot_after_packages/ && echo "copied files to build/config/includes.chroot_after_packages/"
cp -r files-modified/* build/config/includes.chroot_before_packages/ && echo "copied files to build/config/includes.chroot_before_packages/"
cp -r hooks/* build/config/hooks/live/ && echo "copied hooks to build/config/hooks/live/"
cp -r hooks/* build/config/hooks/normal/ && echo "copied hooks to build/config/hooks/normal"
echo "-- Entering Build Directory"
cd build
echo "-- Building image"
sudo lb build
cd build
echo "-- Writing image to the disk"
#sudo dd if=pennyweight-linux-amd64.hybrid.iso of=$1 status=progress
echo "Exiting Build Directory"
cd ..
echo "-- Done"
