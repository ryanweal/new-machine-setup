# New machine setup

## Operating System setup

  - Latest Ubuntu distribution
  - full disk encryption
  - /etc/fstab add noatime in front of errors, and after defaults
  - usb audio drivers (default install)
  - bluetooth drivers (default install)
  - powertop profile (manually generated)
  - hosts file

## Install packages

Common Desktop Utilities

  - chromuim-browser
  - vlc
  - devilspie
  - gnome-shell
  - gnome-tweak-tool
  - gnome themes

Command Line Utilities

  - tmux
  - feh
  - git
  - htop (process explorer)
  - keynav (mouse simulator for X)
  - ncdu (explore disk usage)
  - nettools (for ifconfig)
  - profanity (xmpp)
  - screen
  - tree
  - w3m
  - xterm
  - newsboat (rss reader)
  - epy (ebook reader) https://github.com/wustho/epy
  - vlock

System Extras
  
  - lightdm (solves many rotation issues (and DPI?) on GPD Pocket and ASUS Transformer tablets)
  - xcalib (invert screen colors to be used for keyboard shortcuts listed below)
  - psensor (may need libappindicator1 and/or libappindicator3-1 to show in Ubuntu/Gnome toolbar)
    - gnome-tweak -> extensions -> ubuntu app indicators
    - and/or `sudo apt purge indicator-common` (removes unity)
  
  - virtualbox, virtualbox-guest-additions-iso
    - VBoxManage internalcommands createrawvmdk -rawdisk /dev/sdb -filename /opt/USB-Boot-SDB.vmdk

## External Apps (not in Ubuntu repos, or best to get elsewhere)

  - VS Code
  #- Slack (not really using this anymore, use the browser)
  - Zoom - configure and set to completely close app when quitting
  - docker
  - docker-compose
  - vagrant
  - vagrant scp
  - vagrant digital-ocean
  - nvm
  - yarn
  - now.sh (npm package)

## Browser extensions

  - ublock
  - disable autoplay
  - block caribou (ubuntu specific)
  - lastpass
  - noscript
  - multi-account containers (firefox specific)
  - new tab override (allow custom homepage for new tabs) :
    - https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/

 - enable french and english dictionaries in settings
 - set order of language preferences
 
## Browser config (firefox)

The Firefox browser config manages cookies by using multi-account containers. Most of the settings therefore are oriented around *preserving* cookies but removing any references for fresh sessions.

The amount of configuration is excessive and pathetic at the same time. If it wasn't for MultiAccount tabs I would stop using Firefox... anyway...

  - Touchscreen support
    - Ubuntu launcher:
      - `sudo gedit /usr/share/applications/firefox.desktop`
      - `Exec=env MOZ_USE_XINPUT2=1 firefox %u`
    - Command line:
      - `env MOZ_USE_XINPUT2=1 firefox`

  - General:
    - Enable "Play DRM-controlled content"
  - Search:
    - Use address bar for search and navigation
    - Default search engine: Duck Duck Go
      - Provide search suggestions: active
      - Show search suggestions in address bar results: active
      - Show search suggestions ahead of browsing history in address bar results: disabled
  - Privacy:
    - Content Blocking: Strict
    - Send websites a “Do Not Track”: Always
    - Delete cookies and site data when Firefox is closed: Disabled
    - Ask to save logins and passwords for websites: Disabled
    - Autofill addresses: Disabled
    - History: custom settings
      - Use private browsing mode: Disabled
      - Remember browsing and download history: active
      - Remember search and form history: active
      - Clear history when firefox closes
      - Settings...
        - When closed Firefox should automatically clear all:
          - Browsing & Download History
          - Active Logins
          - Form & Search History
          - Cache
        - Do not delete:
          - Cookies
          - Site Preferences
          - Offline Website Data
    

## vscode extensions

  - vim

## vscode settings

window.titleBarStyle = custom

## Configuration

 - set theme in tweak tool
 - keyboard shorcuts:
   - control-shift-enter for terminal (notion.so uses control-enter for opening table items)
   - F4 xcalib -i -a
   - F6 xrandr -o normal
   - F7 xrandr -o right
   - F8 pietime .devilspie/golden.ds
   - F9 pietime .devilspie/golden-code.ds
   - (not in use anymore - control-alt-super  i3lock -c 121212 -f)
 - add devilspie shortcuts
 - adjust code devilspie recipe
 - adjust browser devilspie recipe
 - configure DPI/pixel density 
 
 - disable some things: https://dev.to/prahladyeri/how-to-trim-your-ubuntu-installation-of-extra-fat-and-make-it-faster-58ib
 - edit the startup list using `gnome-session-properties`
 - disable horrible Nautilus keyboard (search system wide) behavior - `gsettings set org.gnome.nautilus.preferences recursive-search 'never'`

