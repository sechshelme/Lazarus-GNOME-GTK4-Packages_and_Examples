unit adap_navigation_direction;

interface

uses
  fp_adapta;

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

// === Konventiert am: 4-12-25 17:18:09 ===


implementation



end.
