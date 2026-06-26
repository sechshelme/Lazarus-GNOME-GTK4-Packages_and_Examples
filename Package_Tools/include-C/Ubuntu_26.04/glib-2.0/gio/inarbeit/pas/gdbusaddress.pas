unit gdbusaddress;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_DBUS_ADDRESS_H__}
{$define __G_DBUS_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

function g_dbus_address_escape_value(_string:Pgchar):Pgchar;cdecl;external libgio2;
function g_dbus_is_address(_string:Pgchar):Tgboolean;cdecl;external libgio2;
function g_dbus_is_supported_address(_string:Pgchar; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_dbus_address_get_stream(address:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_dbus_address_get_stream_finish(res:PGAsyncResult; out_guid:PPgchar; error:PPGError):PGIOStream;cdecl;external libgio2;
function g_dbus_address_get_stream_sync(address:Pgchar; out_guid:PPgchar; cancellable:PGCancellable; error:PPGError):PGIOStream;cdecl;external libgio2;
function g_dbus_address_get_for_bus_sync(bus_type:TGBusType; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;external libgio2;
{$endif}
{ __G_DBUS_ADDRESS_H__  }

// === Konventiert am: 26-6-26 16:43:40 ===


implementation



end.
