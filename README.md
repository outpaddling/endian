Endian
======
Endian is a simple program for reporting the endianness of the underlying
system.

It is meant for use in scripts that need to determine endianness.

Such script often make erroneous assumptions based on the operating system
such as the following:

if [ $(uname -p) = powerpc ]; then
    endian=big
fi

In fact, powerpc systems may be either big or little endian.

Endian eliminates this problem by querying the system with a simple byte
order test to definitely determine the endianness currently in use.
