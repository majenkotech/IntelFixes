Intel Fixes
===========

* Scripts to fix the Intel Edison and Intel Galileo toolkits for Arduino on Linux.

The default toolkits use a script that munges hard-coded library paths. These scripts
use a parameter (`-perm +111`) to `find` that was deprecated back in 2005. Because
of this they don't install on a modern Linux system.

These two scripts will manually download the toolkits from Intel and replace the
existing toolkits in your Arduino installation (Note: you need to "fail" to install
the Arduino packages *first*). It makes adjustments to the installations as needed
to allow them to then work.

**Note:** Requires Python 2 to be installed (`sudo apt install python2`), for edison only.

**Another note:** Edison script is currently broken - it can't find the download file.
Maybe it's redundant now?
