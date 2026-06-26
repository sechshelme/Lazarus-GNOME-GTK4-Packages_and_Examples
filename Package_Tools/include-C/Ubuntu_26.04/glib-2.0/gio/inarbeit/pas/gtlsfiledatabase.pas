unit gtlsfiledatabase;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2010 Collabora, Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * See the included COPYING file for more information.
 *
 * Author: Stef Walter <stefw@collabora.co.uk>
  }
{$ifndef __G_TLS_FILE_DATABASE_H__}
{$define __G_TLS_FILE_DATABASE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{*
 * GTlsFileDatabaseInterface:
 * @g_iface: The parent interface.
 *
 * Provides an interface for #GTlsFileDatabase implementations.
 *
  }
{< private > }
{ Padding for future expansion  }
  PGTlsFileDatabaseInterface = ^TGTlsFileDatabaseInterface;
  TGTlsFileDatabaseInterface = record
      g_iface : TGTypeInterface;
      padding : array[0..7] of Tgpointer;
    end;


function g_tls_file_database_get_type:TGType;cdecl;external libgio2;
function g_tls_file_database_new(anchors:Pgchar; error:PPGError):PGTlsDatabase;cdecl;external libgio2;
{$endif}
{ __G_TLS_FILE_DATABASE_H___  }

// === Konventiert am: 26-6-26 20:03:58 ===

function G_TYPE_TLS_FILE_DATABASE : TGType;
function G_TLS_FILE_DATABASE(obj : Pointer) : PGTlsFileDatabase;
function G_IS_TLS_FILE_DATABASE(obj : Pointer) : Tgboolean;
function G_TLS_FILE_DATABASE_GET_INTERFACE(obj : Pointer) : PGTlsFileDatabaseInterface;

implementation

function G_TYPE_TLS_FILE_DATABASE : TGType;
  begin
    G_TYPE_TLS_FILE_DATABASE:=g_tls_file_database_get_type;
  end;

function G_TLS_FILE_DATABASE(obj : Pointer) : PGTlsFileDatabase;
begin
  Result := PGTlsFileDatabase(g_type_check_instance_cast(obj, G_TYPE_TLS_FILE_DATABASE));
end;

function G_IS_TLS_FILE_DATABASE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TLS_FILE_DATABASE);
end;

function G_TLS_FILE_DATABASE_GET_INTERFACE(obj : Pointer) : PGTlsFileDatabaseInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_FILE_DATABASE);
end;



end.
