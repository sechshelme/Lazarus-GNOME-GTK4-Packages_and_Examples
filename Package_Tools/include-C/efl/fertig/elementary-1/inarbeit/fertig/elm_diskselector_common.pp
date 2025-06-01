
unit elm_diskselector_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_diskselector_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_diskselector_common.h
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
PElm_Object_Item  = ^Elm_Object_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure elm_diskselector_item_selected_set(it:PElm_Object_Item; selected:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function elm_diskselector_item_selected_get(it:PElm_Object_Item):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function elm_diskselector_item_prev_get(it:PElm_Object_Item):PElm_Object_Item;cdecl;external;
(* Const before type ignored *)
function elm_diskselector_item_next_get(it:PElm_Object_Item):PElm_Object_Item;cdecl;external;

implementation


end.
