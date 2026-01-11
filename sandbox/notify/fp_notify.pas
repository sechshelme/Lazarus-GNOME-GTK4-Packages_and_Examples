unit fp_notify;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2004-2006 Christian Hammond
 * Copyright (C) 2010 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA  02111-1307, USA.
  }
{$ifndef _LIBNOTIFY_NOTIFY_H_}
{$define _LIBNOTIFY_NOTIFY_H_}
{$include <glib.h>}
{$include <libnotify/notification.h>}
{$include <libnotify/notify-enum-types.h>}
{$include <libnotify/notify-features.h>}

function notify_init(app_name:Pchar):Tgboolean;cdecl;external libnotify;
procedure notify_uninit;cdecl;external libnotify;
function notify_is_initted:Tgboolean;cdecl;external libnotify;
function notify_get_app_name:Pchar;cdecl;external libnotify;
procedure notify_set_app_name(app_name:Pchar);cdecl;external libnotify;
function notify_get_server_caps:PGList;cdecl;external libnotify;
function notify_get_server_info(ret_name:PPchar; ret_vendor:PPchar; ret_version:PPchar; ret_spec_version:PPchar):Tgboolean;cdecl;external libnotify;
{$endif}
{ _LIBNOTIFY_NOTIFY_H_  }

// === Konventiert am: 11-1-26 14:02:59 ===


implementation



end.
