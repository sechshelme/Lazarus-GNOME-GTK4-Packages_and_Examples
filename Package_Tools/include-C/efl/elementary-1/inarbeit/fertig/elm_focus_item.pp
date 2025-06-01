
unit elm_focus_item;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_focus_item.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_focus_item.h
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
 * Get the focused object item
 *
 * This returns the focused object item.
 *
 * @param obj The container object
 * @return The focused item, or @c NULL if none
 *
 * The focused item can be unfocused with function
 * elm_object_item_focus_set().
 *
 * @see elm_object_item_focus_set()
 * @see elm_object_item_focus_get()
 *
 * @ingroup Elm_Focus
 * @since 1.10
  }
(* Const before type ignored *)

function elm_object_focused_item_get(obj:PEvas_Object):PElm_Object_Item;cdecl;external;
{*
 * Get next object item which was set with specific focus direction.
 *
 * Get next object item which was set by elm_object_focus_next_item_set
 * with specific focus direction.
 *
 * @param obj The Elementary object
 * @param dir Focus direction
 * @return Focus next object item or @c NULL, if there is no focus next
 * object item.
 *
 * @see elm_object_focus_next_item_set(), elm_object_focus_next()
 *
 * @since 1.16
 *
 * @ingroup Elm_Focus
  }
(* Const before type ignored *)
function elm_object_focus_next_item_get(obj:PEvas_Object; dir:TElm_Focus_Direction):PElm_Object_Item;cdecl;external;
{*
 * Set next object item with specific focus direction.
 *
 * When focus next object item is set with specific focus direction,
 * this object item will be the first candidate when finding
 * next focusable object or item.
 * If the focus next object item is set, it is preference to focus next object.
 * Focus next object item can be registered with six directions that are
 * previous, next, up, down, right, and left.
 *
 * @param obj The Elementary object
 * @param next_item Focus next object item
 * @param dir Focus direction
 *
 * @see elm_object_focus_next_item_get(), elm_object_focus_next()
 *
 * @since 1.16
 *
 * @ingroup Elm_Focus
  }
procedure elm_object_focus_next_item_set(obj:PEvas_Object; next_item:PElm_Object_Item; dir:TElm_Focus_Direction);cdecl;external;

implementation


end.
