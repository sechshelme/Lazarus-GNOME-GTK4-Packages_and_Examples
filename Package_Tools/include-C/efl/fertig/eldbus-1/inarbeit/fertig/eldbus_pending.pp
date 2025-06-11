
unit eldbus_pending;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_pending.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_pending.h
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
PEldbus_Pending  = ^Eldbus_Pending;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_PENDING_H}

const
  ELDBUS_PENDING_H = 1;  
{*
 * @defgroup Eldbus_Pending Pending
 * @ingroup Eldbus
 *
 * @
  }
{*
 * @brief Set data to a Eldbus_Pending object.
 *
 * @param pending The Eldbus_Pending object on which the data is set.
 * @param key A string corresponding to the key associated with the data.
 * @param data The data to set to the Eldbus_Pending object.
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure eldbus_pending_data_set(pending:PEldbus_Pending; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Get the data set to a Eldbus_Pending object.
 *
 * @param pending The Eldbus_Pending object on which the data is set.
 * @param key A string corresponding to the key associated with the data.
 * @return The data set to the Eldbus_Pending object.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_pending_data_get(pending:PEldbus_Pending; key:Pchar):pointer;cdecl;external;
{*
 * @brief Delete the data set to a Eldbus_Pending object.
 *
 * @param pending The Eldbus_Pending object on which the data is set.
 * @param key A string corresponding to the key associated with the data.
  }
(* Const before type ignored *)
function eldbus_pending_data_del(pending:PEldbus_Pending; key:Pchar):pointer;cdecl;external;
{*
 * @brief Cancel the pending message.
 *
 * @param pending The Eldbus_Pending object corresponding to the pending message.
  }
procedure eldbus_pending_cancel(pending:PEldbus_Pending);cdecl;external;
{*
 * @brief Get the destination of the pending message.
 *
 * @param pending The Eldbus_Pending object.
 * @return A string corresponding to the destination of the message.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_pending_destination_get(pending:PEldbus_Pending):Pchar;cdecl;external;
{*
 * @brief Get the path of the pending message.
 *
 * @param pending The Eldbus_Pending object.
 * @return A string corresponding to the path of the message.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_pending_path_get(pending:PEldbus_Pending):Pchar;cdecl;external;
{*
 * @brief Get the interface of the pending message.
 *
 * @param pending The Eldbus_Pending object.
 * @return A string corresponding to the interface of the message.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_pending_interface_get(pending:PEldbus_Pending):Pchar;cdecl;external;
{*
 * @brief Get the method of the pending message.
 *
 * @param pending The Eldbus_Pending object.
 * @return A string corresponding to the method of the message.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_pending_method_get(pending:PEldbus_Pending):Pchar;cdecl;external;
{*
 * @brief Add a callback function to be called when pending will be freed.
 *
 * @param pending The Eldbus_Pending object on which the callback is registered.
 * @param cb The callback to register.
 * @param data The data to pass to the callback.
  }
(* Const before type ignored *)
procedure eldbus_pending_free_cb_add(pending:PEldbus_Pending; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_pending_free_cb_add().
 *
 * @param pending The Eldbus_Pending object on which the callback was registered.
 * @param cb The callback that was registered.
 * @param data The data passed to the callback.
  }
(* Const before type ignored *)
procedure eldbus_pending_free_cb_del(pending:PEldbus_Pending; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
