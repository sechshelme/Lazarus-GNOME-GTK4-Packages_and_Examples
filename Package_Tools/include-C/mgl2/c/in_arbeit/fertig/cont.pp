
unit cont;
interface

{
  Automatically converted by H2Pas 1.0.0 from cont.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cont.h
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
Pwchar_t  = ^wchar_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure mgl_text_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; text:Pchar; 
            font:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textw_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; text:Pwchar_t; 
            font:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_text_xy(gr:THMGL; x:THCDT; y:THCDT; text:Pchar; font:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textw_xy(gr:THMGL; x:THCDT; y:THCDT; text:Pwchar_t; font:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_text_y(gr:THMGL; y:THCDT; text:Pchar; font:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textw_y(gr:THMGL; y:THCDT; text:Pwchar_t; font:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dcont_gen(gr:THMGL; val:Tdouble; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; b:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_gen(gr:THMGL; val:Tdouble; a:THCDT; x:THCDT; y:THCDT; 
            z:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_gen(gr:THMGL; v1:Tdouble; v2:Tdouble; a:THCDT; x:THCDT; 
            y:THCDT; z:THCDT; stl:Pchar; opt:Pchar);cdecl;external;
{ ??????????????????????????? }
(* Const before type ignored *)
procedure mgl_contv_gen(gr:THMGL; v1:Tdouble; v2:Tdouble; a:THCDT; x:THCDT; 
            y:THCDT; z:THCDT; stl:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_axial_gen(gr:THMGL; v1:Tdouble; v2:Tdouble; a:THCDT; x:THCDT; 
            y:THCDT; z:THCDT; stl:Pchar);cdecl;external;
{ ??????????????????????????? }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dcont_xyz(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; b:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dcont(gr:THMGL; v:THCDT; a:THCDT; b:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_xy_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_val(gr:THMGL; v:THCDT; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont_xy(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont(gr:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_xy_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_val(gr:THMGL; v:THCDT; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf_xy(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf(gr:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contd_xy_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contd_val(gr:THMGL; v:THCDT; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contd_xy(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contd(gr:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contv_xy_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contv_val(gr:THMGL; v:THCDT; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contv_xy(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contv(gr:THMGL; z:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contp_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contp(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axial_xy_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; a:THCDT; 
            sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axial_val(gr:THMGL; v:THCDT; a:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axial_xy(gr:THMGL; x:THCDT; y:THCDT; a:THCDT; sch:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axial(gr:THMGL; a:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_torus(gr:THMGL; r:THCDT; z:THCDT; col:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grid3_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_grid3(gr:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens3_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_dens3(gr:THMGL; a:THCDT; stl:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont3_xyz_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont3_val(gr:THMGL; v:THCDT; a:THCDT; sch:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont3_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_cont3(gr:THMGL; a:THCDT; sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf3_xyz_val(gr:THMGL; v:THCDT; x:THCDT; y:THCDT; z:THCDT; 
            a:THCDT; sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf3_val(gr:THMGL; v:THCDT; a:THCDT; sch:Pchar; sVal:Tdouble; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf3_xyz(gr:THMGL; x:THCDT; y:THCDT; z:THCDT; a:THCDT; 
            sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_contf3(gr:THMGL; a:THCDT; sch:Pchar; sVal:Tdouble; opt:Pchar);cdecl;external;

implementation


end.
