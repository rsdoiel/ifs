(**IFS.Mod is based on a program in "Programming in Oberon:
Steps beyond Pascal and Modula-2", by Martin Reisner and 
Niklaus Wirth, published in 1992, by ACM Books, Chapter 7.3, 
Pages 92 through 95. 

The program has been modified to conform to Oberon-7 using the
OBNC compiler, v0.16.1 by Karl Landstrom.
*)
MODULE IFS;

IMPORT RandomNumbers, In, Out, XYplane;

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

PROCEDURE Draw*;     (* command marked for export *)
VAR
  x, y : REAL;       (* new position *)
  xi, eta : INTEGER; (* pixel coordinates of pen *)
  rn : REAL;         (* temp. variable for random number *)
BEGIN
  IF initialized THEN
    WHILE "s" # XYplane.Key() DO
      rn := RandomNumbers.Uniform();
      IF rn < p1 THEN
        x := (a1 * X) + (b1 * Y) + e1; y := (c1 * X) + (d1 * Y) + f1;
      ELSIF rn < (p1 + p2) THEN
        x := (a2 * X) + (b2 * Y) + e2; y := (c2 * X) + (d2 * Y) + f2;
      ELSIF rn < (p1 + p2 + p3) THEN
        x := (a3 * X) + (b3 * Y) + e3; y := (c3 * X) + (d3 * Y) + f3;
      ELSE
        x := (a4 * X) + (b4 * Y) + e4; y := (c4 * X) + (d4 * Y) + f4;
      END;
      X := x; xi := x0 + FLOOR(X*FLT(e));
      Y := y; eta := y0 + FLOOR(Y*FLT(e));
      XYplane.Dot(xi, eta, XYplane.draw);
    END;
  END;
END Draw;

PROCEDURE Init*; (* command marked for export *)
BEGIN
  X := 0.0; Y := 0.0; (* Initial position of pen *)
  initialized := FALSE; In.Open;
  Out.String("Reading (int) x0, y0 and e");Out.Ln;
  In.Int(x0);  In.Int(y0);  In.Int(e); 
  Out.String("Reading (real) a1 to a4");Out.Ln;
  In.Real(a1); In.Real(a2); In.Real(a3); In.Real(a4); 
  Out.String("Reading (real) b1 to b4");Out.Ln;
  In.Real(b1); In.Real(b2); In.Real(b3); In.Real(b4);
  Out.String("Reading (real) c1 to c4");Out.Ln;
  In.Real(c1); In.Real(c2); In.Real(c3); In.Real(c4);
  Out.String("Reading (real) d1 to d4");Out.Ln;
  In.Real(d1); In.Real(d2); In.Real(d3); In.Real(d4); 
  Out.String("Reading (real) e1 to e4");Out.Ln;
  In.Real(e1); In.Real(e2); In.Real(e3); In.Real(e4); 
  Out.String("Reading (real) f1 to f4");Out.Ln;
  In.Real(f1); In.Real(f2); In.Real(f3); In.Real(f4); 
  Out.String("Reading (real) p1 to p4");Out.Ln;
  In.Real(p1); In.Real(p2); In.Real(p3); In.Real(p4); 
  IF In.Done THEN XYplane.Open; initialized := TRUE
  ELSE Out.String("Parameter error"); Out.Ln;
  END;
END Init;

BEGIN initialized := FALSE;
  Init();
  Draw();
END IFS.
