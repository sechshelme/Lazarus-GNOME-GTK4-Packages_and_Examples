
unit efl_file;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_file.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_file.h
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
PEina_File  = ^Eina_File;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_FILE_H}
{$define _EFL_FILE_H}
{ add doc note about needing ref/unref when passing efl_part to these functions  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_file_simple_load(obj:PEo; file:Pchar; key:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function efl_file_simple_mmap_load(obj:PEo; file:PEina_File; key:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_file_simple_get(obj:PEo; file:PPchar; key:PPchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_file_simple_mmap_get(obj:PEo; file:PPEina_File; key:PPchar);cdecl;external;
{$endif}

implementation


end.
