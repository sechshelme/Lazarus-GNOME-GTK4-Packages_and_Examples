
unit adap_main;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_main.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_main.h
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <glib.h>}

procedure adap_init;cdecl;external;
function adap_is_initialized:Tgboolean;cdecl;external;

implementation


end.
