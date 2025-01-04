unit WebKitNotification;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitNotification, webkit_notification, WEBKIT, NOTIFICATION, GObject) }
type
  TWebKitNotification = record
  end;
  PWebKitNotification = ^TWebKitNotification;

  TWebKitNotificationClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitNotificationClass = ^TWebKitNotificationClass;

function webkit_notification_get_type: TGType; cdecl; external libwebkit;
function webkit_notification_get_id(notification: PWebKitNotification): Tguint64; cdecl; external libwebkit;
function webkit_notification_get_title(notification: PWebKitNotification): Pgchar; cdecl; external libwebkit;
function webkit_notification_get_body(notification: PWebKitNotification): Pgchar; cdecl; external libwebkit;
function webkit_notification_get_tag(notification: PWebKitNotification): Pgchar; cdecl; external libwebkit;
procedure webkit_notification_close(notification: PWebKitNotification); cdecl; external libwebkit;
procedure webkit_notification_clicked(notification: PWebKitNotification); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:57:59 ===

function WEBKIT_TYPE_NOTIFICATION: TGType;
function WEBKIT_NOTIFICATION(obj: Pointer): PWebKitNotification;
function WEBKIT_IS_NOTIFICATION(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_NOTIFICATION: TGType;
begin
  Result := webkit_notification_get_type;
end;

function WEBKIT_NOTIFICATION(obj: Pointer): PWebKitNotification;
begin
  Result := PWebKitNotification(g_type_check_instance_cast(obj, WEBKIT_TYPE_NOTIFICATION));
end;

function WEBKIT_IS_NOTIFICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_NOTIFICATION);
end;




end.
