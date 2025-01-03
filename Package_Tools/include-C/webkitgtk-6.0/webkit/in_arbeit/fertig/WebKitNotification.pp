
unit WebKitNotification;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitNotification.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitNotification.h
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
PWebKitNotification  = ^WebKitNotification;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Collabora Ltd.
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
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitNotification_h}
{$define WebKitNotification_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_NOTIFICATION : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitNotification, webkit_notification, WEBKIT, NOTIFICATION, GObject) }
function webkit_notification_get_id(notification:PWebKitNotification):Tguint64;cdecl;external;
(* Const before type ignored *)
function webkit_notification_get_title(notification:PWebKitNotification):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_notification_get_body(notification:PWebKitNotification):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_notification_get_tag(notification:PWebKitNotification):Pgchar;cdecl;external;
procedure webkit_notification_close(notification:PWebKitNotification);cdecl;external;
procedure webkit_notification_clicked(notification:PWebKitNotification);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_NOTIFICATION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_NOTIFICATION:=webkit_notification_get_type;
  end;


end.
