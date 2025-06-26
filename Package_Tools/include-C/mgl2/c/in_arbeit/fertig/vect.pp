
unit vect;
interface

{
  Automatically converted by H2Pas 1.0.0 from vect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vect.h
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


(* Const before type ignored *)
(* Const before type ignored *)

procedure mgl_traj_xy(gr:THMGL; x:THCDT; y:THCDT; ax:THCDT; ay:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_traj_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_vect_xy(gr:THMGL; x:THCDT; y:THCDT; ax:THCDT; ay:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_vect_2d(gr:THMGL; ax:THCDT; ay:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_vect_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_vect_3d(gr:THMGL; ax:THCDT; ay:THCDT; az:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flow_xy(gr:THMGL; x:THCDT; y:THCDT; ax:THCDT; ay:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flow_2d(gr:THMGL; ax:THCDT; ay:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flow_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flow_3d(gr:THMGL; ax:THCDT; ay:THCDT; az:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flow3_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flow3(gr:THMGL; ax:THCDT; ay:THCDT; az:THCDT; sch:Pchar; 
            sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flowp_xy(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; x:THCDT; 
            y:THCDT; ax:THCDT; ay:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flowp_2d(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; ax:THCDT; 
            ay:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flowp_xyz(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; x:THCDT; 
            y:THCDT; z:THCDT; ax:THCDT; ay:THCDT; az:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_flowp_3d(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pipe_xy(gr:THMGL; x:THCDT; y:THCDT; ax:THCDT; ay:THCDT; 
            sch:Pchar; r0:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pipe_2d(gr:THMGL; ax:THCDT; ay:THCDT; sch:Pchar; r0:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pipe_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; r0:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pipe_3d(gr:THMGL; ax:THCDT; ay:THCDT; az:THCDT; sch:Pchar; 
            r0:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grad_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ph:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grad_xy(gr:THMGL; x:THCDT; y:THCDT; ph:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grad(gr:THMGL; ph:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_vect3_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; ax:THCDT; 
            ay:THCDT; az:THCDT; sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_vect3(gr:THMGL; ax:THCDT; ay:THCDT; az:THCDT; sch:Pchar; 
            sVal:Tdouble; opt:Pchar);cdecl;external;

implementation


end.