## Work environments

  - create SSH keys: ssh-keygen -t rsa -b 4096
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

Now your phone is your network proxy. It can route either wifi or LTE or whatever you happen to be connected to.

I often use the phone to connect with hotel wifi and proxy it to my laptop to avoid logging into their systems multiple times.

In previous versions I needed to install dhclient before any
routing would occur. Now it "just works". You will see the BT icon on your phone probably has two dots on it now to reflect that data binding is occuring.

If you are only using BT you will save some battery, so power down wifi if you do not need it. Bluetooth is closer to ISDN speeds so if you have big downloads use wifi.

## Crontab

    DISPLAY=:0
    58 * * * * /usr/local/bin/check-instances 2>&1 >/dev/null
    0 17,18,19,20,21,22,23,0,1,2,3,4,5,6,7,8,9 * * * /usr/bin/killall firefox 2>&1 >/dev/null
    0 17,18,19,20,21,22,23,0,1,2,3,4,5,6,7,8,9 * * * /usr/bin/killall  /usr/lib/chromium-browser/chromium-browser 2>&1 >/dev/null
    
## Terminal Config & Tools

Performance tuning

    sudo swapoff -a
    sudo powertop --auto-tune

Virtual KVM switching

    ssh -XC user@laptop  x2x -east -to :0.0
    
    # x2x with keep alive...
    #!/bin/bash
    x2x -west -from :0.0  &
    while true; do echo -n "." ; sleep 1; done

Tripped out xterm
    
    ~/.Xdefaults
    xterm*selectToClipboard: true

    # install solarized theme for xerm
    xrdb ./Xdefaults && xterm -fullscreen &

Capslock remapping (Ubuntu & Gnome)

    setxkbmap -option caps:ctrl_modifier
    
    /etc/default/keyboard variant:  
    XKBOPTIONS="caps:ctrl_modifier"
    
    the Gnome way:
    gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
    
Mail config

    adapted from: https://gist.github.com/mike-burns/986fae26fd1fdb331b59

    apt-get install msmtp
    create .msmtprc
    chmod 600 .msmtprc
    edit .muttrc:
    set sendmail="/usr/bin/msmtp"
    set use_from=yes
    set realname=""
    
    productivity extras:
    sudo apt-get install vdirsyncer todoman khard khal

Ubuntu "wifi roaming aggressiveness"

- No longer using this setting, use wires!

    iwconfig
    iwconfig wlp1s0 sens -60 # percent or if negative, in decibels

Solarized terminal theme

    adapted from: https://github.com/maniat1k/Solarizedxterm/blob/master/.Xdefaults

    xrdb .Xdefaults
    xrdb .Xdefaults && xterm -fullscreen &

`gnome-terminal`'s built-in Solarized is "ok" but you will want to set black &
bright-black to both be #000000; check the box to enable bold for lightness.

Customize TTY theme... and eliminate X from your life...

- Add color overrides to .bashrc described here: https://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors :

      if [ "$TERM" = "linux" ]; then
          echo -en "\e]P0000000" #black
          echo -en "\e]P8454545" #darkgrey
          echo -en "\e]P1D75F5F" #darkred
          echo -en "\e]P9CC896D" #red
          echo -en "\e]P26C7E55" #darkgreen
          echo -en "\e]PAC4DF90" #green
          echo -en "\e]P3CAAF2B" #brown
          echo -en "\e]PBFFE080" #yellow
          echo -en "\e]P47FB8D8" #darkblue
          echo -en "\e]PCB8DDEA" #blue
          echo -en "\e]P5956D9D" #darkmagenta
          echo -en "\e]PDC18FCB" #magenta
          echo -en "\e]P64c8ea1" #darkcyan
          echo -en "\e]PE6bc1d0" #cyan
          echo -en "\e]P7D2D2D2" #lightgrey
          echo -en "\e]PFFAFAFA" #white
          clear #for background artifacting
          echo Hello
      fi

- sudo su
- dumpkeys > dumpkeys.txt
- find keycode 58, set to Control:
- keycode  58 = Control
- sudo loadkeys dumpkeys.txt
- need loadkeys to run at startup...

- Adjust brightness
    echo 4 > /sys/class/backlight/*/brightness
    
- .tmux.conf for lockscreen:

      set-option -g lock-command vlock
      set-option -g lock-after-time 0
      bind y lock-session

  then do (ctrl-b) source-file .tmux.conf to reload daemon

