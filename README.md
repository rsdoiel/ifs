{
    "markup": "mmark"
}

# IFS

By R. S. Doiel, 2020-05-02

This is a port of the IFS module described in Martin Reiser 
and Niklaus Writh's "Programming in Oberon: Steps beyond Pascal 
and Modula-2".  The code has been adapted from the original
Oberon presented in the book to Oberon-7 as described in 
Wirth's [Project Oberon 2013](http://www.projectoberon.com/).

## Requirements

+ A POSIX computer system
+ A Text editor
+ [OBNC v0.16.1](https://miasap.se/obnc/) 
    + A "C" tool chain
    + libsdl2

## Source Code organization

One module files are included in this project. 

+ [IFS.Mod](IFS.Mod) is a port of the original described in the book

## Compilation

```shell
    obnc IFS.Mod
```

## Running IFS

```shell
    ./IFS
```

When you run the program you will be expected to type in a series of
numeric values (REAL numbers, e.g. 3145). When all the variables have
been set the program then will create graphical window and start
rendering 4 fractal leafs.

This code was originally developed by Martin Reiser and Niklaus Wirth
as part of their 1992 book, "Programming in Oberon: Steps beyond
Pascal and Modula-2"[^pio]. 

[^pio]: "Programming in Oberon: Steps beyond Pascal and Modula-2", Martin Reisner and Niklaus Wirth, Addison Wesley (18 May 1992), ISBN-10: 0201565439, ISBN-13: 978-0201565430, https://dl.acm.org/doi/book/10.1145/134408
