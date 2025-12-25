unit ga_client;

interface

uses
  fp_avahi_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * ga-client.h - Header for GaClient
 * Copyright (C) 2006-2007 Collabora Ltd.
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
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef __GA_CLIENT_H__}
{$define __GA_CLIENT_H__}
{$include <glib-object.h>}
{$include <avahi-client/client.h>}
type
  PGaClientState = ^TGaClientState;
  TGaClientState =  Longint;
  Const
    GA_CLIENT_STATE_NOT_STARTED = -(1);
    GA_CLIENT_STATE_S_REGISTERING = AVAHI_CLIENT_S_REGISTERING;
    GA_CLIENT_STATE_S_RUNNING = AVAHI_CLIENT_S_RUNNING;
    GA_CLIENT_STATE_S_COLLISION = AVAHI_CLIENT_S_COLLISION;
    GA_CLIENT_STATE_FAILURE = AVAHI_CLIENT_FAILURE;
    GA_CLIENT_STATE_CONNECTING = AVAHI_CLIENT_CONNECTING;
;
type
  PGaClientFlags = ^TGaClientFlags;
  TGaClientFlags =  Longint;
  Const
    GA_CLIENT_FLAG_NO_FLAGS = 0;
    GA_CLIENT_FLAG_IGNORE_USER_CONFIG = AVAHI_CLIENT_IGNORE_USER_CONFIG;
    GA_CLIENT_FLAG_NO_FAIL = AVAHI_CLIENT_NO_FAIL;
;
type
  PGaClientClass = ^TGaClientClass;
  TGaClientClass = record
      parent_class : TGObjectClass;
    end;

{ Raw avahi_client handle, only reuse if you have reffed this instance  }
  PGaClient = ^TGaClient;
  TGaClient = record
      parent : TGObject;
      avahi_client : PAvahiClient;
    end;


function ga_client_get_type:TGType;cdecl;external libavahi_gobject;
{ TYPE MACROS  }
function ga_client_new(flags:TGaClientFlags):PGaClient;cdecl;external libavahi_gobject;
function ga_client_start(client:PGaClient; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
function ga_client_start_in_context(client:PGaClient; context:PGMainContext; error:PPGError):Tgboolean;cdecl;external libavahi_gobject;
{$endif}
{ #ifndef __GA_CLIENT_H__  }

// === Konventiert am: 25-12-25 15:56:24 ===

function GA_TYPE_CLIENT : TGType;
function GA_CLIENT(obj : Pointer) : PGaClient;
function GA_CLIENT_CLASS(klass : Pointer) : PGaClientClass;
function IS_GA_CLIENT(obj : Pointer) : Tgboolean;
function IS_GA_CLIENT_CLASS(klass : Pointer) : Tgboolean;
function GA_CLIENT_GET_CLASS(obj : Pointer) : PGaClientClass;

implementation

function GA_TYPE_CLIENT : TGType;
  begin
    GA_TYPE_CLIENT:=ga_client_get_type;
  end;

function GA_CLIENT(obj : Pointer) : PGaClient;
begin
  Result := PGaClient(g_type_check_instance_cast(obj, GA_TYPE_CLIENT));
end;

function GA_CLIENT_CLASS(klass : Pointer) : PGaClientClass;
begin
  Result := PGaClientClass(g_type_check_class_cast(klass, GA_TYPE_CLIENT));
end;

function IS_GA_CLIENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GA_TYPE_CLIENT);
end;

function IS_GA_CLIENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GA_TYPE_CLIENT);
end;

function GA_CLIENT_GET_CLASS(obj : Pointer) : PGaClientClass;
begin
  Result := PGaClientClass(PGTypeInstance(obj)^.g_class);
end;



end.
