
unit nm-core-types;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-core-types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-core-types.h
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


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2014 - 2018 Red Hat, Inc.
  }
{$ifndef __NM_CORE_TYPES_H__}
{$define __NM_CORE_TYPES_H__}
{$include <glib-object.h>}
{$include "nm-version.h"}
{$include "nm-dbus-interface.h"}
{$include "nm-core-enum-types.h"}
type
(* Const before type ignored *)

  TNMUtilsPredicateStr = function (str:Pchar):Tgboolean;cdecl;
{$endif}
{ __NM_CORE_TYPES_H__  }

implementation


end.
