
unit WebKitConsoleMessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitConsoleMessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitConsoleMessage.h
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
Pgchar  = ^gchar;
PWebKitConsoleMessage  = ^WebKitConsoleMessage;
PWebKitConsoleMessageLevel  = ^WebKitConsoleMessageLevel;
PWebKitConsoleMessageSource  = ^WebKitConsoleMessageSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015 Igalia S.L.
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
{$if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit-web-process-extension.h> can be included directly."}
{$endif}
{$ifndef WebKitConsoleMessage_h}
{$define WebKitConsoleMessage_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_CONSOLE_MESSAGE : longint; { return type might be wrong }

{*
 * WebKitConsoleMessageSource:
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_JAVASCRIPT: Message produced by JavaScript.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_NETWORK: Network messages.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_CONSOLE_API: Messages produced by console API.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_SECURITY: Security messages.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_OTHER: Other messages.
 *
 * Enum values used to denote the various sources of console messages.
 *
 * Since: 2.12
  }
type
  PWebKitConsoleMessageSource = ^TWebKitConsoleMessageSource;
  TWebKitConsoleMessageSource =  Longint;
  Const
    WEBKIT_CONSOLE_MESSAGE_SOURCE_JAVASCRIPT = 0;
    WEBKIT_CONSOLE_MESSAGE_SOURCE_NETWORK = 1;
    WEBKIT_CONSOLE_MESSAGE_SOURCE_CONSOLE_API = 2;
    WEBKIT_CONSOLE_MESSAGE_SOURCE_SECURITY = 3;
    WEBKIT_CONSOLE_MESSAGE_SOURCE_OTHER = 4;
;
{*
 * WebKitConsoleMessageLevel:
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_INFO: Information message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_LOG: Log message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_WARNING: Warning message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_ERROR: Error message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_DEBUG: Debug message.
 *
 * Enum values used to denote the various levels of console messages.
 *
 * Since: 2.12
  }
type
  PWebKitConsoleMessageLevel = ^TWebKitConsoleMessageLevel;
  TWebKitConsoleMessageLevel =  Longint;
  Const
    WEBKIT_CONSOLE_MESSAGE_LEVEL_INFO = 0;
    WEBKIT_CONSOLE_MESSAGE_LEVEL_LOG = 1;
    WEBKIT_CONSOLE_MESSAGE_LEVEL_WARNING = 2;
    WEBKIT_CONSOLE_MESSAGE_LEVEL_ERROR = 3;
    WEBKIT_CONSOLE_MESSAGE_LEVEL_DEBUG = 4;
;
type

function webkit_console_message_get_type:TGType;cdecl;external;
function webkit_console_message_copy(console_message:PWebKitConsoleMessage):PWebKitConsoleMessage;cdecl;external;
procedure webkit_console_message_free(console_message:PWebKitConsoleMessage);cdecl;external;
function webkit_console_message_get_source(console_message:PWebKitConsoleMessage):TWebKitConsoleMessageSource;cdecl;external;
function webkit_console_message_get_level(console_message:PWebKitConsoleMessage):TWebKitConsoleMessageLevel;cdecl;external;
(* Const before type ignored *)
function webkit_console_message_get_text(console_message:PWebKitConsoleMessage):Pgchar;cdecl;external;
function webkit_console_message_get_line(console_message:PWebKitConsoleMessage):Tguint;cdecl;external;
(* Const before type ignored *)
function webkit_console_message_get_source_id(console_message:PWebKitConsoleMessage):Pgchar;cdecl;external;
{$endif}
{ WebKitConsoleMessage_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_CONSOLE_MESSAGE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_CONSOLE_MESSAGE:=webkit_console_message_get_type;
  end;


end.
