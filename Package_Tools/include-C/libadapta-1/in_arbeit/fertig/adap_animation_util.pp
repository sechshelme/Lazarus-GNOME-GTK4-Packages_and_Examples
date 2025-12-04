
unit adap_animation_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_animation_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_animation_util.h
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
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

function adap_lerp(a:Tdouble; b:Tdouble; t:Tdouble):Tdouble;cdecl;external;
function adap_get_enable_animations(widget:PGtkWidget):Tgboolean;cdecl;external;

implementation


end.
