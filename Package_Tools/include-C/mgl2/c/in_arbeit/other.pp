
unit other;
interface

{
  Automatically converted by H2Pas 1.0.0 from other.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    other.h
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

procedure mgl_triplot_xyzc(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_triplot_xyz(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_triplot_xy(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_quadplot_xyzc(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_quadplot_xyz(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_quadplot_xy(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricont_xyzcv(gr:THMGL; v:THCDT; nums:THCDT; x:THCDT; y:THCDT; 
            z:THCDT; c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricont_xycv(gr:THMGL; v:THCDT; nums:THCDT; x:THCDT; y:THCDT; 
            z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricont_xyzc(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricont_xyc(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricontv_xyzcv(gr:THMGL; v:THCDT; nums:THCDT; x:THCDT; y:THCDT; 
            z:THCDT; c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricontv_xycv(gr:THMGL; v:THCDT; nums:THCDT; x:THCDT; y:THCDT; 
            z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricontv_xyzc(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            c:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tricontv_xyc(gr:THMGL; nums:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dots(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dots_a(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dots_ca(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            a:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_crust(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens_x(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens_y(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens_z(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_x(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_y(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_z(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_x_val(graph:THMGL; v:THCDT; a:THCDT; stl:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_y_val(graph:THMGL; v:THCDT; a:THCDT; stl:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_z_val(graph:THMGL; v:THCDT; a:THCDT; stl:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_x(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_y(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_z(graph:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_x_val(graph:THMGL; v:THCDT; a:THCDT; stl:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_y_val(graph:THMGL; v:THCDT; a:THCDT; stl:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_z_val(graph:THMGL; v:THCDT; a:THCDT; stl:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;

implementation


end.
