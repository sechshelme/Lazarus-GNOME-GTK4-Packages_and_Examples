
unit gnotification;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnotification.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnotification.h
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
PGIcon  = ^GIcon;
PGNotification  = ^GNotification;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2013 Lars Uebernickel
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
 * Authors: Lars Uebernickel <lars@uebernic.de>
  }
{$ifndef __G_NOTIFICATION_H__}
{$define __G_NOTIFICATION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{$include <gio/gioenums.h>}

{ was #define dname def_expr }
function G_TYPE_NOTIFICATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NOTIFICATION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NOTIFICATION(o : longint) : longint;

function g_notification_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_notification_new(title:Pgchar):PGNotification;cdecl;external;
(* Const before type ignored *)
procedure g_notification_set_title(notification:PGNotification; title:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_notification_set_body(notification:PGNotification; body:Pgchar);cdecl;external;
procedure g_notification_set_icon(notification:PGNotification; icon:PGIcon);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_42_FOR(g_notification_set_priority) }
procedure g_notification_set_urgent(notification:PGNotification; urgent:Tgboolean);cdecl;external;
procedure g_notification_set_priority(notification:PGNotification; priority:TGNotificationPriority);cdecl;external;
(* Const before type ignored *)
procedure g_notification_set_category(notification:PGNotification; category:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_notification_add_button(notification:PGNotification; _label:Pgchar; detailed_action:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_notification_add_button_with_target(notification:PGNotification; _label:Pgchar; action:Pgchar; target_format:Pgchar; args:array of const);cdecl;external;
procedure g_notification_add_button_with_target(notification:PGNotification; _label:Pgchar; action:Pgchar; target_format:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_notification_add_button_with_target_value(notification:PGNotification; _label:Pgchar; action:Pgchar; target:PGVariant);cdecl;external;
(* Const before type ignored *)
procedure g_notification_set_default_action(notification:PGNotification; detailed_action:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_notification_set_default_action_and_target(notification:PGNotification; action:Pgchar; target_format:Pgchar; args:array of const);cdecl;external;
procedure g_notification_set_default_action_and_target(notification:PGNotification; action:Pgchar; target_format:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_notification_set_default_action_and_target_value(notification:PGNotification; action:Pgchar; target:PGVariant);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function G_TYPE_NOTIFICATION : longint; { return type might be wrong }
  begin
    G_TYPE_NOTIFICATION:=g_notification_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NOTIFICATION(o : longint) : longint;
begin
  G_NOTIFICATION:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_NOTIFICATION,GNotification);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_NOTIFICATION(o : longint) : longint;
begin
  G_IS_NOTIFICATION:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_NOTIFICATION);
end;


end.
