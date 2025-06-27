
unit pde;
interface

{
  Automatically converted by H2Pas 1.0.0 from pde.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pde.h
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
Pmreal  = ^mreal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
(* Const before type ignored *)

function mgl_pde_solve_c(gr:THMGL; ham:Pchar; ini_re:THCDT; ini_im:THCDT; dz:Tmreal; 
           k0:Tmreal; opt:Pchar):THADT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_pde_solve(gr:THMGL; ham:Pchar; ini_re:THCDT; ini_im:THCDT; dz:Tmreal; 
           k0:Tmreal; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_pde_adv_c(gr:THMGL; ham:Pchar; ini_re:THCDT; ini_im:THCDT; dz:Tmreal; 
           k0:Tmreal; opt:Pchar):THADT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_pde_adv(gr:THMGL; ham:Pchar; ini_re:THCDT; ini_im:THCDT; dz:Tmreal; 
           k0:Tmreal; opt:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_qo2d_solve_c(ham:Pchar; ini_re:THCDT; ini_im:THCDT; ray:THCDT; r:Tmreal; 
           k0:Tmreal; xx:THMDT; yy:THMDT):THADT;cdecl;external;
function mgl_qo2d_func_c(ham:function (u:Tmreal; x:Tmreal; y:Tmreal; px:Tmreal; py:Tmreal; 
                      par:pointer):Tmdual; par:pointer; ini_re:THCDT; ini_im:THCDT; ray:THCDT; 
           r:Tmreal; k0:Tmreal; xx:THMDT; yy:THMDT):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_qo2d_solve(ham:Pchar; ini_re:THCDT; ini_im:THCDT; ray:THCDT; r:Tmreal; 
           k0:Tmreal; xx:THMDT; yy:THMDT):THMDT;cdecl;external;
function mgl_qo2d_func(ham:function (u:Tmreal; x:Tmreal; y:Tmreal; px:Tmreal; py:Tmreal; 
                      par:pointer):Tmdual; par:pointer; ini_re:THCDT; ini_im:THCDT; ray:THCDT; 
           r:Tmreal; k0:Tmreal; xx:THMDT; yy:THMDT):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_qo3d_solve_c(ham:Pchar; ini_re:THCDT; ini_im:THCDT; ray:THCDT; r:Tmreal; 
           k0:Tmreal; xx:THMDT; yy:THMDT; zz:THMDT):THADT;cdecl;external;
function mgl_qo3d_func_c(ham:function (u:Tmreal; x:Tmreal; y:Tmreal; z:Tmreal; px:Tmreal; 
                      py:Tmreal; pz:Tmreal; par:pointer):Tmdual; par:pointer; ini_re:THCDT; ini_im:THCDT; ray:THCDT; 
           r:Tmreal; k0:Tmreal; xx:THMDT; yy:THMDT; zz:THMDT):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_qo3d_solve(ham:Pchar; ini_re:THCDT; ini_im:THCDT; ray:THCDT; r:Tmreal; 
           k0:Tmreal; xx:THMDT; yy:THMDT; zz:THMDT):THMDT;cdecl;external;
function mgl_qo3d_func(ham:function (u:Tmreal; x:Tmreal; y:Tmreal; z:Tmreal; px:Tmreal; 
                      py:Tmreal; pz:Tmreal; par:pointer):Tmdual; par:pointer; ini_re:THCDT; ini_im:THCDT; ray:THCDT; 
           r:Tmreal; k0:Tmreal; xx:THMDT; yy:THMDT; zz:THMDT):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_ode_solve(func:procedure (x:Pmreal; dx:Pmreal; par:pointer); n:longint; x0:Pmreal; dt:Tmreal; tmax:Tmreal; 
           par:pointer):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_ode_solve_str(func:Pchar; var:Pchar; x0:THCDT; dt:Tmreal; tmax:Tmreal):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_ode_solve_str_c(func:Pchar; var:Pchar; x0:THCDT; dt:Tmreal; tmax:Tmreal):THADT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_ode_solve_set(func:Pchar; var:Pchar; brd:char; x0:THCDT; dt:Tmreal; 
           tmax:Tmreal):THMDT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_ode_solve_set_c(func:Pchar; var:Pchar; brd:char; x0:THCDT; dt:Tmreal; 
           tmax:Tmreal):THADT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_ode_solve_ex(func:procedure (x:Pmreal; dx:Pmreal; par:pointer); n:longint; x0:Pmreal; dt:Tmreal; tmax:Tmreal; 
           par:pointer; bord:procedure (x:Pmreal; xp:Pmreal; par:pointer)):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_ray_trace(ham:Pchar; x0:Tmreal; y0:Tmreal; z0:Tmreal; px:Tmreal; 
           py:Tmreal; pz:Tmreal; dt:Tmreal; tmax:Tmreal):THMDT;cdecl;external;
function mgl_jacobian_2d(x:THCDT; y:THCDT):THMDT;cdecl;external;
function mgl_jacobian_3d(x:THCDT; y:THCDT; z:THCDT):THMDT;cdecl;external;

implementation


end.
