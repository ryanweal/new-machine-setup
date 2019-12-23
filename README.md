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

  - chromuim-browser
  - vlc
  - devilspie
  - nettools (for ifconfig)
  - gnome-shell
  - gnome-tweak-tool
  - gnome themes
  - git
  - screen
  - lightdm (solves many rotation issues (and DPI?) on GPD Pocket and ASUS Transformer tablets)
  - xcalib (invert screen colors to be used for keyboard shortcuts listed below)
  - ncdu (explore disk usage)
  - htop (process explorer)
  - psensor (may need libappindicator1 and/or libappindicator3-1 to show in Ubuntu/Gnome toolbar)
    - gnome-tweak -> extensions -> ubuntu app indicators
    - and/or `sudo apt purge indicator-common` (removes unity)

## External Apps

  - VS Code
  - Slack (not really using this anymore, use the browser)
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

 - enable french and english dictionaries in settings
 - set order of language preferences
 
## Browser config (firefox)

The Firefox browser config manages cookies by using multi-account containers. Most of the settings therefore are oriented around *preserving* cookies but removing any references for fresh sessions.

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
    
## Sometimes

    sudo swapoff -a
    sudo powertop --auto-tune
    ssh -XC user@laptop  x2x -east -to :0.0
