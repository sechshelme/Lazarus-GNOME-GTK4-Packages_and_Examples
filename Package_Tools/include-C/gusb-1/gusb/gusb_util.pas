unit gusb_util;

interface

uses
  fp_gusb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2011 Hans de Goede <hdegoede@redhat.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}

function g_usb_strerror(error_code:Tgint):Pgchar;cdecl;external libgusb;

// === Konventiert am: 26-8-26 19:42:11 ===


implementation



end.
