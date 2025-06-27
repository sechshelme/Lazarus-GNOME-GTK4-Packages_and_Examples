
unit glut;
interface

{
  Automatically converted by H2Pas 1.0.0 from glut.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glut.h
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



procedure _mgl_key_up(ch:byte; para2:longint; para3:longint);cdecl;external;
(* Const before type ignored *)
function mgl_create_graph_glut(draw:function (gr:THMGL; p:pointer):longint; title:Pchar; par:pointer; load:procedure (p:pointer)):THMGL;cdecl;external;
procedure mgl_glut_toggle_alpha(gr:THMGL);cdecl;external;
procedure mgl_glut_toggle_light(gr:THMGL);cdecl;external;
procedure mgl_glut_toggle_no(gr:THMGL);cdecl;external;
procedure mgl_glut_update(gr:THMGL);cdecl;external;
procedure mgl_glut_reload(gr:THMGL);cdecl;external;
procedure mgl_glut_next_frame(gr:THMGL);cdecl;external;
procedure mgl_glut_prev_frame(gr:THMGL);cdecl;external;
procedure mgl_glut_animation(gr:THMGL);cdecl;external;

implementation


end.
