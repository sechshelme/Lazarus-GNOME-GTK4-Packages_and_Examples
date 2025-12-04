unit adap_easing;

interface

uses
  fp_adapta;

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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <glib.h>}
{$include "adap-enums.h"}
type
  PAdapEasing = ^TAdapEasing;
  TAdapEasing =  Longint;
  Const
    ADAP_LINEAR = 0;
    ADAP_EASE_IN_QUAD = 1;
    ADAP_EASE_OUT_QUAD = 2;
    ADAP_EASE_IN_OUT_QUAD = 3;
    ADAP_EASE_IN_CUBIC = 4;
    ADAP_EASE_OUT_CUBIC = 5;
    ADAP_EASE_IN_OUT_CUBIC = 6;
    ADAP_EASE_IN_QUART = 7;
    ADAP_EASE_OUT_QUART = 8;
    ADAP_EASE_IN_OUT_QUART = 9;
    ADAP_EASE_IN_QUINT = 10;
    ADAP_EASE_OUT_QUINT = 11;
    ADAP_EASE_IN_OUT_QUINT = 12;
    ADAP_EASE_IN_SINE = 13;
    ADAP_EASE_OUT_SINE = 14;
    ADAP_EASE_IN_OUT_SINE = 15;
    ADAP_EASE_IN_EXPO = 16;
    ADAP_EASE_OUT_EXPO = 17;
    ADAP_EASE_IN_OUT_EXPO = 18;
    ADAP_EASE_IN_CIRC = 19;
    ADAP_EASE_OUT_CIRC = 20;
    ADAP_EASE_IN_OUT_CIRC = 21;
    ADAP_EASE_IN_ELASTIC = 22;
    ADAP_EASE_OUT_ELASTIC = 23;
    ADAP_EASE_IN_OUT_ELASTIC = 24;
    ADAP_EASE_IN_BACK = 25;
    ADAP_EASE_OUT_BACK = 26;
    ADAP_EASE_IN_OUT_BACK = 27;
    ADAP_EASE_IN_BOUNCE = 28;
    ADAP_EASE_OUT_BOUNCE = 29;
    ADAP_EASE_IN_OUT_BOUNCE = 30;
;

function adap_easing_ease(self:TAdapEasing; value:Tdouble):Tdouble;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:09:10 ===


implementation



end.
