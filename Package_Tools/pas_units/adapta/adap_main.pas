unit adap_main;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <glib.h>}

procedure adap_init;cdecl;external libadapta;
function adap_is_initialized:Tgboolean;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:08:38 ===


implementation



end.
