
unit eldbus_message_eina_value;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_message_eina_value.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_message_eina_value.h
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
PEina_Value  = ^Eina_Value;
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Message_Iter  = ^Eldbus_Message_Iter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @ingroup Eldbus_Message
 * @defgroup Eina_Value Eina_Value to/from Message
 * @
  }
{*
 * Convert Eldbus_Message to Eina_Value
 *
 * @param msg Message
 * @return Eina_Value of type Eina_Value_Type_Struct
  }
(* Const before type ignored *)

function eldbus_message_to_eina_value(msg:PEldbus_Message):PEina_Value;cdecl;external;
{*
 * Convert Eldbus_Message_Iter of type variant, struct or dict entry to
 * Eina_Value.
 *
 * @param iter Message iterator
 * @return Eina_Value of type Eina_Value_Type_Struct
  }
(* Const before type ignored *)
function eldbus_message_iter_struct_like_to_eina_value(iter:PEldbus_Message_Iter):PEina_Value;cdecl;external;
{*
 * Convert Eina_Value to Eldbus_Message
 *
 * @param signature dbus signature
 * @param msg where data will be put
 * @param value source of data, must be of type Eina_Value_Type_Struct
 * @return success or not
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_from_eina_value(signature:Pchar; msg:PEldbus_Message; value:PEina_Value):TEina_Bool;cdecl;external;
{*
 * @
  }

implementation


end.
