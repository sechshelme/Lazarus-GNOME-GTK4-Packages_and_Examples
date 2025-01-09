
unit adw_navigation_direction;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_navigation_direction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_navigation_direction.h
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
PAdwNavigationDirection  = ^AdwNavigationDirection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include "adw-enums.h"}
type
  PAdwNavigationDirection = ^TAdwNavigationDirection;
  TAdwNavigationDirection =  Longint;
  Const
    ADW_NAVIGATION_DIRECTION_BACK = 0;
    ADW_NAVIGATION_DIRECTION_FORWARD = 1;
;

implementation


end.
