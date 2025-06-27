
unit fit;
interface

{
  Automatically converted by H2Pas 1.0.0 from fit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fit.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  var
    mglFitPnts : longint;cvar;external;
{/< Number of output points in fitting }
    mglFitRes : array[0..1023] of char;cvar;external;
{/< Last fitted formula }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function mgl_fit_1(gr:THMGL; y:THCDT; eq:Pchar; vars:Pchar; ini:THMDT; 
           opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_2(gr:THMGL; z:THCDT; eq:Pchar; vars:Pchar; ini:THMDT; 
           opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_3(gr:THMGL; a:THCDT; eq:Pchar; vars:Pchar; ini:THMDT; 
           opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_xy(gr:THMGL; x:THCDT; y:THCDT; eq:Pchar; vars:Pchar; 
           ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; eq:Pchar; 
           vars:Pchar; ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_xyza(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
           eq:Pchar; vars:Pchar; ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_ys(gr:THMGL; y:THCDT; s:THCDT; eq:Pchar; vars:Pchar; 
           ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_xys(gr:THMGL; x:THCDT; y:THCDT; s:THCDT; eq:Pchar; 
           vars:Pchar; ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_xyzs(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; s:THCDT; 
           eq:Pchar; vars:Pchar; ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_fit_xyzas(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
           s:THCDT; eq:Pchar; vars:Pchar; ini:THMDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_get_fit(gr:THMGL):Pchar;cdecl;external;
(* Const before type ignored *)
function mgl_hist_x(gr:THMGL; x:THCDT; a:THCDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_hist_xy(gr:THMGL; x:THCDT; y:THCDT; a:THCDT; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_hist_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
           opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_puts_fit(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; prefix:Pchar; 
            font:Pchar; size:Tdouble);cdecl;external;
function mgl_get_fit_chi:Tmreal;cdecl;external;
function mgl_get_fit_covar:THCDT;cdecl;external;

implementation


end.
