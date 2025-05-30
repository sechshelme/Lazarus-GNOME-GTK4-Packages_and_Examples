
unit elm_sys_notify_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_sys_notify_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_sys_notify_eo_legacy.h
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
PElm_Sys_Notify  = ^Elm_Sys_Notify;
PElm_Sys_Notify_Action_Invoked  = ^Elm_Sys_Notify_Action_Invoked;
PElm_Sys_Notify_Closed_Reason  = ^Elm_Sys_Notify_Closed_Reason;
PElm_Sys_Notify_Notification_Closed  = ^Elm_Sys_Notify_Notification_Closed;
PElm_Sys_Notify_Server  = ^Elm_Sys_Notify_Server;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SYS_NOTIFY_EO_LEGACY_H_}
{$define _ELM_SYS_NOTIFY_EO_LEGACY_H_}
{$ifndef _ELM_SYS_NOTIFY_EO_CLASS_TYPE}
{$define _ELM_SYS_NOTIFY_EO_CLASS_TYPE}
type
  PElm_Sys_Notify = ^TElm_Sys_Notify;
  TElm_Sys_Notify = TEo;
{$endif}
{$ifndef _ELM_SYS_NOTIFY_EO_TYPES}
{$define _ELM_SYS_NOTIFY_EO_TYPES}
{* System notification server types
 *
 * @ingroup Elm_Sys_Notify
  }
{*< No notificationserver (disables
                                   * notifications)  }
{ 1 >> 0  }{*< Use DBus as a notification
                                               * server  }
type
  PElm_Sys_Notify_Server = ^TElm_Sys_Notify_Server;
  TElm_Sys_Notify_Server =  Longint;
  Const
    ELM_SYS_NOTIFY_SERVER_NONE = 0;
    ELM_SYS_NOTIFY_SERVER_DBUS = 1;
;
{* The reason the notification was closed
 *
 * @since 1.8
 *
 * @ingroup Elm_Sys_Notify
  }
{*< The notification expired  }
{*< The notification was dismissed by the
                                    * user  }
{*< The notification was closed by a call to
                                    * CloseNotification method  }
{*< Undefined/reserved reasons  }
type
  PElm_Sys_Notify_Closed_Reason = ^TElm_Sys_Notify_Closed_Reason;
  TElm_Sys_Notify_Closed_Reason =  Longint;
  Const
    ELM_SYS_NOTIFY_CLOSED_EXPIRED = 0;
    ELM_SYS_NOTIFY_CLOSED_DISMISSED = 1;
    ELM_SYS_NOTIFY_CLOSED_REQUESTED = 2;
    ELM_SYS_NOTIFY_CLOSED_UNDEFINED = 3;
;
{* Data on event when notification closed is emitted
 *
 * @since 1.8
 *
 * @ingroup Elm_Sys_Notify
  }
{*< ID of the notification  }
{*< The reason the notification was
                                        * closed  }
type
  PElm_Sys_Notify_Notification_Closed = ^TElm_Sys_Notify_Notification_Closed;
  TElm_Sys_Notify_Notification_Closed = record
      id : dword;
      reason : TElm_Sys_Notify_Closed_Reason;
    end;
{* Data on event when the action invoked is emitted
 *
 * @since 1.8
 *
 * @ingroup Elm_Sys_Notify
  }
{*< ID of the notification  }
{*< The key of the action invoked. These match the keys
                     * sent over in the list of actions  }

  PElm_Sys_Notify_Action_Invoked = ^TElm_Sys_Notify_Action_Invoked;
  TElm_Sys_Notify_Action_Invoked = record
      id : dword;
      action_key : Pchar;
    end;
{$endif}
{*
 * @brief Set the notifications server to be used.
 *
 * @note This is an advanced function that should be used only to fulfill very
 * specific purposes. Use elm_need_sys_notify() which activates the default
 * available notification servers.
 *
 * @param[in] obj The object.
 * @param[in] servers Binary mask of servers to enable. If a server is not
 * present in the binary mask but was previously registered, it will be
 * unregistered.
 *
 * @return @c true on success, @c false on failure
 *
 * @since 1.17
 *
 * @ingroup Elm_Sys_Notify_Group
  }

function elm_sys_notify_servers_set(obj:PElm_Sys_Notify; servers:TElm_Sys_Notify_Server):TEina_Bool;cdecl;external;
{*
 * @brief Get the notification servers that have been registered
 *
 * @param[in] obj The object.
 *
 * @return Binary mask of servers to enable. If a server is not present in the
 * binary mask but was previously registered, it will be unregistered.
 *
 * @since 1.17
 *
 * @ingroup Elm_Sys_Notify_Group
  }
(* Const before type ignored *)
function elm_sys_notify_servers_get(obj:PElm_Sys_Notify):TElm_Sys_Notify_Server;cdecl;external;
{*
 * @brief Returns the singleton instance of the notification manager
 * Elm.Sys_Notify. It is initialized upon the first call of this function
 *
 * @return The unique notification manager
 *
 * @since 1.17
 *
 * @ingroup Elm_Sys_Notify_Group
  }
function elm_sys_notify_singleton_get:PElm_Sys_Notify;cdecl;external;
{$endif}

implementation


end.
