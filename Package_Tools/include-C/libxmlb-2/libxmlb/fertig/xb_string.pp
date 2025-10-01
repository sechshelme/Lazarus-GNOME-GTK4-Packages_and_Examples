
unit xb_string;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_string.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_string.h
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
Pgchar  = ^gchar;
PGString  = ^GString;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-compile.h"}
(* Const before type ignored *)

procedure xb_string_append_union(xpath:PGString; fmt:Pgchar; args:array of const);cdecl;external;
procedure xb_string_append_union(xpath:PGString; fmt:Pgchar);cdecl;external;
(* Const before type ignored *)
function xb_string_escape(str:Pgchar):Pgchar;cdecl;external;

implementation


end.
