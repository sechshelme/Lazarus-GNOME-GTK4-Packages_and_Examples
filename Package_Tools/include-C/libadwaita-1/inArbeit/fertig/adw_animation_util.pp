
unit adw_animation_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_animation_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_animation_util.h
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

function adw_lerp(a:Tdouble; b:Tdouble; t:Tdouble):Tdouble;cdecl;external;
function adw_get_enable_animations(widget:PGtkWidget):Tgboolean;cdecl;external;

implementation


end.
