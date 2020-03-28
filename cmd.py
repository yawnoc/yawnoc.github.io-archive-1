#!/usr/bin/python

"""
----------------------------------------------------------------
cmd.py
----------------------------------------------------------------

A converter from Conway's markdown (CMD) to HTML,
written for the sole purpose of building his site
<https://yawnoc.github.io/>.

To be kept in the root directory.

Conversion is done entirely using regular expression replacements
(although dictionaries are used for temporary storage).
Unlike John Gruber's markdown, I use fence-style constructs
to avoid the need for proper parsing.

You   : Why the hell would you use regex to do this?
Conway: It works, really!
You   : You're crazy.
Conway: Oh shut up, I already know that.

Documentation: <https://yawnoc.github.io/code/cmd.html>

Released into the public domain (CC0):
  <https://creativecommons.org/publicdomain/zero/1.0/>
ABSOLUTELY NO WARRANTY, i.e. "GOD SAVE YOU"

"""
