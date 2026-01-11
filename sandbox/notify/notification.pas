unit notification;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2006 Christian Hammond
 * Copyright (C) 2006 John Palmieri
 * Copyright (C) 2010 Red Hat, Inc.
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA  02111-1307, USA.
  }
{$ifndef _NOTIFY_NOTIFICATION_H_}
{$define _NOTIFY_NOTIFICATION_H_}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gdk-pixbuf/gdk-pixbuf.h>}
{*
 * NOTIFY_EXPIRES_DEFAULT:
 *
 * The default expiration time on a notification.
  }

const
  NOTIFY_EXPIRES_DEFAULT = -(1);  
{*
 * NOTIFY_EXPIRES_NEVER:
 *
 * The notification never expires.
 *
 * It stays open until closed by the calling API or the user.
  }
  NOTIFY_EXPIRES_NEVER = 0;  

type
{*
 * NotifyNotification:
 *
 * A passive pop-up notification.
 *
 * #NotifyNotification represents a passive pop-up notification. It can
 * contain summary text, body text, and an icon, as well as hints specifying
 * how the notification should be presented. The notification is rendered
 * by a notification daemon, and may present the notification in any number
 * of ways. As such, there is a clear separation of content and presentation,
 * and this API enforces that.
  }
{< private > }
  PNotifyNotification = ^TNotifyNotification;
  TNotifyNotification = record
      parent_object : TGObject;
      priv : PNotifyNotificationPrivate;
    end;

{ Signals  }
  PNotifyNotificationClass = ^TNotifyNotificationClass;
  TNotifyNotificationClass = record
      parent_class : TGObjectClass;
      closed : procedure (notification:PNotifyNotification);cdecl;
    end;

{*
 * NotifyUrgency:
 * @NOTIFY_URGENCY_LOW: Low urgency. Used for unimportant notifications.
 * @NOTIFY_URGENCY_NORMAL: Normal urgency. Used for most standard notifications.
 * @NOTIFY_URGENCY_CRITICAL: Critical urgency. Used for very important notifications.
 *
 * The urgency level of the notification.
  }

  PNotifyUrgency = ^TNotifyUrgency;
  TNotifyUrgency =  Longint;
  Const
    NOTIFY_URGENCY_LOW = 0;
    NOTIFY_URGENCY_NORMAL = 1;
    NOTIFY_URGENCY_CRITICAL = 2;
;
{*
 * NotifyClosedReason:
 * @NOTIFY_CLOSED_REASON_UNSET: Notification not closed.
 * @NOTIFY_CLOSED_REASON_EXPIRED: Timeout has expired.
 * @NOTIFY_CLOSED_REASON_DISMISSED: It has been dismissed by the user.
 * @NOTIFY_CLOSED_REASON_API_REQUEST: It has been closed by a call to
 *   [method@NotifyNotification.close].
 * @NOTIFY_CLOSED_REASON_UNDEFIEND: Closed by undefined/reserved reasons.
 *
 * The reason for which the notification has been closed.
 *
 * Since: 0.8.0
  }
type
  PNotifyClosedReason = ^TNotifyClosedReason;
  TNotifyClosedReason =  Longint;
  Const
    NOTIFY_CLOSED_REASON_UNSET = -(1);
    NOTIFY_CLOSED_REASON_EXPIRED = 1;
    NOTIFY_CLOSED_REASON_DISMISSED = 2;
    NOTIFY_CLOSED_REASON_API_REQUEST = 3;
    NOTIFY_CLOSED_REASON_UNDEFIEND = 4;
;
{*
 * NotifyActionCallback:
 * @notification: a #NotifyActionCallback notification
 * @action: (transfer none): The activated action name
 * @user_data: (nullable) (transfer none): User provided data
 *
 * An action callback function.
  }
