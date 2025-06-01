
unit elm_genlist_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_genlist_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_genlist_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new genlist widget to the given parent Elementary
 * (container) object
 *
 * @param parent The parent object
 * @return a new genlist widget handle or @c NULL, on errors
 *
 * This function inserts a new genlist widget on the canvas.
 *
 * @see elm_genlist_item_append()
 * @see elm_object_item_del()
 * @see elm_genlist_clear()
 *
 * @ingroup Elm_Genlist_Group
  }

function elm_genlist_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Get the nth item, in a given genlist widget, placed at position @p nth, in
 * its internal items list
 *
 * @param obj The genlist object
 * @param nth The number of the item to grab (0 being the first)
 *
 * @return The item stored in @p obj at position @p nth or @c NULL, if there's
 * no item with that index (and on errors)
 *
 * @ingroup Elm_Genlist_Group
 * @since 1.8
  }
(* Const before type ignored *)
function elm_genlist_nth_item_get(obj:PEvas_Object; nth:dword):PElm_Object_Item;cdecl;external;
{$include "elm_genlist_item_eo.legacy.h"}
{$include "elm_genlist_eo.legacy.h"}

implementation


end.
