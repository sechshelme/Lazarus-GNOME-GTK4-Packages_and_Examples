unit gnotification;

interface

uses
  fp_glib2;

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

function g_notification_get_type:TGType;cdecl;external libgio2;
function g_notification_new(title:Pgchar):PGNotification;cdecl;external libgio2;
procedure g_notification_set_title(notification:PGNotification; title:Pgchar);cdecl;external libgio2;
procedure g_notification_set_body(notification:PGNotification; body:Pgchar);cdecl;external libgio2;
procedure g_notification_set_icon(notification:PGNotification; icon:PGIcon);cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_42_FOR(g_notification_set_priority) }
procedure g_notification_set_urgent(notification:PGNotification; urgent:Tgboolean);cdecl;external libgio2;
procedure g_notification_set_priority(notification:PGNotification; priority:TGNotificationPriority);cdecl;external libgio2;
procedure g_notification_set_category(notification:PGNotification; category:Pgchar);cdecl;external libgio2;
procedure g_notification_add_button(notification:PGNotification; _label:Pgchar; detailed_action:Pgchar);cdecl;external libgio2;
procedure g_notification_add_button_with_target(notification:PGNotification; _label:Pgchar; action:Pgchar; target_format:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_notification_add_button_with_target(notification:PGNotification; _label:Pgchar; action:Pgchar; target_format:Pgchar);cdecl;external libgio2;
procedure g_notification_add_button_with_target_value(notification:PGNotification; _label:Pgchar; action:Pgchar; target:PGVariant);cdecl;external libgio2;
procedure g_notification_set_default_action(notification:PGNotification; detailed_action:Pgchar);cdecl;external libgio2;
procedure g_notification_set_default_action_and_target(notification:PGNotification; action:Pgchar; target_format:Pgchar; args:array of const);cdecl;external libgio2;
procedure g_notification_set_default_action_and_target(notification:PGNotification; action:Pgchar; target_format:Pgchar);cdecl;external libgio2;
procedure g_notification_set_default_action_and_target_value(notification:PGNotification; action:Pgchar; target:PGVariant);cdecl;external libgio2;
{$endif}

// === Konventiert am: 26-6-26 19:43:19 ===

function G_TYPE_NOTIFICATION : TGType;
function G_NOTIFICATION(obj : Pointer) : PGNotification;
function G_IS_NOTIFICATION(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_NOTIFICATION : TGType;
  begin
    G_TYPE_NOTIFICATION:=g_notification_get_type;
  end;

function G_NOTIFICATION(obj : Pointer) : PGNotification;
begin
  Result := PGNotification(g_type_check_instance_cast(obj, G_TYPE_NOTIFICATION));
end;

function G_IS_NOTIFICATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_NOTIFICATION);
end;



end.
