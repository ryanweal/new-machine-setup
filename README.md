# New machine setup

## Operating System setup

  - Latest Ubuntu distribution
  - full disk encryption
  - usb audio drivers
  - bluetooth drivers
  - powertop profile
  - hosts file

## Install packages

  - chromuim-browser
  - vlc
  - devilspie
  - nettools (for ifconfig)
  - gnome-shell
  - tweak tool
  - gnome themes
  - git
  - screen
  - lightdm

## External Apps

  - VS Code
  - Slack
  - Zoom
  - docker
  - docker-compose
  - vagrant
  - vagrant scp
  - vagrant digital-ocean
  - node.js

## Browser extensions

 - ublock
 - disable autoplay
 - block caribou

## vscode extensions

  - vim

## Configuration

 - set theme in tweak tool
 - add shortcut for terminal
 - add devilspie shortcuts
 - adjust code devilspie recipe
 - adjust browser devilspie recipe
 - configure DPI/pixel density 

## Work environments
  - create SSH keys
  - deploy public keys for certain hosts/servies
  - git clone relevant project repos
  - run docker-compose up one time per project to provision
  - npm i each project

## Connectivity

  - On Android, go to Settings, ...More, connection sharing, enable Bluetooth sharing
  - In Ubuntu, go to Bluetooth settings and select phone
  - Confirm when prompted on your phone
  - Click continue to accept in Ubuntu
  - Go to Network settings in Ubuntu 17.10 and enable Bluetooth slider

In previous versions I needed to install dhclient before any
routing would occur. Now it "just works". You will see the BT icon on your phone probably has two dots on it now to reflect that data binding is occuring.

If you are only using BT you will save some battery, so power down wifi if you do not need it. Bluetooth is closer to ISDN speeds so if you have big downloads use wifi.