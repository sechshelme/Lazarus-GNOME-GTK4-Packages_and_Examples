
unit soup_websocket_extension;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_websocket_extension.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_websocket_extension.h
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
PGError  = ^GError;
PGHashTable  = ^GHashTable;
Pguint8  = ^guint8;
PSoupWebsocketExtension  = ^SoupWebsocketExtension;
PSoupWebsocketExtensionClass  = ^SoupWebsocketExtensionClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * soup-websocket-extension.h
 *
 * Copyright (C) 2019 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-websocket.h"}

{ was #define dname def_expr }
function SOUP_TYPE_WEBSOCKET_EXTENSION : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupWebsocketExtension, soup_websocket_extension, SOUP, WEBSOCKET_EXTENSION, GObject) }
(* Const before type ignored *)
{ <private>  }
type
  PSoupWebsocketExtensionClass = ^TSoupWebsocketExtensionClass;
  TSoupWebsocketExtensionClass = record
      parent_class : TGObjectClass;
      name : Pchar;
      configure : function (extension:PSoupWebsocketExtension; connection_type:TSoupWebsocketConnectionType; params:PGHashTable; error:PPGError):Tgboolean;cdecl;
      get_request_params : function (extension:PSoupWebsocketExtension):Pchar;cdecl;
      get_response_params : function (extension:PSoupWebsocketExtension):Pchar;cdecl;
      process_outgoing_message : function (extension:PSoupWebsocketExtension; header:Pguint8; payload:PGBytes; error:PPGError):PGBytes;cdecl;
      process_incoming_message : function (extension:PSoupWebsocketExtension; header:Pguint8; payload:PGBytes; error:PPGError):PGBytes;cdecl;
      padding : array[0..5] of Tgpointer;
    end;


function soup_websocket_extension_configure(extension:PSoupWebsocketExtension; connection_type:TSoupWebsocketConnectionType; params:PGHashTable; error:PPGError):Tgboolean;cdecl;external;
function soup_websocket_extension_get_request_params(extension:PSoupWebsocketExtension):Pchar;cdecl;external;
function soup_websocket_extension_get_response_params(extension:PSoupWebsocketExtension):Pchar;cdecl;external;
function soup_websocket_extension_process_outgoing_message(extension:PSoupWebsocketExtension; header:Pguint8; payload:PGBytes; error:PPGError):PGBytes;cdecl;external;
function soup_websocket_extension_process_incoming_message(extension:PSoupWebsocketExtension; header:Pguint8; payload:PGBytes; error:PPGError):PGBytes;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_WEBSOCKET_EXTENSION : longint; { return type might be wrong }
  begin
    SOUP_TYPE_WEBSOCKET_EXTENSION:=soup_websocket_extension_get_type;
  end;


end.
