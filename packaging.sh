#!/bin/sh

#Creating initial settings files
mkdir debian
cd debian/
touch control
touch rules
touch postinst
touch changelog

#edidted all control,rules,postinst files to be appropriate to your install

chmod +x control
chmod +x rules
chmod +x postinst

#Tested the requirements file on a blank enviroment to make sure no errors returns from it during pip install -r equirements_mctest.txt

#edited the setup.py file to contain the necessary information to dh-virtualenv before packaging

#created the manifest.in file to include other files as part of the packaging

#debian/changelog
dch --create -v 5.3 --mctest "Initial release."

python3 setup.py sdist


#Build the Debian Package
dpkg-buildpackage -us -uc -b

#Verify Your Package
dpkg-deb --info path-to-your-deb-file.deb
dpkg-deb --contents path-to-your-deb-file.deb

#Install and Test
sudo dpkg -i mctest_5.3-1_all.deb

# Define log file location
LOG_FILE="/var/log/mctest_postinst.log"
ERROR_LOG_FILE="/var/log/mctest_postinst_error.log"

sudo nano /var/log/mctest_postinst.log

sudo nano /var/log/mctest_postinst_error.log

ls /opt/venvs/mctest

#
dpkg -l | grep mctest
sudo dpkg --remove --force-remove-reinstreq mctest
sudo apt-get autoremove

#sudo mk-build-deps --install debian/control



#Folder Structure: Make sure your project is structured in a way that adheres to Debian packaging requirements.

#debian/control: This file contains metadata about your package like its name, version, dependencies, etc. At minimum, it should have two stanzas: a source package stanza and a binary package stanza.

#debian/rules: This is a makefile. For Python projects, it can be pretty simple. If you're using dh (debhelper), it can often be just a few lines invoking dh with a sequence of commands. The dh command will then handle many of the typical packaging steps for you.

#debian/postinst: This script is run after your package is installed. Ensure this does everything you need (like possibly setting up system services, users, or permissions).

#Permissions: As you've pointed out, ensure that postinst, rules, and any other scripts you add are executable. Use chmod +x filename to make them executable.

#Dependencies: If your Python application depends on specific libraries, you'll need to make sure those dependencies are specified in the debian/control file.

#debian/changelog: You will need this file to detail changes in your package. The version number specified in this file determines the version of the Debian package.

#debian/compat: Specifies the debhelper compatibility level. If you're using debhelper, this file will be needed.

#Build the Package: Once everything is set up, you can build the Debian package using tools like dpkg-buildpackage or debuild.

#Test Your Package: Before distributing, install your package on a clean system or in a chroot to ensure it installs and works correctly.

#Lintian: Run lintian on your built package. It's a tool that checks the package for common mistakes and potential improvements.

#.install File: If you need to specify which files are installed and where they go, you might need a debian/package-name.install file. For example, it might contain lines like path/to/source/file /path/to/destination.

#Adjusting setup.py: While this can be helpful, it's more geared towards pip installations. When dealing with Debian packaging, the debian/* files handle most of the heavy lifting.

#python3, python3-venv, python3-dev, python3-pip, default-libmysqlclient-dev, build-essential, texlive-full, texlive-extra-utils, texlive-pictures, texlive-font-utils, texlive-latex-extra, texlive-lang-portuguese, zbar-tools, texlive-science, libzbar-dev, git, mysql-server, mysql-client-core-8.0, virtualenv


joao@joao-Virtual-Machine:~/PycharmProjects$ sudo dpkg -i mctest_5.3-1_all.deb 
[sudo] password for joao: 
Selecting previously unselected package mctest.
(Reading database ... 279181 files and directories currently installed.)
Preparing to unpack mctest_5.3-1_all.deb ...
Unpacking mctest (5.3-1) ...
Setting up mctest (5.3-1) ...
trap: ERR: bad trap
dpkg: error processing package mctest (--install):
 installed mctest package post-installation script subprocess returned error exit status 2
Errors were encountered while processing:
 mctest




