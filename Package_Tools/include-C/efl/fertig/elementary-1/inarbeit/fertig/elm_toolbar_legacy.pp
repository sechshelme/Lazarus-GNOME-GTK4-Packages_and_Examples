
unit elm_toolbar_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_toolbar_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_toolbar_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new toolbar widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return a new toolbar widget handle or @c NULL, on errors.
 *
 * This function inserts a new toolbar widget on the canvas.
 *
 * @ingroup Elm_Toolbar
  }

function elm_toolbar_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Set reorder mode
 *
 * @param obj The toolbar object
 * @param reorder_mode The reorder mode
 * (@c EINA_TRUE = on, @c EINA_FALSE = off)
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_reorder_mode_set(obj:PEvas_Object; reorder_mode:TEina_Bool);cdecl;external;
{*
 * Get the reorder mode
 *
 * @param obj The toolbar object
 * @return The reorder mode
 * (@c EINA_TRUE = on, @c EINA_FALSE = off)
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_reorder_mode_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Set the item's transverse expansion of a given toolbar widget @p obj.
 *
 * @param obj The toolbar object.
 * @param transverse_expanded The transverse expansion of the item.
 * (@c EINA_TRUE = on, @c EINA_FALSE = off, default = @c EINA_FALSE)
 *
 * This will expand the transverse length of the item according the transverse length of the toolbar.
 * The default is what the transverse length of the item is set according its min value.
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_transverse_expanded_set(obj:PEvas_Object; transverse_expanded:TEina_Bool);cdecl;external;
{*
 * Get the transverse expansion of toolbar @p obj.
 *
 * @param obj The toolbar object.
 * @return The transverse expansion of the item.
 * (@c EINA_TRUE = on, @c EINA_FALSE = off, default = @c EINA_FALSE)
 *
 * @see elm_toolbar_transverse_expand_set() for details.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_transverse_expanded_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Sets icon lookup order, for toolbar items' icons.
 *
 * Icons added before calling this function will not be affected. The default
 * lookup order is #ELM_ICON_LOOKUP_THEME_FDO.
 *
 * @param[in] order The icon lookup order. (If getting the icon order loopup
 * fails, it returns #ELM_ICON_LOOKUP_THEME_FDO)
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_icon_order_lookup_set(obj:PEvas_Object; order:TElm_Icon_Lookup_Order);cdecl;external;
{*
 * Gets icon lookup order, for toolbar items' icons.
 *
 * Icons added before calling this function will not be affected. The default
 * lookup order is #ELM_ICON_LOOKUP_THEME_FDO.
 *
 * @return The icon lookup order. (If getting the icon order loopup fails, it
 * returns #ELM_ICON_LOOKUP_THEME_FDO)
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_icon_order_lookup_get(obj:PEvas_Object):TElm_Icon_Lookup_Order;cdecl;external;
{*
 * @brief Change a toolbar's orientation
 *
 * By default, a toolbar will be horizontal. Use this function to create a
 * vertical toolbar.
 *
 * @param[in] horizontal If @c true, the toolbar is horizontal.
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_horizontal_set(obj:PEvas_Object; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Get toolbar's current orientation
 *
 * Use this function to get orientation of toolbar.
 *
 * @return If @c true, the toolbar is horizontal.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_horizontal_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{$include "elm_toolbar_item_eo.legacy.h"}
{$include "elm_toolbar_eo.legacy.h"}

implementation


end.
