
unit elm_sys_notify;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_sys_notify.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_sys_notify.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_SYS_NOTIFY_H}
{$define ELM_SYS_NOTIFY_H}
type

  TElm_Sys_Notify_Send_Cb = procedure (data:pointer; id:dword);cdecl;
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "elm_sys_notify_interface_eo.legacy.h"}
{$include "elm_sys_notify_eo.legacy.h"}
{$endif}
{*
 * Emitted when the signal NotificationClosed is received.
 * @since 1.8
  }
  var
    ELM_EVENT_SYS_NOTIFY_NOTIFICATION_CLOSED : longint;cvar;external;
{*
 * Emitted when the signal ActionInvoked is received.
 * @since 1.8
  }
    ELM_EVENT_SYS_NOTIFY_ACTION_INVOKED : longint;cvar;external;
{*< A Action has been invoked.  }
{*
 * @def elm_sys_notify_simple_send
 *
 * Create a new notification just with Icon, Body and Summary.
 *
 * @param[in] icon
 * @param[in] summary
 * @param[in] body
 *
 * @see elm_sys_notify_send()
 *
 * @since 1.8
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function elm_sys_notify_simple_send(icon,summary,body : longint) : longint;

{*
 * Sends a notification to the notification servers that have
 * been registered by elm_need_sys_notify() or
 * elm_sys_notify_servers_set().
 *
 * @param replaces_id Notification ID that this notification replaces.
 * The value 0 means a new notification.
 * @param icon The optional program icon of the calling application.
 * @param summary The summary text briefly describing the notification.
 * @param body The optional detailed body text. Can be empty.
 * @param urgency The urgency level.
 * @param timeout Timeout display in milliseconds.
 * @param cb Callback used to retrieve the notification id
 * return by the Notification Server.
 * @param cb_data Optional context data
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_sys_notify_send(replaces_id:dword; icon:Pchar; summary:Pchar; body:Pchar; urgency:TElm_Sys_Notify_Urgency; 
            timeout:longint; cb:TElm_Sys_Notify_Send_Cb; cb_data:pointer);cdecl;external;
{*
 * Causes a notification to be forcefully closed and removed from the user's
 * view. It can be used, for example, in the event that what the notification
 * pertains to is no longer relevant, or to cancel a notification * with no
 * expiration time.
 *
 * @param id Notification id
 *
 * @note If the notification no longer exists,
 * an empty D-BUS Error message is sent back.
 *
 * @since 1.8
  }
procedure elm_sys_notify_close(id:dword);cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function elm_sys_notify_simple_send(icon,summary,body : longint) : longint;
begin
  elm_sys_notify_simple_send:=elm_sys_notify_send(0,icon,summary,body,ELM_SYS_NOTIFY_URGENCY_NORMAL,-(1),NULL,NULL);
end;


end.
