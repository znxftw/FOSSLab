# Linux Package Management using apt-get / dpkg

Folder consists of 3 files, namely
- install.sh
- remove.sh
- update.sh

## install.sh
### Usage
- ./install.sh package-name
- Installs the package specified

## remove.sh
### Usage
- ./remove.sh package-name
- Removes the package specified

## update.sh
### Usage
- ./update.sh
- updates and upgrades the apt-get utility

### Other commands

- apt-cache search ​ search_string
- apt search ​ search_string
- apt-cache show package
- apt show package
- dpkg -s ​ package
- dpkg -i ​ package.deb
- sudo apt-get autoremove