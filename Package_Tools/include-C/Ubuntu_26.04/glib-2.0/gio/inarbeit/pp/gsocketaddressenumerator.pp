
unit gsocketaddressenumerator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketaddressenumerator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketaddressenumerator.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGSocketAddress  = ^GSocketAddress;
PGSocketAddressEnumerator  = ^GSocketAddressEnumerator;
PGSocketAddressEnumeratorClass  = ^GSocketAddressEnumeratorClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Red Hat, Inc.
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
  }
{$ifndef __G_SOCKET_ADDRESS_ENUMERATOR_H__}
{$define __G_SOCKET_ADDRESS_ENUMERATOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SOCKET_ADDRESS_ENUMERATOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_ENUMERATOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS_ENUMERATOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGSocketAddressEnumerator = ^TGSocketAddressEnumerator;
  TGSocketAddressEnumerator = record
      parent_instance : TGObject;
    end;

{*
 * GSocketAddressEnumeratorClass:
 * @next: Virtual method for g_socket_address_enumerator_next().
 * @next_async: Virtual method for g_socket_address_enumerator_next_async().
 * @next_finish: Virtual method for g_socket_address_enumerator_next_finish().
 *
 * Class structure for #GSocketAddressEnumerator.
  }
{< private > }
{< public > }
{ Virtual Table  }
  PGSocketAddressEnumeratorClass = ^TGSocketAddressEnumeratorClass;
  TGSocketAddressEnumeratorClass = record
      parent_class : TGObjectClass;
      next : function (enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; error:PPGError):PGSocketAddress;cdecl;
      next_async : procedure (enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      next_finish : function (enumerator:PGSocketAddressEnumerator; result:PGAsyncResult; error:PPGError):PGSocketAddress;cdecl;
    end;


function g_socket_address_enumerator_get_type:TGType;cdecl;external;
function g_socket_address_enumerator_next(enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; error:PPGError):PGSocketAddress;cdecl;external;
procedure g_socket_address_enumerator_next_async(enumerator:PGSocketAddressEnumerator; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_socket_address_enumerator_next_finish(enumerator:PGSocketAddressEnumerator; result:PGAsyncResult; error:PPGError):PGSocketAddress;cdecl;external;
{$endif}
{ __G_SOCKET_ADDRESS_ENUMERATOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_ADDRESS_ENUMERATOR : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_ADDRESS_ENUMERATOR:=g_socket_address_enumerator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_ENUMERATOR(o : longint) : longint;
begin
  G_SOCKET_ADDRESS_ENUMERATOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_SOCKET_ADDRESS_ENUMERATOR,GSocketAddressEnumerator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;
begin
  G_SOCKET_ADDRESS_ENUMERATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_SOCKET_ADDRESS_ENUMERATOR,GSocketAddressEnumeratorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS_ENUMERATOR(o : longint) : longint;
begin
  G_IS_SOCKET_ADDRESS_ENUMERATOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_SOCKET_ADDRESS_ENUMERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS(k : longint) : longint;
begin
  G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_SOCKET_ADDRESS_ENUMERATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS(o : longint) : longint;
begin
  G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_SOCKET_ADDRESS_ENUMERATOR,GSocketAddressEnumeratorClass);
end;


end.
