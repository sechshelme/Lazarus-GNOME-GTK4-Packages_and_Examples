
unit eldbus_message_helper;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_message_helper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_message_helper.h
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
PEldbus_Message_Iter  = ^Eldbus_Message_Iter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @ingroup Eldbus_Message
 * @defgroup Eldbus_Message_Helpers Message Helpers
 *
 * @
  }
{*
 * @typedef Eldbus_Dict_Cb_Get
 *
 * Callback used when iterating over a dictionary. It is called at each entry iteration.
 *
 * @param data Context data passed to the callback.
 * @param key Key parameter.
 * @param var A message iterator on the current entry.
  }
(* Const before type ignored *)
type

  TEldbus_Dict_Cb_Get = procedure (data:pointer; key:pointer; var:PEldbus_Message_Iter);cdecl;
{*
 * Iterate over a dictionary.
 *
 * @param dict iterator with array of entry
 * @param signature of entry, example: "sv"
 * @param cb callback that will be called in each entry
 * @param data context data
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure eldbus_message_iter_dict_iterate(dict:PEldbus_Message_Iter; signature:Pchar; cb:TEldbus_Dict_Cb_Get; data:pointer);cdecl;external;
{*
 * @
  }

implementation


end.
