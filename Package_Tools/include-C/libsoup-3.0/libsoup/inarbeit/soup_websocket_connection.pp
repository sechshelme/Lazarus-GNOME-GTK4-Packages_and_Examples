
unit soup_websocket_connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_websocket_connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_websocket_connection.h
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
Pchar  = ^char;
PGBytes  = ^GBytes;
PGIOStream  = ^GIOStream;
PGList  = ^GList;
PGUri  = ^GUri;
PSoupWebsocketConnection  = ^SoupWebsocketConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * soup-websocket-connection.h: This file was originally part of Cockpit.
 *
 * Copyright 2013, 2014 Red Hat, Inc.
 *
 * Cockpit is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * Cockpit is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-websocket.h"}

{ was #define dname def_expr }
function SOUP_TYPE_WEBSOCKET_CONNECTION : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupWebsocketConnection, soup_websocket_connection, SOUP, WEBSOCKET_CONNECTION, GObject) }
(* Const before type ignored *)
(* Const before type ignored *)
function soup_websocket_connection_new(stream:PGIOStream; uri:PGUri; _type:TSoupWebsocketConnectionType; origin:Pchar; protocol:Pchar; 
           extensions:PGList):PSoupWebsocketConnection;cdecl;external;
function soup_websocket_connection_get_io_stream(self:PSoupWebsocketConnection):PGIOStream;cdecl;external;
function soup_websocket_connection_get_connection_type(self:PSoupWebsocketConnection):TSoupWebsocketConnectionType;cdecl;external;
function soup_websocket_connection_get_uri(self:PSoupWebsocketConnection):PGUri;cdecl;external;
(* Const before type ignored *)
function soup_websocket_connection_get_origin(self:PSoupWebsocketConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function soup_websocket_connection_get_protocol(self:PSoupWebsocketConnection):Pchar;cdecl;external;
function soup_websocket_connection_get_extensions(self:PSoupWebsocketConnection):PGList;cdecl;external;
function soup_websocket_connection_get_state(self:PSoupWebsocketConnection):TSoupWebsocketState;cdecl;external;
function soup_websocket_connection_get_close_code(self:PSoupWebsocketConnection):Tgushort;cdecl;external;
(* Const before type ignored *)
function soup_websocket_connection_get_close_data(self:PSoupWebsocketConnection):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_websocket_connection_send_text(self:PSoupWebsocketConnection; text:Pchar);cdecl;external;
procedure soup_websocket_connection_send_binary(self:PSoupWebsocketConnection; data:Tgconstpointer; length:Tgsize);cdecl;external;
procedure soup_websocket_connection_send_message(self:PSoupWebsocketConnection; _type:TSoupWebsocketDataType; message:PGBytes);cdecl;external;
(* Const before type ignored *)
procedure soup_websocket_connection_close(self:PSoupWebsocketConnection; code:Tgushort; data:Pchar);cdecl;external;
function soup_websocket_connection_get_max_incoming_payload_size(self:PSoupWebsocketConnection):Tguint64;cdecl;external;
procedure soup_websocket_connection_set_max_incoming_payload_size(self:PSoupWebsocketConnection; max_incoming_payload_size:Tguint64);cdecl;external;
function soup_websocket_connection_get_keepalive_interval(self:PSoupWebsocketConnection):Tguint;cdecl;external;
procedure soup_websocket_connection_set_keepalive_interval(self:PSoupWebsocketConnection; interval:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_WEBSOCKET_CONNECTION : longint; { return type might be wrong }
  begin
    SOUP_TYPE_WEBSOCKET_CONNECTION:=soup_websocket_connection_get_type;
  end;


end.
