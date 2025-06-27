
unit fltk;
interface

{
  Automatically converted by H2Pas 1.0.0 from fltk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fltk.h
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

function mgl_create_graph_fltk(draw:function (gr:THMGL; p:pointer):longint; title:Pchar; par:pointer; load:procedure (p:pointer)):THMGL;cdecl;external;
function mgl_fltk_run:longint;cdecl;external;
function mgl_fltk_thr:longint;cdecl;external;
(* Const before type ignored *)
procedure mgl_ask_fltk(quest:Pwchar_t; res:Pwchar_t);cdecl;external;
procedure mgl_progress_fltk(value:longint; maximal:longint; gr:THMGL);cdecl;external;
function mgl_fltk_widget(gr:THMGL):pointer;cdecl;external;

implementation


end.
