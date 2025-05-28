
unit elc_multibuttonentry_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_multibuttonentry_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elc_multibuttonentry_common.h
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
PElm_Multibuttonentry_Format_Cb  = ^Elm_Multibuttonentry_Format_Cb;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Callback to be invoked when an item is added to the multibuttonentry.
 *
 * @param obj The parent object
 * @param item_label The label corresponding to the added item.
 * @param item_data data specific to this item.
 * @param data data specific to the multibuttonentry.
 *
 * @return @c EINA_TRUE
 *         @c EINA_FALSE otherwise.
 *
 * @ingroup Multibuttonentry
  }
(* Const before type ignored *)
type

  TElm_Multibuttonentry_Item_Filter_Cb = function (obj:PEvas_Object; item_label:Pchar; item_data:pointer; data:pointer):TEina_Bool;cdecl;
{*
 * @typedef Elm_Multibuttonentry_Format_Cb
 *
 * This callback type is used to format the string that will be used
 * to display the hidden items counter, when not in expanded mode.
 *
 * @param count Number of hidden items
 * @param data The (context) data passed in to
 * elm_multibuttonentry_format_function_set()
 * @return String representing the counter that will be set to
 * multibuttonentry's counter item's text.
 *
 * @see elm_multibuttonentry_format_function_set()
 * @see elm_multibuttonentry_expanded_set()
 *
 * @ingroup Multibuttonentry
  }

  PElm_Multibuttonentry_Format_Cb = ^TElm_Multibuttonentry_Format_Cb;
  TElm_Multibuttonentry_Format_Cb = function (count:longint; data:pointer):Pchar;cdecl;

implementation


end.
