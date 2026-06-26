
unit gtlsfiledatabase;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlsfiledatabase.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlsfiledatabase.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGTlsDatabase  = ^GTlsDatabase;
PGTlsFileDatabaseInterface  = ^GTlsFileDatabaseInterface;
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

{ was #define dname def_expr }
function G_TYPE_TLS_FILE_DATABASE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_FILE_DATABASE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_FILE_DATABASE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_FILE_DATABASE_GET_INTERFACE(inst : longint) : longint;

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


function g_tls_file_database_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_tls_file_database_new(anchors:Pgchar; error:PPGError):PGTlsDatabase;cdecl;external;
{$endif}
{ __G_TLS_FILE_DATABASE_H___  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_FILE_DATABASE : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_FILE_DATABASE:=g_tls_file_database_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_FILE_DATABASE(inst : longint) : longint;
begin
  G_TLS_FILE_DATABASE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TLS_FILE_DATABASE,GTlsFileDatabase);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_FILE_DATABASE(inst : longint) : longint;
begin
  G_IS_TLS_FILE_DATABASE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TLS_FILE_DATABASE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_FILE_DATABASE_GET_INTERFACE(inst : longint) : longint;
begin
  G_TLS_FILE_DATABASE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_TLS_FILE_DATABASE,GTlsFileDatabaseInterface);
end;


end.
