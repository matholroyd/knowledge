# Updating and upgrading

`sudo apt-get update` to inform Ubuntu of the latest packages, etc. availble.

`sudo apt-get upgrade` to install the latest packages known about, but will
avoid conflicts + remove any packages.

`sudo apt-get dist-upgrade` to install the latest packages known about. Will
try to avoid conflicts, but prioritize installing newests version of everything.
Old packages may get removed.

`sudo do-release-upgrade` will run you through upgrading to the latest version of Ubuntu. 
I think it tries to keep you on an LTS version if you're upgrading from a current LTS
version, though I couldn't find documentation to confirm this, only comments that
hinted at this. Futhermore there are no options to specify the version to
upgrade to :(.

`dpkg -i <package name>.deb` to install an arbitrary package.