type

  TNotifyActionCallback = procedure (notification:PNotifyNotification; action:Pchar; user_data:Tgpointer);cdecl;
{*
 * NOTIFY_ACTION_CALLBACK:
 * @func: The function to cast.
 *
 * A convenience macro for casting a function to a [callback@ActionCallback].
 *
 * This is much like [func@GObject.CALLBACK].
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function NOTIFY_ACTION_CALLBACK(func : longint) : TNotifyActionCallback;

function notify_notification_get_type:TGType;cdecl;external libnotify;
function notify_notification_new(summary:Pchar; body:Pchar; icon:Pchar):PNotifyNotification;cdecl;external libnotify;
function notify_notification_update(notification:PNotifyNotification; summary:Pchar; body:Pchar; icon:Pchar):Tgboolean;cdecl;external libnotify;
function notify_notification_show(notification:PNotifyNotification; error:PPGError):Tgboolean;cdecl;external libnotify;
procedure notify_notification_set_timeout(notification:PNotifyNotification; timeout:Tgint);cdecl;external libnotify;
procedure notify_notification_set_category(notification:PNotifyNotification; category:Pchar);cdecl;external libnotify;
procedure notify_notification_set_urgency(notification:PNotifyNotification; urgency:TNotifyUrgency);cdecl;external libnotify;
procedure notify_notification_set_image_from_pixbuf(notification:PNotifyNotification; pixbuf:PGdkPixbuf);cdecl;external libnotify;
{$ifndef LIBNOTIFY_DISABLE_DEPRECATED}

procedure notify_notification_set_icon_from_pixbuf(notification:PNotifyNotification; icon:PGdkPixbuf);cdecl;external libnotify;
procedure notify_notification_set_hint_int32(notification:PNotifyNotification; key:Pchar; value:Tgint);cdecl;external libnotify;
procedure notify_notification_set_hint_uint32(notification:PNotifyNotification; key:Pchar; value:Tguint);cdecl;external libnotify;
procedure notify_notification_set_hint_double(notification:PNotifyNotification; key:Pchar; value:Tgdouble);cdecl;external libnotify;
procedure notify_notification_set_hint_string(notification:PNotifyNotification; key:Pchar; value:Pchar);cdecl;external libnotify;
procedure notify_notification_set_hint_byte(notification:PNotifyNotification; key:Pchar; value:Tguchar);cdecl;external libnotify;
procedure notify_notification_set_hint_byte_array(notification:PNotifyNotification; key:Pchar; value:Pguchar; len:Tgsize);cdecl;external libnotify;
{$endif}

procedure notify_notification_set_hint(notification:PNotifyNotification; key:Pchar; value:PGVariant);cdecl;external libnotify;
procedure notify_notification_set_app_name(notification:PNotifyNotification; app_name:Pchar);cdecl;external libnotify;
procedure notify_notification_clear_hints(notification:PNotifyNotification);cdecl;external libnotify;
procedure notify_notification_add_action(notification:PNotifyNotification; action:Pchar; _label:Pchar; callback:TNotifyActionCallback; user_data:Tgpointer; 
            free_func:TGFreeFunc);cdecl;external libnotify;
function notify_notification_get_activation_token(notification:PNotifyNotification):Pchar;cdecl;external libnotify;
procedure notify_notification_clear_actions(notification:PNotifyNotification);cdecl;external libnotify;
function notify_notification_close(notification:PNotifyNotification; error:PPGError):Tgboolean;cdecl;external libnotify;
function notify_notification_get_closed_reason(notification:PNotifyNotification):Tgint;cdecl;external libnotify;

// === Konventiert am: 11-1-26 14:03:37 ===

function NOTIFY_TYPE_NOTIFICATION : TGType;
function NOTIFY_NOTIFICATION(obj : Pointer) : PNotifyNotification;
function NOTIFY_NOTIFICATION_CLASS(klass : Pointer) : PNotifyNotificationClass;
function NOTIFY_IS_NOTIFICATION(obj : Pointer) : Tgboolean;
function NOTIFY_IS_NOTIFICATION_CLASS(klass : Pointer) : Tgboolean;
function NOTIFY_NOTIFICATION_GET_CLASS(obj : Pointer) : PNotifyNotificationClass;

implementation

function NOTIFY_TYPE_NOTIFICATION : TGType;
  begin
    NOTIFY_TYPE_NOTIFICATION:=notify_notification_get_type;
  end;

function NOTIFY_NOTIFICATION(obj : Pointer) : PNotifyNotification;
begin
  Result := PNotifyNotification(g_type_check_instance_cast(obj, NOTIFY_TYPE_NOTIFICATION));
end;

function NOTIFY_NOTIFICATION_CLASS(klass : Pointer) : PNotifyNotificationClass;
begin
  Result := PNotifyNotificationClass(g_type_check_class_cast(klass, NOTIFY_TYPE_NOTIFICATION));
end;

function NOTIFY_IS_NOTIFICATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NOTIFY_TYPE_NOTIFICATION);
end;

function NOTIFY_IS_NOTIFICATION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NOTIFY_TYPE_NOTIFICATION);
end;

function NOTIFY_NOTIFICATION_GET_CLASS(obj : Pointer) : PNotifyNotificationClass;
begin
  Result := PNotifyNotificationClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function NOTIFY_ACTION_CALLBACK(func : longint) : TNotifyActionCallback;
begin
  NOTIFY_ACTION_CALLBACK:=TNotifyActionCallback(func);
end;


end.
