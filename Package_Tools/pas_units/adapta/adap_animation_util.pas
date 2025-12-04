unit adap_animation_util;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

function adap_lerp(a:Tdouble; b:Tdouble; t:Tdouble):Tdouble;cdecl;external libadapta;
function adap_get_enable_animations(widget:PGtkWidget):Tgboolean;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:00:48 ===


implementation



end.
