unit gthreadedsocketservice;

interface

uses
  fp_glib2;

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
{$ifndef __G_THREADED_SOCKET_SERVICE_H__}
{$define __G_THREADED_SOCKET_SERVICE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsocketservice.h>}

type
{ Padding for future expansion  }
  PGThreadedSocketServiceClass = ^TGThreadedSocketServiceClass;
  TGThreadedSocketServiceClass = record
      parent_class : TGSocketServiceClass;
      run : function (service:PGThreadedSocketService; connection:PGSocketConnection; source_object:PGObject):Tgboolean;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;

  PGThreadedSocketService = ^TGThreadedSocketService;
  TGThreadedSocketService = record
      parent_instance : TGSocketService;
      priv : PGThreadedSocketServicePrivate;
    end;


function g_threaded_socket_service_get_type:TGType;cdecl;external libgio2;
function g_threaded_socket_service_new(max_threads:longint):PGSocketService;cdecl;external libgio2;
{$endif}
{ __G_THREADED_SOCKET_SERVICE_H__  }

// === Konventiert am: 26-6-26 19:59:19 ===

function G_TYPE_THREADED_SOCKET_SERVICE : TGType;
function G_THREADED_SOCKET_SERVICE(obj : Pointer) : PGThreadedSocketService;
function G_THREADED_SOCKET_SERVICE_CLASS(klass : Pointer) : PGThreadedSocketServiceClass;
function G_IS_THREADED_SOCKET_SERVICE(obj : Pointer) : Tgboolean;
function G_IS_THREADED_SOCKET_SERVICE_CLASS(klass : Pointer) : Tgboolean;
function G_THREADED_SOCKET_SERVICE_GET_CLASS(obj : Pointer) : PGThreadedSocketServiceClass;

implementation

function G_TYPE_THREADED_SOCKET_SERVICE : TGType;
  begin
    G_TYPE_THREADED_SOCKET_SERVICE:=g_threaded_socket_service_get_type;
  end;

function G_THREADED_SOCKET_SERVICE(obj : Pointer) : PGThreadedSocketService;
begin
  Result := PGThreadedSocketService(g_type_check_instance_cast(obj, G_TYPE_THREADED_SOCKET_SERVICE));
end;

function G_THREADED_SOCKET_SERVICE_CLASS(klass : Pointer) : PGThreadedSocketServiceClass;
begin
  Result := PGThreadedSocketServiceClass(g_type_check_class_cast(klass, G_TYPE_THREADED_SOCKET_SERVICE));
end;

function G_IS_THREADED_SOCKET_SERVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_THREADED_SOCKET_SERVICE);
end;

function G_IS_THREADED_SOCKET_SERVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_THREADED_SOCKET_SERVICE);
end;

function G_THREADED_SOCKET_SERVICE_GET_CLASS(obj : Pointer) : PGThreadedSocketServiceClass;
begin
  Result := PGThreadedSocketServiceClass(PGTypeInstance(obj)^.g_class);
end;



end.
