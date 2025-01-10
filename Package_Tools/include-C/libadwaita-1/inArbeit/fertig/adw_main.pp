
unit adw_main;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_main.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_main.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <glib.h>}

procedure adw_init;cdecl;external;
function adw_is_initialized:Tgboolean;cdecl;external;

implementation


end.
