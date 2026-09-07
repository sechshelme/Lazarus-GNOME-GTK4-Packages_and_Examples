
unit pk_control_sync;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_control_sync.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_control_sync.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PPkControl  = ^PkControl;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef __PK_CONTROL_SYNC_H}
{$define __PK_CONTROL_SYNC_H}
{$include <glib.h>}
{$include <packagekit-glib2/pk-control.h>}

function pk_control_get_properties(control:PPkControl; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function pk_control_get_transaction_list(control:PPkControl; cancellable:PGCancellable; error:PPGError):^Pgchar;cdecl;external;
function pk_control_suggest_daemon_quit(control:PPkControl; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pk_control_set_proxy(control:PPkControl; proxy_http:Pgchar; proxy_ftp:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function pk_control_set_proxy2(control:PPkControl; proxy_http:Pgchar; proxy_https:Pgchar; proxy_ftp:Pgchar; proxy_socks:Pgchar; 
           no_proxy:Pgchar; pac:Pgchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __PK_CONTROL_SYNC_H  }

implementation


end.
