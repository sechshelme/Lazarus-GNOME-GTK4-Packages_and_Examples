
unit adw_easing;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_easing.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_easing.h
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
PAdwEasing  = ^AdwEasing;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <glib.h>}
{$include "adw-enums.h"}
type
  PAdwEasing = ^TAdwEasing;
  TAdwEasing =  Longint;
  Const
    ADW_LINEAR = 0;
    ADW_EASE_IN_QUAD = 1;
    ADW_EASE_OUT_QUAD = 2;
    ADW_EASE_IN_OUT_QUAD = 3;
    ADW_EASE_IN_CUBIC = 4;
    ADW_EASE_OUT_CUBIC = 5;
    ADW_EASE_IN_OUT_CUBIC = 6;
    ADW_EASE_IN_QUART = 7;
    ADW_EASE_OUT_QUART = 8;
    ADW_EASE_IN_OUT_QUART = 9;
    ADW_EASE_IN_QUINT = 10;
    ADW_EASE_OUT_QUINT = 11;
    ADW_EASE_IN_OUT_QUINT = 12;
    ADW_EASE_IN_SINE = 13;
    ADW_EASE_OUT_SINE = 14;
    ADW_EASE_IN_OUT_SINE = 15;
    ADW_EASE_IN_EXPO = 16;
    ADW_EASE_OUT_EXPO = 17;
    ADW_EASE_IN_OUT_EXPO = 18;
    ADW_EASE_IN_CIRC = 19;
    ADW_EASE_OUT_CIRC = 20;
    ADW_EASE_IN_OUT_CIRC = 21;
    ADW_EASE_IN_ELASTIC = 22;
    ADW_EASE_OUT_ELASTIC = 23;
    ADW_EASE_IN_OUT_ELASTIC = 24;
    ADW_EASE_IN_BACK = 25;
    ADW_EASE_OUT_BACK = 26;
    ADW_EASE_IN_OUT_BACK = 27;
    ADW_EASE_IN_BOUNCE = 28;
    ADW_EASE_OUT_BOUNCE = 29;
    ADW_EASE_IN_OUT_BOUNCE = 30;
;

function adw_easing_ease(self:TAdwEasing; value:Tdouble):Tdouble;cdecl;external;

implementation


end.
