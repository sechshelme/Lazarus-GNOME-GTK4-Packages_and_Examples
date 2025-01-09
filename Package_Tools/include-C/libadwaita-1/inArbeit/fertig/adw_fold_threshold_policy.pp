
unit adw_fold_threshold_policy;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_fold_threshold_policy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_fold_threshold_policy.h
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
PAdwFoldThresholdPolicy  = ^AdwFoldThresholdPolicy;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Christopher Davis <christopherdavis@gnome.org>
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
  PAdwFoldThresholdPolicy = ^TAdwFoldThresholdPolicy;
  TAdwFoldThresholdPolicy =  Longint;
  Const
    ADW_FOLD_THRESHOLD_POLICY_MINIMUM = 0;
    ADW_FOLD_THRESHOLD_POLICY_NATURAL = 1;
;

implementation


end.
