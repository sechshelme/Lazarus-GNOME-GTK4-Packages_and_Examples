unit adap_length_unit;

interface

uses
  fp_adapta;

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

function adap_length_unit_to_px(unit:TAdapLengthUnit; value:Tdouble; settings:PGtkSettings):Tdouble;cdecl;external libadapta;
function adap_length_unit_from_px(unit:TAdapLengthUnit; value:Tdouble; settings:PGtkSettings):Tdouble;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:08:42 ===


implementation



end.
