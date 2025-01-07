
unit adw_length_unit;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_length_unit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_length_unit.h
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
PAdwLengthUnit  = ^AdwLengthUnit;
PGtkSettings  = ^GtkSettings;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
type
  PAdwLengthUnit = ^TAdwLengthUnit;
  TAdwLengthUnit =  Longint;
  Const
    ADW_LENGTH_UNIT_PX = 0;
    ADW_LENGTH_UNIT_PT = 1;
    ADW_LENGTH_UNIT_SP = 2;
;

function adw_length_unit_to_px(unit:TAdwLengthUnit; value:Tdouble; settings:PGtkSettings):Tdouble;cdecl;external;
function adw_length_unit_from_px(unit:TAdwLengthUnit; value:Tdouble; settings:PGtkSettings):Tdouble;cdecl;external;

implementation


end.
