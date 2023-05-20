#!/bin/sh

set -e
# insert modified files into config/
cp -r files-modified/* build/config/includes.chroot_after_packages/ && echo "copied files to build/config/includes.chroot_after_packages/"
cp -r files-modified/* build/config/includes.chroot_before_packages/ && echo "copied files to build/config/includes.chroot_before_packages/"
cp -r hooks/* build/config/hooks/live/ && echo "copied hooks to build/config/hooks/live/"
cp -r hooks/* build/config/hooks/normal/ && echo "copied hooks to build/config/hooks/normal"
