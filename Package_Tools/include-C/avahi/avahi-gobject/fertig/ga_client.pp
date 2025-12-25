
unit ga_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from ga_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ga_client.h
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
PAvahiClient  = ^AvahiClient;
PGaClient  = ^GaClient;
PGaClientClass  = ^GaClientClass;
PGaClientFlags  = ^GaClientFlags;
PGaClientState  = ^GaClientState;
PGError  = ^GError;
PGMainContext  = ^GMainContext;
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


function ga_client_get_type:TGType;cdecl;external;
{ TYPE MACROS  }
{ was #define dname def_expr }
function GA_TYPE_CLIENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_CLIENT_GET_CLASS(obj : longint) : longint;

function ga_client_new(flags:TGaClientFlags):PGaClient;cdecl;external;
function ga_client_start(client:PGaClient; error:PPGError):Tgboolean;cdecl;external;
function ga_client_start_in_context(client:PGaClient; context:PGMainContext; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ #ifndef __GA_CLIENT_H__  }

implementation

{ was #define dname def_expr }
function GA_TYPE_CLIENT : longint; { return type might be wrong }
  begin
    GA_TYPE_CLIENT:=ga_client_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_CLIENT(obj : longint) : longint;
begin
  GA_CLIENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GA_TYPE_CLIENT,GaClient);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_CLIENT_CLASS(klass : longint) : longint;
begin
  GA_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GA_TYPE_CLIENT,GaClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_CLIENT(obj : longint) : longint;
begin
  IS_GA_CLIENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GA_TYPE_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GA_CLIENT_CLASS(klass : longint) : longint;
begin
  IS_GA_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GA_TYPE_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GA_CLIENT_GET_CLASS(obj : longint) : longint;
begin
  GA_CLIENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GA_TYPE_CLIENT,GaClientClass);
end;


end.
