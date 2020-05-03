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

One module file and several data files are included in this project. 

+ [IFS.Mod](IFS.Mod) is a port of the original described in the book
+ Data files: [Barnsley Fern](Fern1.txt), [Variation on Barnsley Fern](Fern2.txt), [Sierpinski Triangle](Sierpinski.txt) and [Square](Square.txt).

## Compilation

```shell
    obnc IFS.Mod
```

## The data file format

The module's `Init*` procedure needs to read in the initialization
data before drawing the fractals. The data file format is as follows

### Row 1

```
x0  y0  e
```

Each value is an integer.  `e` is the a scaling factor. In the source
it is refered to as "unit size".
Two data files function likes the
Tool texts in the book.

### Rows 2 through 8

Next of real values for where columns are each pass (1 through 4)
and each row corresponds to an `a`, `b`, `c`, `d`, `e`, `f`, `p` values.

Numbers are separated by space.  

#### Barnsley Fern:

```
440  28    64
0.0  0.85  0.2  -0.15
0.0  0.04  -0.26 0.28
0.0  -0.04 0.23  0.26
0.16 0.85  0.22  0.24
0.0  0.0   0.0   0.0
0.0  1.60  1.60  0.44
0.01 0.85  0.07  0.07  
```

#### Fractal Tree

```
480    1      1200
0.0    0.42   0.42   0.1
0.0    -0.42  0.42   0.0
0.0    0.42   -0.42  0.0
0.5    0.42   0.42   0.1
0.0    0.0    0.0    0.0
0.0    0.2    0.2    0.2
0.05   0.4    0.4    0.15
```

## Running IFS

```shell
    ./IFS < Fern1.txt
    ./IFS < Tree.txt
```

The program expects to read a series of integer and real values
from standard input.  You can use a POSIX style pipe or redirect
to cause `IFS` to read the file.

## In Closing

This code was originally developed by Martin Reiser and Niklaus Wirth
as part of their 1992 book, "Programming in Oberon: Steps beyond
Pascal and Modula-2"[^pio].  It was an exercise and seeing how easy
it was to adapt the original Oberon code to a more lean Oberon-7.

[^pio]: "Programming in Oberon: Steps beyond Pascal and Modula-2", Martin Reisner and Niklaus Wirth, Addison Wesley (18 May 1992), ISBN-10: 0201565439, ISBN-13: 978-0201565430, https://dl.acm.org/doi/book/10.1145/134408
