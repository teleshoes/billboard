#!/bin/sh
project="billboard"

/scratchbox/login -d $HOME/$project make -C billboard-ui/i18n release
/scratchbox/login -d $HOME/$project dpkg-buildpackage -rfakeroot -b
success="$?"

deb=`/scratchbox/login -d $HOME find -maxdepth 1 -name $project*.deb`
echo copying $deb from sbox $HOME to $HOME/$project
/scratchbox/login -d $HOME cp $deb $HOME/$project

exit $success
