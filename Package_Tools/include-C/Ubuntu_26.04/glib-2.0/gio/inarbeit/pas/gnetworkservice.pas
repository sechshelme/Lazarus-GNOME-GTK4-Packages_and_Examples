unit gnetworkservice;

interface

uses
  fp_glib2;

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
{$ifndef __G_NETWORK_SERVICE_H__}
{$define __G_NETWORK_SERVICE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGNetworkService = ^TGNetworkService;
  TGNetworkService = record
      parent_instance : TGObject;
      priv : PGNetworkServicePrivate;
    end;

  PGNetworkServiceClass = ^TGNetworkServiceClass;
  TGNetworkServiceClass = record
      parent_class : TGObjectClass;
    end;


function g_network_service_get_type:TGType;cdecl;external libgio2;
function g_network_service_new(service:Pgchar; protocol:Pgchar; domain:Pgchar):PGSocketConnectable;cdecl;external libgio2;
function g_network_service_get_service(srv:PGNetworkService):Pgchar;cdecl;external libgio2;
function g_network_service_get_protocol(srv:PGNetworkService):Pgchar;cdecl;external libgio2;
function g_network_service_get_domain(srv:PGNetworkService):Pgchar;cdecl;external libgio2;
function g_network_service_get_scheme(srv:PGNetworkService):Pgchar;cdecl;external libgio2;
procedure g_network_service_set_scheme(srv:PGNetworkService; scheme:Pgchar);cdecl;external libgio2;
{$endif}
{ __G_NETWORK_SERVICE_H__  }

// === Konventiert am: 26-6-26 19:43:25 ===

function G_TYPE_NETWORK_SERVICE : TGType;
function G_NETWORK_SERVICE(obj : Pointer) : PGNetworkService;
function G_NETWORK_SERVICE_CLASS(klass : Pointer) : PGNetworkServiceClass;
function G_IS_NETWORK_SERVICE(obj : Pointer) : Tgboolean;
function G_IS_NETWORK_SERVICE_CLASS(klass : Pointer) : Tgboolean;
function G_NETWORK_SERVICE_GET_CLASS(obj : Pointer) : PGNetworkServiceClass;

implementation

function G_TYPE_NETWORK_SERVICE : TGType;
  begin
    G_TYPE_NETWORK_SERVICE:=g_network_service_get_type;
  end;

function G_NETWORK_SERVICE(obj : Pointer) : PGNetworkService;
begin
  Result := PGNetworkService(g_type_check_instance_cast(obj, G_TYPE_NETWORK_SERVICE));
end;

function G_NETWORK_SERVICE_CLASS(klass : Pointer) : PGNetworkServiceClass;
begin
  Result := PGNetworkServiceClass(g_type_check_class_cast(klass, G_TYPE_NETWORK_SERVICE));
end;

function G_IS_NETWORK_SERVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_NETWORK_SERVICE);
end;

function G_IS_NETWORK_SERVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_NETWORK_SERVICE);
end;

function G_NETWORK_SERVICE_GET_CLASS(obj : Pointer) : PGNetworkServiceClass;
begin
  Result := PGNetworkServiceClass(PGTypeInstance(obj)^.g_class);
end;



end.
