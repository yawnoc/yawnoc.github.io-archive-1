(+ resources/inclusions/syntax/general.cmd +)

%%
  %title Debian on Pinebook Pro via Daniel's installer
  %title-suffix \title-suffix
  %author Conway
  %date-created 2020-06-15
  %date-modified 2020-06-17
  %resources
    (+ resources/inclusions/preamble/main.cmd +)
    (+ resources/inclusions/preamble/rendering.cmd +)
%%


[[====
* \header-link:home
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

{: \last-used-commit : 5418880e :}
@@[last-used]
  https://github.com/daniel-thompson/pinebook-pro-debian-installer/\
    commit/\last-used-commit
@@

##clone
  Clone the installer
##

````
$ git clone https://github.com/daniel-thompson/pinebook-pro-debian-installer
$ cd pinebook-pro-debian-installer
````

##unmount
  Unmount the SD card
##

````
$ umount /media/conway/mmcblk0
````

##run
  Run the installer
##

````
$ ./install-debian ARCH=armhf BLKDEV=/dev/mmcblk0 RELEASE=buster
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

||||||{centred-block}
||||{overflowing}
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


##swap
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


##terminal-encoding
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

||||{centred-block}
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

||||||{centred-block}
||||{overflowing}
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


##internet
  Connect to the internet
##

----
Having [fixed the terminal's encoding](#terminal-encoding),
we then connect to the internet:
----
````
$ nmtui
````

##update
  Update and upgrade packages
##

````
$ sudo apt update
$ sudo apt upgrade
````


##power-key
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


##mate
  Minimal MATE and LightDM
##

````
$ sudo apt install mate-desktop-environment-core
$ sudo apt install lightdm
````
----
Then reboot.
----

###appearance
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
    ======
    * Right Click \> Preferences
      ====
      * Hide thumbnails on hover: TRUE
      ====
    ======
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


###trackpad
  Trackpad
###

==========
* Start \> System \> Preferences \> Hardware \> Mouse
  ========
  * [Touchpad] Acceleration: \~70%
  ========
==========



\cite-this-page[][pinebook-pro][
  {Debian} on {Pinebook} {Pro} via {Daniel's} installer
]


%footer-element
