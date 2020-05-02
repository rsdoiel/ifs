(**IFS.Mod is based on a program in "Programming in Oberon:
Steps beyond Pascal and Modula-2", by Martin Reisner and 
Niklaus Wirth, published in 1992, by ACM Books, Chapter 7.3, 
Pages 92 through 95. 

The program has been modified to conform to Oberon-7 using the
OBNC compiler, v0.16.1 by Karl Landstrom.
*)
MODULE IFS;

IMORT RandomNumbers, In, Out, XYplane;

VAR
  a1, b1, c1, d1, e1, f1, p1 : REAL; (* IFS parameters *)
  a2, b2, c2, d2, e2, f2, p2 : REAL; (* IFS parameters *)
  a3, b3, c3, d3, e3, f3, p3 : REAL; (* IFS parameters *)
  a4, b4, c4, d4, e4, f4, p4 : REAL; (* IFS parameters *)
  X, Y : REAL; (* the position on of the pen *)
  x0: INTEGER; (* Distance of the originam from the left edge[pixels] *)
  y0: INTEGER; (* Distance of the originam from the bottom edge[pixels] *)
  e : INTEGER; (* Size of unit interval [pixels] *)
  initialized: BOOLEAN; (* Are parameters initialized? *)

PROCEDURE Draw*; (* command marked for export *)
VAR
  x, y : REAL; (* new position *)
  xi, eta : INTEGER; (* pixel coordinates of pen *)

END IFS.
