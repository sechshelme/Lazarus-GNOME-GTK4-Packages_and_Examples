
unit soup_websocket;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_websocket.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_websocket.h
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
PGError  = ^GError;
PGList  = ^GList;
PGPtrArray  = ^GPtrArray;
PSoupMessage  = ^SoupMessage;
PSoupServerMessage  = ^SoupServerMessage;
PSoupWebsocketCloseCode  = ^SoupWebsocketCloseCode;
PSoupWebsocketConnectionType  = ^SoupWebsocketConnectionType;
PSoupWebsocketDataType  = ^SoupWebsocketDataType;
PSoupWebsocketError  = ^SoupWebsocketError;
PSoupWebsocketState  = ^SoupWebsocketState;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * soup-websocket.h: This file was originally part of Cockpit.
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
{*
 * soup_websocket_error_quark:
 * Registers error quark for SoupWebsocket if needed.
 *
 * Returns: Error quark for SoupWebsocket.
  }

{ was #define dname def_expr }
function SOUP_WEBSOCKET_ERROR : longint; { return type might be wrong }

function soup_websocket_error_quark:TGQuark;cdecl;external;
type
  PSoupWebsocketError = ^TSoupWebsocketError;
  TSoupWebsocketError =  Longint;
  Const
    SOUP_WEBSOCKET_ERROR_FAILED = 0;
    SOUP_WEBSOCKET_ERROR_NOT_WEBSOCKET = 1;
    SOUP_WEBSOCKET_ERROR_BAD_HANDSHAKE = 2;
    SOUP_WEBSOCKET_ERROR_BAD_ORIGIN = 3;
;
type
  PSoupWebsocketConnectionType = ^TSoupWebsocketConnectionType;
  TSoupWebsocketConnectionType =  Longint;
  Const
    SOUP_WEBSOCKET_CONNECTION_UNKNOWN = 0;
    SOUP_WEBSOCKET_CONNECTION_CLIENT = 1;
    SOUP_WEBSOCKET_CONNECTION_SERVER = 2;
;
type
  PSoupWebsocketDataType = ^TSoupWebsocketDataType;
  TSoupWebsocketDataType =  Longint;
  Const
    SOUP_WEBSOCKET_DATA_TEXT = $01;
    SOUP_WEBSOCKET_DATA_BINARY = $02;
;
type
  PSoupWebsocketCloseCode = ^TSoupWebsocketCloseCode;
  TSoupWebsocketCloseCode =  Longint;
  Const
    SOUP_WEBSOCKET_CLOSE_NORMAL = 1000;
    SOUP_WEBSOCKET_CLOSE_GOING_AWAY = 1001;
    SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR = 1002;
    SOUP_WEBSOCKET_CLOSE_UNSUPPORTED_DATA = 1003;
    SOUP_WEBSOCKET_CLOSE_NO_STATUS = 1005;
    SOUP_WEBSOCKET_CLOSE_ABNORMAL = 1006;
    SOUP_WEBSOCKET_CLOSE_BAD_DATA = 1007;
    SOUP_WEBSOCKET_CLOSE_POLICY_VIOLATION = 1008;
    SOUP_WEBSOCKET_CLOSE_TOO_BIG = 1009;
    SOUP_WEBSOCKET_CLOSE_NO_EXTENSION = 1010;
    SOUP_WEBSOCKET_CLOSE_SERVER_ERROR = 1011;
    SOUP_WEBSOCKET_CLOSE_TLS_HANDSHAKE = 1015;
;
type
  PSoupWebsocketState = ^TSoupWebsocketState;
  TSoupWebsocketState =  Longint;
  Const
    SOUP_WEBSOCKET_STATE_OPEN = 1;
    SOUP_WEBSOCKET_STATE_CLOSING = 2;
    SOUP_WEBSOCKET_STATE_CLOSED = 3;
;
(* Const before type ignored *)

procedure soup_websocket_client_prepare_handshake(msg:PSoupMessage; origin:Pchar; protocols:PPchar; supported_extensions:PGPtrArray);cdecl;external;
function soup_websocket_client_verify_handshake(msg:PSoupMessage; supported_extensions:PGPtrArray; accepted_extensions:PPGList; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_websocket_server_check_handshake(msg:PSoupServerMessage; origin:Pchar; protocols:PPchar; supported_extensions:PGPtrArray; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_websocket_server_process_handshake(msg:PSoupServerMessage; expected_origin:Pchar; protocols:PPchar; supported_extensions:PGPtrArray; accepted_extensions:PPGList):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_WEBSOCKET_ERROR : longint; { return type might be wrong }
  begin
    SOUP_WEBSOCKET_ERROR:=soup_websocket_error_quark;
  end;


end.
