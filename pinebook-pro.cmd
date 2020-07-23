{+ resources/syntax/general.cmd +}

%%
  %title Debian on Pinebook Pro via Daniel's installer
  %date-created 2020-06-15
  %date-modified 2020-07-17
  \resources:rendering
%%


[[====
* \header-link:home
* \header-link:top
* \header-link:cite
====]]


# %title #

[||||
||||]

----
A step-by-step record of
the installation of Debian Buster onto Pinebook Pro (removable SD card slot)
using [Daniel Thompson's unofficial installer],
along with subsequent customisations to my own liking.
----

@@[Daniel Thompson's unofficial installer]
  https://github.com/daniel-thompson/pinebook-pro-debian-installer
@@

----
Last version I used: [<code>\last-used-commit</code>] [last-used]
----

{: \last-used-commit : cc50809f :}
@@[last-used]
  https://github.com/daniel-thompson/pinebook-pro-debian-installer/\
    commit/\last-used-commit
@@

##{#clone}
  Clone the installer
##

````
$ git clone https://github.com/daniel-thompson/pinebook-pro-debian-installer
$ cd pinebook-pro-debian-installer
````

##{#unmount}
  Unmount the SD card
##

````
$ umount /media/conway/mmcblk0
````

##{#run}
  Run the installer
##

````
$ ./install-debian BLKDEV=/dev/mmcblk0 RELEASE=buster
````

----
This installs to the removable SD card slot.
Reboot upon completion.
----
----
To avoid bloat,
we leave the installation of a desktop environment and a window manager
until later.
----

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    ; Hostname
    , (default)
  ==
    ; Username
    , `conway`
  ==
    ; User info
    , (leave blank)
  ==
    ; Keyboard model
    , Generic 105-key PC~(intl.)
  ==
    ; Keyboard layout
    , English~(US)
  ==
    ; AltGr Key
    , Default
  ==
    ; Compose key
    , None
  ==
    ; Locales
    , `en_AU.UTF-8 UTF-8`
  ==
    ; Default locale
    , `en_AU.UTF-8`
  ==
    ; Geographic area
    , Australia
  ==
    ; Time zone
    , Perth
  ==
    ; Software
    , (none)
''''
||||
||||||


##{#swap}
  Disable swap
##

----
Using swap on an SD card is [a bad idea](https://askubuntu.com/a/149683),
so we [remove it](https://serverfault.com/a/684792).
----

````
$ sudo swapoff -a
$ sudo nano /etc/fstab
````
----
Comment out the swap line.
----


##{#terminal-encoding}
  Fix the TTY (terminal) encoding
##

----
For whatever reason,
the default encoding of the text terminal is `ISO-8859-15`.
Since the locale has been set to `UTF-8`,
box-drawing characters will be rendered incorrectly,
and in particular [`nmtui`](#internet) will be too chaotic to handle
by the time you get to the "Activate a connection" screen.
----
----
So first up we fix the encoding.
The interface for doing so is itself a TUI (text user interface),
so it too has broken borders initially:
----

````
$ sudo dpkg-reconfigure console-setup
````

||||{.centred-block}
![
  Photo: \
    Broken borders on the "Configuring console-setup" text user interface \
    caused by incorrect encoding.
](
  tty-bad-encoding.jpg
)
||||

----
While we're at it, we also increase the terminal font size.
----

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    ; Encoding
    , `UTF-8`
  ==
    ; Character set
    , Guess
  ==
    ; Font
    , Terminus
  ==
    ; Font size
    , 12 × 24
''''
||||
||||||


##{#internet}
  Connect to the internet
##

----
Having [fixed the terminal's encoding](#terminal-encoding),
we then connect to the internet:
----
````
$ nmtui
````

##{#update}
  Update and upgrade packages
##

````
$ sudo apt update
$ sudo apt upgrade
````


##{#power-key}
  Disable shutdown on power key
##

----
Since the Power key is dierectly above Backspace,
it is very easy to shutdown by accident while typing.
We [disable this using `logind`](https://unix.stackexchange.com/a/288734):
----

````
$ sudo nano /etc/systemd/logind.conf
````
----
Uncomment the `HandlePowerKey=poweroff` line
and change it to `HandlePowerKey=ignore`.
----


##{#mate}
  Minimal MATE and LightDM
##

````
$ sudo apt install mate-desktop-environment-core
$ sudo apt install lightdm
````
----
Then reboot.
----

###{#appearance}
  Appearance settings
###

==========
* Top panel \> System \> Preferences \> Look and Feel \> Appearance
  ========
  * [Theme] TraditionalOK
  * [Background]
    ======
    * No Desktop Background
    * Colours: Solid colour, black.
    ======
  * [Fonts]
    ======
    * Fixed width font size~11 (in line with the other families)
    * Details...
      ====
      * Automatic detection: OFF
      * Dots per inch (DPI): 120 (otherwise text is too small)
      ====
    ======
  ========

* Right Click top panel \> Delete This Panel

* Right Click bottom panel \> Properties
  ========
  * [General] Size: 32~pixels
  ========

* Unlock and Remove everything in the bottom panel,
  which shall henceforth be called the taskbar

* Add to taskbar and Lock the following
  ========
  * Main Menu, which shall henceforth be called Start
  * Workspace Switcher
  * Window List
  * Clock (flush right)
  ========

* Rename `conway's Home` to `conway`

* Start \> System Tools \> Caja
  ========
  * Edit \> Preferences
    ======
    * [Views]
      ====
      * Default View new folders using: List View
      * List View Default Zoom level: 66%
      ====
    ======
  * View \> Reset View to Defaults
  ========

==========


###{#keyboard}
  Keyboard shortcuts
###

==========
* Start \> System \> Preferences \> Hardware \> Keyboard Shortcuts
  ========
  * Home folder: Pine + H
  * Run a terminal: Pine + T
  * Hide all and focus desktop: Pine + D
  * Tile window to east (right): Pine + Right
  * Tile window to west (left): Pine + Left
  ========
==========
----
Note that Pine key is Mod4.
----


###{#terminal}
  MATE Terminal
###

==========
* Edit \> Profile Preferences
  ========
  * [General]
    ======
    * Allow bold text: TRUE
    * Terminal bell: FALSE
    * Use custom default terminal size: 80 columns, 48 rows
    ======
  * [Colours]
    ======
    * Foreground, Background, Bold and Underline
      ====
      * Use colours from system theme: FALSE
      * Built-in schemes: White on black
      ====
    * Palette
      ====
      * Built-in schemes: XTerm
      ====
    ======
  * [Scrolling]
    ======
    * Unlimited: TRUE
    ======
  ========

* Edit \> Keyboard Shortcuts
  ========
  * Help Contents: Disabled
    (otherwise F1 won't work in TUI programs, e.g.~`alsamixer`)
  ========

==========


##{#bash}
  Bash customisation
##

###{#bash-aliases}
Bash aliases
###

----
Add the following to `.bash_aliases`:
----
````
alias grep='grep --color=auto'
alias gr='grep -E'
alias py='python3'
````

###{#bash-prompt}
Bash prompt
###

----
Edit `.bashrc` and insert newlines in `PS1`
at the start and before the dollar sign.
----


##{#power}
  Power management
##

````
$ sudo apt install mate-power-manager
````

========
* Start \> System \> Preferences \> Hardware \> Power Management
  ======
  * [On AC Power] Set display brightness to: 30%
  * [General]
    ====
    * When the power button is pressed: Do nothing
    * Notification Area: Always display an icon
    ====
  ======
* Add to taskbar and Lock
  ======
  * Notification Area (beside clock)
  ======
========
----
Then reboot.
----


##{#cli-essentials}
  Command line essentials
##

----
Python~3 was installed along with MATE.
----
````
$ sudo apt install git
$ sudo apt install w3m
````

###{#w3m-options}
  w3m options
###
======
* [Display] Tab width: 2
* [Miscellaneous Settings] Save URL history: NO
======
----
No cookies appears to be the default now.
----


##{#cjk-fonts}
  CJK fonts
##

````
$ sudo apt install fonts-noto-cjk
````


\cite-this-page[][pinebook-pro][
  {Debian} on {Pinebook} {Pro} via {Daniel's} installer
]


%footer-element

