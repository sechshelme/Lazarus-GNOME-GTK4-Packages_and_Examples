unit fp_notify;

interface

uses fp_glib2, fp_gdk_pixbuf2;

const
  {$IFDEF Linux}
  libnotify = 'notify';
  {$ENDIF}

  {$IFDEF Windows}
  libnotify = 'libnotify-4.dll';   

  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ==== /usr/include/libnotify/notify.h

function notify_init(app_name: pchar): Tgboolean; cdecl; external libnotify;
procedure notify_uninit; cdecl; external libnotify;
function notify_is_initted: Tgboolean; cdecl; external libnotify;
function notify_get_app_name: pchar; cdecl; external libnotify;
procedure notify_set_app_name(app_name: pchar); cdecl; external libnotify;
function notify_get_server_caps: PGList; cdecl; external libnotify;
function notify_get_server_info(ret_name: PPchar; ret_vendor: PPchar; ret_version: PPchar; ret_spec_version: PPchar): Tgboolean; cdecl; external libnotify;


// ====  /usr/include/libnotify/notification.h

const
  NOTIFY_EXPIRES_DEFAULT = -(1);
  NOTIFY_EXPIRES_NEVER = 0;

type
  PNotifyNotificationPrivate = type Pointer;

  TNotifyNotification = record
    parent_object: TGObject;
    priv: PNotifyNotificationPrivate;
  end;
  PNotifyNotification = ^TNotifyNotification;

  TNotifyNotificationClass = record
    parent_class: TGObjectClass;
    closed: procedure(notification: PNotifyNotification); cdecl;
  end;
  PNotifyNotificationClass = ^TNotifyNotificationClass;

type
  PNotifyUrgency = ^TNotifyUrgency;
  TNotifyUrgency = longint;

const
  NOTIFY_URGENCY_LOW = 0;
  NOTIFY_URGENCY_NORMAL = 1;
  NOTIFY_URGENCY_CRITICAL = 2;

type
  PNotifyClosedReason = ^TNotifyClosedReason;
  TNotifyClosedReason = longint;

const
  NOTIFY_CLOSED_REASON_UNSET = -(1);
  NOTIFY_CLOSED_REASON_EXPIRED = 1;
  NOTIFY_CLOSED_REASON_DISMISSED = 2;
  NOTIFY_CLOSED_REASON_API_REQUEST = 3;
  NOTIFY_CLOSED_REASON_UNDEFIEND = 4;

type
  TNotifyActionCallback = procedure(notification: PNotifyNotification; action: pchar; user_data: Tgpointer); cdecl;

function notify_notification_get_type: TGType; cdecl; external libnotify;
function notify_notification_new(summary: pchar; body: pchar; icon: pchar): PNotifyNotification; cdecl; external libnotify;
function notify_notification_update(notification: PNotifyNotification; summary: pchar; body: pchar; icon: pchar): Tgboolean; cdecl; external libnotify;
function notify_notification_show(notification: PNotifyNotification; error: PPGError): Tgboolean; cdecl; external libnotify;
procedure notify_notification_set_timeout(notification: PNotifyNotification; timeout: Tgint); cdecl; external libnotify;
procedure notify_notification_set_category(notification: PNotifyNotification; category: pchar); cdecl; external libnotify;
procedure notify_notification_set_urgency(notification: PNotifyNotification; urgency: TNotifyUrgency); cdecl; external libnotify;
procedure notify_notification_set_image_from_pixbuf(notification: PNotifyNotification; pixbuf: PGdkPixbuf); cdecl; external libnotify;

procedure notify_notification_set_icon_from_pixbuf(notification: PNotifyNotification; icon: PGdkPixbuf); cdecl; external libnotify;
procedure notify_notification_set_hint_int32(notification: PNotifyNotification; key: pchar; value: Tgint); cdecl; external libnotify;
procedure notify_notification_set_hint_uint32(notification: PNotifyNotification; key: pchar; value: Tguint); cdecl; external libnotify;
procedure notify_notification_set_hint_double(notification: PNotifyNotification; key: pchar; value: Tgdouble); cdecl; external libnotify;
procedure notify_notification_set_hint_string(notification: PNotifyNotification; key: pchar; value: pchar); cdecl; external libnotify;
procedure notify_notification_set_hint_byte(notification: PNotifyNotification; key: pchar; value: Tguchar); cdecl; external libnotify;
procedure notify_notification_set_hint_byte_array(notification: PNotifyNotification; key: pchar; value: Pguchar; len: Tgsize); cdecl; external libnotify;

