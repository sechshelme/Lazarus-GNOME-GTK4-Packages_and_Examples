
unit elm_notify_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_notify_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_notify_eo_legacy.h
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
Pdouble  = ^double;
PElm_Notify  = ^Elm_Notify;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_NOTIFY_EO_LEGACY_H_}
{$define _ELM_NOTIFY_EO_LEGACY_H_}
{$ifndef _ELM_NOTIFY_EO_CLASS_TYPE}
{$define _ELM_NOTIFY_EO_CLASS_TYPE}
type
  PElm_Notify = ^TElm_Notify;
  TElm_Notify = TEo;
{$endif}
{$ifndef _ELM_NOTIFY_EO_TYPES}
{$define _ELM_NOTIFY_EO_TYPES}
{$endif}
{*
 * @brief Set the alignment of the notify object
 *
 * Sets the alignment in which the notify will appear in its parent.
 *
 * @note To fill the notify box in the parent area, please pass the
 * ELM_NOTIFY_ALIGN_FILL to horizontal and vertical.
 *
 * @param[in] obj The object.
 * @param[in] horizontal The horizontal alignment of the notification
 * @param[in] vertical The vertical alignment of the notification
 *
 * @since 1.8
 *
 * @ingroup Elm_Notify_Group
  }

procedure elm_notify_align_set(obj:PElm_Notify; horizontal:Tdouble; vertical:Tdouble);cdecl;external;
{*
 * @brief Get the alignment of the notify object
 *
 * @param[in] obj The object.
 * @param[out] horizontal The horizontal alignment of the notification
 * @param[out] vertical The vertical alignment of the notification
 *
 * @since 1.8
 *
 * @ingroup Elm_Notify_Group
  }
(* Const before type ignored *)
procedure elm_notify_align_get(obj:PElm_Notify; horizontal:Pdouble; vertical:Pdouble);cdecl;external;
{*
 * @brief Sets whether events should be passed to by a click outside its area.
 *
 * When true if the user clicks outside the window the events will be caught by
 * the others widgets, else the events are blocked.
 *
 * @note The default value is true.
 *
 * @param[in] obj The object.
 * @param[in] allow @c true if events are allowed, @c false otherwise
 *
 * @ingroup Elm_Notify_Group
  }
procedure elm_notify_allow_events_set(obj:PElm_Notify; allow:TEina_Bool);cdecl;external;
{*
 * @brief Return true if events are allowed below the notify object.
 *
 * @param[in] obj The object.
 *
 * @return @c true if events are allowed, @c false otherwise
 *
 * @ingroup Elm_Notify_Group
  }
(* Const before type ignored *)
function elm_notify_allow_events_get(obj:PElm_Notify):TEina_Bool;cdecl;external;
{*
 * @brief Set the time interval after which the notify window is going to be
 * hidden.
 *
 * This function sets a timeout and starts the timer controlling when the
 * notify is hidden. Since calling evas_object_show() on a notify restarts the
 * timer controlling when the notify is hidden, setting this before the notify
 * is shown will in effect mean starting the timer when the notify is shown.
 *
 * @note Set a value <= 0.0 to disable a running timer.
 *
 * @note If the value > 0.0 and the notify is previously visible, the timer
 * will be started with this value, canceling any running timer.
 *
 * @param[in] obj The object.
 * @param[in] timeout The timeout in seconds
 *
 * @ingroup Elm_Notify_Group
  }
procedure elm_notify_timeout_set(obj:PElm_Notify; timeout:Tdouble);cdecl;external;
{*
 * @brief Return the timeout value (in seconds)
 *
 * @param[in] obj The object.
 *
 * @return The timeout in seconds
 *
 * @ingroup Elm_Notify_Group
  }
(* Const before type ignored *)
function elm_notify_timeout_get(obj:PElm_Notify):Tdouble;cdecl;external;
{* Dismiss a notify object.
 *
 * @since 1.17
 *
 * @ingroup Elm_Notify_Group
  }
procedure elm_notify_dismiss(obj:PElm_Notify);cdecl;external;
{$endif}

implementation


end.
