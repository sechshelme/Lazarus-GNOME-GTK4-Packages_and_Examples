
unit adap_navigation_direction;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_navigation_direction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_navigation_direction.h
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
PAdapNavigationDirection  = ^AdapNavigationDirection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include "adap-enums.h"}
type
  PAdapNavigationDirection = ^TAdapNavigationDirection;
  TAdapNavigationDirection =  Longint;
  Const
    ADAP_NAVIGATION_DIRECTION_BACK = 0;
    ADAP_NAVIGATION_DIRECTION_FORWARD = 1;
;

implementation


end.
