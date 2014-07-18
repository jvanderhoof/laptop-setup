Gazelle Developer Laptop Setup
==============================

This is a script to install required and useful libraries onto a Gazelle Developer machine. It's been tested on a freshly wiped Maverick laptop.

Instructions
------------

This tool uses Home Brew for all the heavy lifting.  Home Brew requires the XCode command line tools for compiling.  Please install XCode before you try the larger setup:

```bash
sudo xcode-select --install
```

Now install:
```bash
ruby -e "$(curl https://raw.githubusercontent.com/secondrotation/laptop-setup/master/install.rb)"
```

The following libraries will be installed:
* git
* awscli
* zsh
* mysql
* memcached
* redis
* postgresql
* sphinx --mysql
* aspell
* imagemagick --with-libtiff
* freeimage

Memcached, Redis, MySql, and Postgres will all be setup to start automatically.

The following Applications will be installed:
* sublime-text (because I'm not smart enough for Vim)
* iterm2
* google-chrome
* hipchat
* sequel-pro
* alfred
* libreoffice
* virtualbox
* vagrant (and install the berkshelf and omnibus plugins)
* skype
* spotify
