{$IFDEF read_interface}


type
  PElm_Sys_Notify = ^TElm_Sys_Notify;
  TElm_Sys_Notify = TEo;

type
  PElm_Sys_Notify_Server = ^TElm_Sys_Notify_Server;
  TElm_Sys_Notify_Server = longint;

const
  ELM_SYS_NOTIFY_SERVER_NONE = 0;
  ELM_SYS_NOTIFY_SERVER_DBUS = 1;

type
  PElm_Sys_Notify_Closed_Reason = ^TElm_Sys_Notify_Closed_Reason;
  TElm_Sys_Notify_Closed_Reason = longint;

const
  ELM_SYS_NOTIFY_CLOSED_EXPIRED = 0;
  ELM_SYS_NOTIFY_CLOSED_DISMISSED = 1;
  ELM_SYS_NOTIFY_CLOSED_REQUESTED = 2;
  ELM_SYS_NOTIFY_CLOSED_UNDEFINED = 3;

type
  TElm_Sys_Notify_Notification_Closed = record
    id: dword;
    reason: TElm_Sys_Notify_Closed_Reason;
  end;
  PElm_Sys_Notify_Notification_Closed = ^TElm_Sys_Notify_Notification_Closed;

  TElm_Sys_Notify_Action_Invoked = record
    id: dword;
    action_key: pchar;
  end;
  PElm_Sys_Notify_Action_Invoked = ^TElm_Sys_Notify_Action_Invoked;

function elm_sys_notify_servers_set(obj: PElm_Sys_Notify; servers: TElm_Sys_Notify_Server): TEina_Bool; cdecl; external libelementary;
function elm_sys_notify_servers_get(obj: PElm_Sys_Notify): TElm_Sys_Notify_Server; cdecl; external libelementary;
function elm_sys_notify_singleton_get: PElm_Sys_Notify; cdecl; external libelementary;

// === Konventiert am: 30-5-25 17:16:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
