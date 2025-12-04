unit adap_fold_threshold_policy;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Christopher Davis <christopherdavis@gnome.org>
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
  PAdapFoldThresholdPolicy = ^TAdapFoldThresholdPolicy;
  TAdapFoldThresholdPolicy =  Longint;
  Const
    ADAP_FOLD_THRESHOLD_POLICY_MINIMUM = 0;
    ADAP_FOLD_THRESHOLD_POLICY_NATURAL = 1;
;

// === Konventiert am: 4-12-25 17:08:52 ===


implementation



end.
