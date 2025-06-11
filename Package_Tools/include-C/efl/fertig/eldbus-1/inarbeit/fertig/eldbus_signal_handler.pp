
unit eldbus_signal_handler;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_signal_handler.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_signal_handler.h
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
PEldbus_Connection  = ^Eldbus_Connection;
PEldbus_Signal_Handler  = ^Eldbus_Signal_Handler;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_SIGNAL_HANDLER_H}

const
  ELDBUS_SIGNAL_HANDLER_H = 1;  
{*
 * @defgroup Eldbus_Signal_Handler Signal Handler
 * @ingroup Eldbus
 *
 * @
  }
{*
 * @brief Add a signal handler.
 *
 * @param conn connection where the signal is emitted
 * @param sender bus name or unique id of where the signal is emitted
 * @param path path of remote object
 * @param interface that signal belongs
 * @param member name of the signal
 * @param cb callback that will be called when this signal is received
 * @param cb_data data that will be passed to callback
 *
 * @return signal handler
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function eldbus_signal_handler_add(conn:PEldbus_Connection; sender:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           cb:TEldbus_Signal_Cb; cb_data:pointer):PEldbus_Signal_Handler;cdecl;external;
{*
 * @brief Increase signal handler reference.
 *
 * @param handler signal handler
 *
 * @return the same signal handler, @p handler
  }
function eldbus_signal_handler_ref(handler:PEldbus_Signal_Handler):PEldbus_Signal_Handler;cdecl;external;
{*
 * @brief Decrease signal handler reference.
 * If reference == 0 signal handler will be freed.
 *
 * @param handler signal handler
  }
procedure eldbus_signal_handler_unref(handler:PEldbus_Signal_Handler);cdecl;external;
{*
 * @brief Decrease signal handler reference like eldbus_signal_handler_unref()
 * but if reference > 0 this signal handler will stop listening to signals. In other
 * words it will be canceled but memory will not be freed.
 *
 * @param handler signal handler to delete
  }
procedure eldbus_signal_handler_del(handler:PEldbus_Signal_Handler);cdecl;external;
{*
 * @brief Add extra argument in match of signal handler to obtain specifics signals.
 *
 * Example:
 * eldbus_signal_handler_match_extra_set(sh, "arg0", "org.bansheeproject.Banshee", "arg1", "", NULL);
 * With this extra arguments this signal handler callback only will be called
 * when Banshee is started.
 *
 * @note For now only argX is supported.
 *
 * @param sh signal handler
 * @param ... variadic of key and value and must be ended with a NULL
 *
 * @return EINA_TRUE if success
 *
 * @note For more information:
 * http://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-routing-match-rules
  }
function eldbus_signal_handler_match_extra_set(sh:PEldbus_Signal_Handler; args:array of const):TEina_Bool;cdecl;external;
function eldbus_signal_handler_match_extra_set(sh:PEldbus_Signal_Handler):TEina_Bool;cdecl;external;
{*
 * @brief Add extra argument in match of signal handler to obtain specifics signals.
 *
 * Example:
 * eldbus_signal_handler_match_extra_set(sh, "arg0", "org.bansheeproject.Banshee", "arg1", "", NULL);
 * With this extra arguments this signal handler callback only will be called
 * when Banshee is started.
 *
 * @note For now is only supported argX.
 *
 * @param sh signal handler
 * @param ap va_list with the keys and values, must be ended with a NULL
 *
 * @return EINA_TRUE if success
 *
 * @note To information:
 * http://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-routing-match-rules
  }
function eldbus_signal_handler_match_extra_vset(sh:PEldbus_Signal_Handler; ap:Tva_list):TEina_Bool;cdecl;external;
{*
 * @brief Add a callback function to be called when signal handler will be freed.
 *
 * @param handler signal handler
 * @param cb callback that will be called when this signal handler is freed
 * @param data data that will be passed to callback
  }
(* Const before type ignored *)
procedure eldbus_signal_handler_free_cb_add(handler:PEldbus_Signal_Handler; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_signal_handler_free_cb_add().
 *
 * @param handler signal handler
 * @param cb registered callback to remove
 * @param data data that will be passed to callback
  }
(* Const before type ignored *)
procedure eldbus_signal_handler_free_cb_del(handler:PEldbus_Signal_Handler; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_signal_handler_sender_get(handler:PEldbus_Signal_Handler):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_signal_handler_path_get(handler:PEldbus_Signal_Handler):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_signal_handler_interface_get(handler:PEldbus_Signal_Handler):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_signal_handler_member_get(handler:PEldbus_Signal_Handler):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_signal_handler_match_get(handler:PEldbus_Signal_Handler):Pchar;cdecl;external;
(* Const before type ignored *)
function eldbus_signal_handler_connection_get(handler:PEldbus_Signal_Handler):PEldbus_Connection;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
