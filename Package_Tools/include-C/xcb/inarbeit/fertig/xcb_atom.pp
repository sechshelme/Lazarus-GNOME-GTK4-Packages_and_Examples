
unit xcb_atom;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_atom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_atom.h
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


{$ifndef __XCB_ATOM_H__}
{$define __XCB_ATOM_H__}
{$include <xcb/xcb.h>}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)

function xcb_atom_name_by_screen(base:Pchar; screen:Tuint8_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_atom_name_by_resource(base:Pchar; resource:Tuint32_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_atom_name_unique(base:Pchar; id:Tuint32_t):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XCB_ATOM_H__  }

implementation


end.
