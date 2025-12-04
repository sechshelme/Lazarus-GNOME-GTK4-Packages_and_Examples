
unit adap_length_unit;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_length_unit.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_length_unit.h
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
PAdapLengthUnit  = ^AdapLengthUnit;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
type
  PAdapLengthUnit = ^TAdapLengthUnit;
  TAdapLengthUnit =  Longint;
  Const
    ADAP_LENGTH_UNIT_PX = 0;
    ADAP_LENGTH_UNIT_PT = 1;
    ADAP_LENGTH_UNIT_SP = 2;
;

function adap_length_unit_to_px(unit:TAdapLengthUnit; value:Tdouble; settings:PGtkSettings):Tdouble;cdecl;external;
function adap_length_unit_from_px(unit:TAdapLengthUnit; value:Tdouble; settings:PGtkSettings):Tdouble;cdecl;external;

implementation


end.