procedure notify_notification_set_hint(notification: PNotifyNotification; key: pchar; value: PGVariant); cdecl; external libnotify;
procedure notify_notification_set_app_name(notification: PNotifyNotification; app_name: pchar); cdecl; external libnotify;
procedure notify_notification_clear_hints(notification: PNotifyNotification); cdecl; external libnotify;
procedure notify_notification_add_action(notification: PNotifyNotification; action: pchar; _label: pchar; callback: TNotifyActionCallback; user_data: Tgpointer; free_func: TGFreeFunc); cdecl; external libnotify;
function notify_notification_get_activation_token(notification: PNotifyNotification): pchar; cdecl; external libnotify;
procedure notify_notification_clear_actions(notification: PNotifyNotification); cdecl; external libnotify;
function notify_notification_close(notification: PNotifyNotification; error: PPGError): Tgboolean; cdecl; external libnotify;
function notify_notification_get_closed_reason(notification: PNotifyNotification): Tgint; cdecl; external libnotify;

function NOTIFY_ACTION_CALLBACK(func: Pointer): TNotifyActionCallback;

function NOTIFY_TYPE_NOTIFICATION: TGType;
function NOTIFY_NOTIFICATION(obj: Pointer): PNotifyNotification;
function NOTIFY_NOTIFICATION_CLASS(klass: Pointer): PNotifyNotificationClass;
function NOTIFY_IS_NOTIFICATION(obj: Pointer): Tgboolean;
function NOTIFY_IS_NOTIFICATION_CLASS(klass: Pointer): Tgboolean;
function NOTIFY_NOTIFICATION_GET_CLASS(obj: Pointer): PNotifyNotificationClass;


// ====  /usr/include/libnotify/notify-enum-types.h

function notify_urgency_get_type: TGType; cdecl; external libnotify;
function NOTIFY_TYPE_URGENCY: TGType;

function notify_closed_reason_get_type: TGType; cdecl; external libnotify;
function NOTIFY_TYPE_CLOSED_REASON: TGType;


// ====  /usr/include/libnotify/notify-features.h

const
  NOTIFY_VERSION_MAJOR = 0;
  NOTIFY_VERSION_MINOR = 8;
  NOTIFY_VERSION_MICRO = 3;

function NOTIFY_CHECK_VERSION(major, minor, micro: integer): boolean;


// === Konventiert am: 11-1-26 14:02:59 ===


implementation

function NOTIFY_TYPE_NOTIFICATION: TGType;
begin
  NOTIFY_TYPE_NOTIFICATION := notify_notification_get_type;
end;

function NOTIFY_NOTIFICATION(obj: Pointer): PNotifyNotification;
begin
  Result := PNotifyNotification(g_type_check_instance_cast(obj, NOTIFY_TYPE_NOTIFICATION));
end;

function NOTIFY_NOTIFICATION_CLASS(klass: Pointer): PNotifyNotificationClass;
begin
  Result := PNotifyNotificationClass(g_type_check_class_cast(klass, NOTIFY_TYPE_NOTIFICATION));
end;

function NOTIFY_IS_NOTIFICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NOTIFY_TYPE_NOTIFICATION);
end;

function NOTIFY_IS_NOTIFICATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NOTIFY_TYPE_NOTIFICATION);
end;

function NOTIFY_NOTIFICATION_GET_CLASS(obj: Pointer): PNotifyNotificationClass;
begin
  Result := PNotifyNotificationClass(PGTypeInstance(obj)^.g_class);
end;


function NOTIFY_ACTION_CALLBACK(func: Pointer): TNotifyActionCallback;
begin
  NOTIFY_ACTION_CALLBACK := TNotifyActionCallback(func);
end;

// ====

function NOTIFY_TYPE_URGENCY: TGType;
begin
  NOTIFY_TYPE_URGENCY := notify_urgency_get_type;
end;

function NOTIFY_TYPE_CLOSED_REASON: TGType;
begin
  NOTIFY_TYPE_CLOSED_REASON := notify_closed_reason_get_type;
end;

// ====

function NOTIFY_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (NOTIFY_VERSION_MAJOR > major) or
    ((NOTIFY_VERSION_MAJOR = major) and (NOTIFY_VERSION_MINOR > minor)) or
    ((NOTIFY_VERSION_MAJOR = major) and (NOTIFY_VERSION_MINOR = minor) and
    (NOTIFY_VERSION_MICRO >= micro));
end;


end.
