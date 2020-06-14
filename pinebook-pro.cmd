(+ resources/inclusions/syntax/general.cmd +)

%%
  %title Debian on Pinebook Pro via Daniel's installer
  %title-suffix \title-suffix
  %author Conway
  %date-created 2020-06-15
  %date-modified 2020-06-15
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
the installation of Debian Bullseye onto Pinebook Pro (removable SD card slot)
using [Daniel Thompson's unofficial installer],
along with subsequent customisations to my own liking.
----

@@[Daniel Thompson's unofficial installer]
  https://github.com/daniel-thompson/pinebook-pro-debian-installer
@@

----
Last version I used: [<code>\last-used-commit</code>] [last-used]
----

{: \last-used-commit : d4902fc9 :}
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
$ ./install-debian BLKDEV=/dev/mmcblk0
````

----
This installs to the removable SD card slot.
Reboot upon completion.
----
----
To avoid bloat,
I leave the installation of a desktop environment and a window manager
until later.
----

||||||{centred-block}
||||{overflowing}
''''
|:
  ==
    , Hostname
    , (default)
  ==
    , Username
    , `conway`
  ==
    , User info
    , (leave blank)
  ==
    , Keyboard model
    , Generic 105-key PC~(intl.)
  ==
    , Keyboard layout
    , English~(UK)
  ==
    , AltGr Key
    , Default
  ==
    , Compose key
    , None
  ==
    , Locales
    , `en_AU.UTF-8 UTF-8`
  ==
    , Default locale
    , `en_AU.UTF-8`
  ==
    , Geographic area
    , Australia
  ==
    , Time zone
    , Perth
  ==
    , Software
    , (none)
''''
||||
||||||


##terminal-encoding
  Fix the TTY (terminal) encoding
##

----
For whatever reason,
the default encoding of the text terminal is `ISO-8859-15`.
Since the locale has been set to `UTF-8`,
box-drawing characters will be rendered incorrectly,
and in particular `nmtui` will be too chaotic to handle
by the time you get to the "Activate a connection" screen.
----
----
So first up I fix the encoding.
The interface for doing so is itself a TUI (text user interface),
so it too will have broken borders initially:
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
While I'm at it, I also increase the terminal font size.
----

||||||{centred-block}
||||{overflowing}
''''
|:
  ==
    , Encoding
    , `UTF-8`
  ==
    , Character set
    , Guess
  ==
    , Font
    , Terminus
  ==
    , Font size
    , 12 × 24
''''
||||
||||||


\cite-this-page[][pinebook-pro][
  {Debian} on {Pinebook} {Pro} via {Daniel's} installer
]


%footer-element

