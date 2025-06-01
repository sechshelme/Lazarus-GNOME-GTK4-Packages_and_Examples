
unit elm_sys_notify_interface_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_sys_notify_interface_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_sys_notify_interface_eo_legacy.h
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
PElm_Sys_Notify_Interface  = ^Elm_Sys_Notify_Interface;
PElm_Sys_Notify_Urgency  = ^Elm_Sys_Notify_Urgency;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SYS_NOTIFY_INTERFACE_EO_LEGACY_H_}
{$define _ELM_SYS_NOTIFY_INTERFACE_EO_LEGACY_H_}
{$ifndef _ELM_SYS_NOTIFY_INTERFACE_EO_CLASS_TYPE}
{$define _ELM_SYS_NOTIFY_INTERFACE_EO_CLASS_TYPE}
type
  PElm_Sys_Notify_Interface = ^TElm_Sys_Notify_Interface;
  TElm_Sys_Notify_Interface = TEo;
{$endif}
{$ifndef _ELM_SYS_NOTIFY_INTERFACE_EO_TYPES}
{$define _ELM_SYS_NOTIFY_INTERFACE_EO_TYPES}
{* Urgency levels of a notification
 *
 * @since 1.8
 *
 * @ingroup Elm_Sys_Notify
  }
{*< Low urgency  }
{*< Normal urgency  }
{*< Critical urgency  }
type
  PElm_Sys_Notify_Urgency = ^TElm_Sys_Notify_Urgency;
  TElm_Sys_Notify_Urgency =  Longint;
  Const
    ELM_SYS_NOTIFY_URGENCY_LOW = 0;
    ELM_SYS_NOTIFY_URGENCY_NORMAL = 1;
    ELM_SYS_NOTIFY_URGENCY_CRITICAL = 2;
;
{$endif}
{*
 * @brief Causes a notification to be forcefully closed and removed from the
 * user's view. It can be used, for example, in the event that what the
 * notification pertains to is no longer relevant, or to cancel a notification
 * with no expiration time.
 *
 * @param[in] obj The object.
 * @param[in] replaces_id Notification ID that this notification replaces. The
 * value 0 means a new notification.
 * @param[in] icon The optional program icon of the calling application
 * @param[in] summary The summary text briefly describing the notification
 * @param[in] body The optional detailed body text. Can be empty
 * @param[in] urgency The urgency level
 * @param[in] timeout Timeout display in milliseconds
 * @param[in] cb Callback used to retrieve the notification id returned by the
 * Notification Server
 * @param[in] cb_data Optional context data
 *
 * @since 1.8
 *
 * @ingroup Elm_Sys_Notify_Interface_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure elm_sys_notify_interface_send(obj:PElm_Sys_Notify_Interface; replaces_id:dword; icon:Pchar; summary:Pchar; body:Pchar; 
            urgency:TElm_Sys_Notify_Urgency; timeout:longint; cb:TElm_Sys_Notify_Send_Cb; cb_data:pointer);cdecl;external;
{*
 * @brief Create a new notification just with Icon, Body and Summary. It is a
 * helper that wraps the send method
 *
 * @param[in] obj The object.
 * @param[in] icon The optional program icon of the calling application
 * @param[in] summary The summary text briefly describing the notification
 * @param[in] body The optional detailed body text. Can be empty
 *
 * @since 1.16
 *
 * @ingroup Elm_Sys_Notify_Interface_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_sys_notify_interface_simple_send(obj:PElm_Sys_Notify_Interface; icon:Pchar; summary:Pchar; body:Pchar);cdecl;external;
{*
 * @brief Causes a notification to be forcefully closed and removed from the
 * user's view. It can be used, for example, in the event that what the
 * notification  pertains to is no longer relevant, or to cancel a notification
 * with no expiration time.
 *
 * @param[in] obj The object.
 * @param[in] id Notification ID
 *
 * @since 1.8
 *
 * @ingroup Elm_Sys_Notify_Interface_Group
  }
(* Const before type ignored *)
procedure elm_sys_notify_interface_close(obj:PElm_Sys_Notify_Interface; id:dword);cdecl;external;
{$endif}

implementation


end.
