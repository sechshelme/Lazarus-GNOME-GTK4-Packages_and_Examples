
unit adap_fold_threshold_policy;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_fold_threshold_policy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_fold_threshold_policy.h
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
PAdapFoldThresholdPolicy  = ^AdapFoldThresholdPolicy;
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

implementation


end.
