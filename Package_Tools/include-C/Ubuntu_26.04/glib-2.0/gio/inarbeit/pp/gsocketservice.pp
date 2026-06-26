
unit gsocketservice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketservice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketservice.h
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
PGObject  = ^GObject;
PGSocketConnection  = ^GSocketConnection;
PGSocketService  = ^GSocketService;
PGSocketServiceClass  = ^GSocketServiceClass;
PGSocketServicePrivate  = ^GSocketServicePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2009 Codethink Limited
 * Copyright © 2009 Red Hat, Inc
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
 *          Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_SOCKET_SERVICE_H__}
{$define __G_SOCKET_SERVICE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsocketlistener.h>}

{ was #define dname def_expr }
function G_TYPE_SOCKET_SERVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_SERVICE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_SERVICE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_SERVICE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_SERVICE_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_SERVICE_GET_CLASS(inst : longint) : longint;

type
{*
 * GSocketServiceClass:
 * @incoming: signal emitted when new connections are accepted
 *
 * Class structure for #GSocketService.
  }
{ Padding for future expansion  }
  PGSocketServiceClass = ^TGSocketServiceClass;
  TGSocketServiceClass = record
      parent_class : TGSocketListenerClass;
      incoming : function (service:PGSocketService; connection:PGSocketConnection; source_object:PGObject):Tgboolean;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
    end;

  PGSocketService = ^TGSocketService;
  TGSocketService = record
      parent_instance : TGSocketListener;
      priv : PGSocketServicePrivate;
    end;


function g_socket_service_get_type:TGType;cdecl;external;
function g_socket_service_new:PGSocketService;cdecl;external;
procedure g_socket_service_start(service:PGSocketService);cdecl;external;
procedure g_socket_service_stop(service:PGSocketService);cdecl;external;
function g_socket_service_is_active(service:PGSocketService):Tgboolean;cdecl;external;
{$endif}
{ __G_SOCKET_SERVICE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_SERVICE : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_SERVICE:=g_socket_service_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_SERVICE(inst : longint) : longint;
begin
  G_SOCKET_SERVICE:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SOCKET_SERVICE,GSocketService);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_SERVICE_CLASS(_class : longint) : longint;
begin
  G_SOCKET_SERVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SOCKET_SERVICE,GSocketServiceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_SERVICE(inst : longint) : longint;
begin
  G_IS_SOCKET_SERVICE:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SOCKET_SERVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_SERVICE_CLASS(_class : longint) : longint;
begin
  G_IS_SOCKET_SERVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SOCKET_SERVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_SERVICE_GET_CLASS(inst : longint) : longint;
begin
  G_SOCKET_SERVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SOCKET_SERVICE,GSocketServiceClass);
end;


end.
