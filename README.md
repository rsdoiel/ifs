
# IFS

By R. S. Doiel, 2020-05-02

This is a port of the IFS module described in Martin Reiser 
and Niklaus Wirth's "Programming in Oberon: Steps beyond Pascal 
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

### Map of values

The initialization procedures reads text from standard input.
The layout of variables is as follows.

```
x0 y0 e
a1 a2 a3 a4
b1 b2 b3 b4
c1 c2 c3 c4
d1 d2 d3 d4
e1 e2 e3 e4
f1 f2 f3 f4
p1 p2 p3 p4
```

#### Row Integers

```
x0  y0  e
```

`x0` and `y0` are the left and bottom edges.  `e` is the a scaling factor. 
In the source it is referred to as "unit size".

#### Rows 2 through 8 are Reals

The remaining rows are real number values. Each column represents
a function pass (e.g. 1 to 4).  Each rows represents a variable,
`a`, `b`, `c`, `d`, `e`, `f`, `p` values.

In all rows numbers are separated by one or more spaces.

##### Barnsley Fern:

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

##### Fractal Tree

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
Pascal and Modula-2"[^pio].  This repository was an exercise and 
seeing how easy it would be to adapt the book's code to
Oberon-7.

[^pio]: "Programming in Oberon: Steps beyond Pascal and Modula-2", Martin Reiser and Niklaus Wirth, Addison Wesley (18 May 1992), ISBN-10: 0201565439, ISBN-13: 978-0201565430, https://dl.acm.org/doi/book/10.1145/134408
