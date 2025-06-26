
unit prim;
interface

{
  Automatically converted by H2Pas 1.0.0 from prim.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    prim.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pwchar_t  = ^wchar_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)

procedure mgl_mark(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; mark:Pchar);cdecl;external;
procedure mgl_ball(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_line(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
            y2:Tdouble; z2:Tdouble; pen:Pchar; n:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_curve(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; dx1:Tdouble; 
            dy1:Tdouble; dz1:Tdouble; x2:Tdouble; y2:Tdouble; z2:Tdouble; 
            dx2:Tdouble; dy2:Tdouble; dz2:Tdouble; pen:Pchar; n:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_error_box(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; ex:Tdouble; 
            ey:Tdouble; ez:Tdouble; pen:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_face(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; x1:Tdouble; 
            y1:Tdouble; z1:Tdouble; x2:Tdouble; y2:Tdouble; z2:Tdouble; 
            x3:Tdouble; y3:Tdouble; z3:Tdouble; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_facex(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; wy:Tdouble; 
            wz:Tdouble; stl:Pchar; dx:Tdouble; dy:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_facey(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; wx:Tdouble; 
            wz:Tdouble; stl:Pchar; dx:Tdouble; dy:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_facez(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; wx:Tdouble; 
            wy:Tdouble; stl:Pchar; dx:Tdouble; dy:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_sphere(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; r:Tdouble; 
            stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_drop(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; dx:Tdouble; 
            dy:Tdouble; dz:Tdouble; r:Tdouble; stl:Pchar; shift:Tdouble; 
            ap:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_cone(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
            y2:Tdouble; z2:Tdouble; r1:Tdouble; r2:Tdouble; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_ellipse(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
            y2:Tdouble; z2:Tdouble; r:Tdouble; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_rhomb(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
            y2:Tdouble; z2:Tdouble; r:Tdouble; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_polygon(gr:THMGL; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
            y2:Tdouble; z2:Tdouble; n:longint; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_arc_ext(gr:THMGL; x0:Tdouble; y0:Tdouble; z0:Tdouble; xr:Tdouble; 
            yr:Tdouble; zr:Tdouble; x1:Tdouble; y1:Tdouble; z1:Tdouble; 
            a:Tdouble; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_arc(gr:THMGL; x0:Tdouble; y0:Tdouble; x1:Tdouble; y1:Tdouble; 
            a:Tdouble; stl:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cones_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cones_xz(graph:THMGL; x:THCDT; z:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cones(graph:THMGL; z:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dew_xy(gr:THMGL; x:THCDT; y:THCDT; ax:THCDT; ay:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dew_2d(gr:THMGL; ax:THCDT; ay:THCDT; sch:Pchar; optl:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_puts(graph:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; text:Pchar; 
            font:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_putsw(graph:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; text:Pwchar_t; 
            font:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_puts_dir(graph:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; dx:Tdouble; 
            dy:Tdouble; dz:Tdouble; text:Pchar; font:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_putsw_dir(graph:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; dx:Tdouble; 
            dy:Tdouble; dz:Tdouble; text:Pwchar_t; font:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_symbol(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; id:char; 
            how:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_symbol_dir(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; dx:Tdouble; 
            dy:Tdouble; dz:Tdouble; id:char; how:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmark_xyzr(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:THCDT; 
            text:Pchar; fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmarkw_xyzr(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:THCDT; 
            text:Pwchar_t; fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmark_xyr(graph:THMGL; x:THCDT; y:THCDT; r:THCDT; text:Pchar; 
            fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmarkw_xyr(graph:THMGL; x:THCDT; y:THCDT; r:THCDT; text:Pwchar_t; 
            fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmark_yr(graph:THMGL; y:THCDT; r:THCDT; text:Pchar; fnt:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmarkw_yr(graph:THMGL; y:THCDT; r:THCDT; text:Pwchar_t; fnt:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmark(graph:THMGL; y:THCDT; text:Pchar; fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textmarkw(graph:THMGL; y:THCDT; text:Pwchar_t; fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_label_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; text:Pchar; 
            fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_labelw_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; text:Pwchar_t; 
            fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_label_xy(graph:THMGL; x:THCDT; y:THCDT; text:Pchar; fnt:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_labelw_xy(graph:THMGL; x:THCDT; y:THCDT; text:Pwchar_t; fnt:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_label_y(graph:THMGL; y:THCDT; text:Pchar; fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_labelw_y(graph:THMGL; y:THCDT; text:Pwchar_t; fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_table(gr:THMGL; x:Tdouble; y:Tdouble; val:THCDT; text:Pchar; 
            fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tablew(gr:THMGL; x:Tdouble; y:Tdouble; val:THCDT; text:Pwchar_t; 
            fnt:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_logo(gr:THMGL; w:longint; h:longint; rgba:Pbyte; smooth:longint; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_logo_file(gr:THMGL; fname:Pchar; smooth:longint; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lamerey(gr:THMGL; x0:Tdouble; f:function (para1:Tdouble; para2:pointer):Tdouble; par:pointer; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lamerey_dat(gr:THMGL; x0:Tdouble; f:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lamerey_str(gr:THMGL; x0:Tdouble; f:Pchar; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bifurcation(gr:THMGL; dx:Tdouble; f:function (para1:Tdouble; para2:Tdouble; para3:pointer):Tdouble; par:pointer; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bifurcation_dat(gr:THMGL; dx:Tdouble; f:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bifurcation_str(gr:THMGL; dx:Tdouble; f:Pchar; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_iris(gr:THMGL; dats:THCDT; ranges:THCDT; ids:Pchar; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_iris_1(gr:THMGL; dats:THCDT; ids:Pchar; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_irisw(gr:THMGL; dats:THCDT; ranges:THCDT; ids:Pwchar_t; stl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_irisw_1(gr:THMGL; dats:THCDT; ids:Pwchar_t; stl:Pchar; opt:Pchar);cdecl;external;

implementation


end.
