
unit WebKitUserMessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitUserMessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitUserMessage.h
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
PGUnixFDList  = ^GUnixFDList;
PGVariant  = ^GVariant;
PWebKitUserMessage  = ^WebKitUserMessage;
PWebKitUserMessageError  = ^WebKitUserMessageError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitUserMessage_h}
{$define WebKitUserMessage_h}
{$include <gio/gio.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_MESSAGE : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitUserMessage, webkit_user_message, WEBKIT, USER_MESSAGE, GInitiallyUnowned) }
{ was #define dname def_expr }
function WEBKIT_USER_MESSAGE_ERROR : longint; { return type might be wrong }

{*
 * WebKitUserMessageError:
 * @WEBKIT_USER_MESSAGE_UNHANDLED_MESSAGE: The message was not handled by the receiver.
 *
 * Enum values used to denote errors happening when sending user messages.
 *
 * Since: 2.28
  }
type
  PWebKitUserMessageError = ^TWebKitUserMessageError;
  TWebKitUserMessageError =  Longint;
  Const
    WEBKIT_USER_MESSAGE_UNHANDLED_MESSAGE = 0;
;

function webkit_user_message_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function webkit_user_message_new(name:Pchar; parameters:PGVariant):PWebKitUserMessage;cdecl;external;
(* Const before type ignored *)
function webkit_user_message_new_with_fd_list(name:Pchar; parameters:PGVariant; fd_list:PGUnixFDList):PWebKitUserMessage;cdecl;external;
(* Const before type ignored *)
function webkit_user_message_get_name(message:PWebKitUserMessage):Pchar;cdecl;external;
function webkit_user_message_get_parameters(message:PWebKitUserMessage):PGVariant;cdecl;external;
function webkit_user_message_get_fd_list(message:PWebKitUserMessage):PGUnixFDList;cdecl;external;
procedure webkit_user_message_send_reply(message:PWebKitUserMessage; reply:PWebKitUserMessage);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_MESSAGE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_USER_MESSAGE:=webkit_user_message_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_USER_MESSAGE_ERROR : longint; { return type might be wrong }
  begin
    WEBKIT_USER_MESSAGE_ERROR:=webkit_user_message_error_quark;
  end;


end.
