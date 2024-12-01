mv $1 root/
cd root/
ar xv $1
tar -xvf data.tar.xz
rm -v $1 data.tar.xz control.tar.xz debian-binary
cd ..
echo $1 >> listInstalled
echo 'Added to installed list.'
echo 'All Done!'
