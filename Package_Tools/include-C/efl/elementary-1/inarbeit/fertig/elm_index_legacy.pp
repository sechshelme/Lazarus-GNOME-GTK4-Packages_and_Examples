
unit elm_index_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_index_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_index_legacy.h
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
 * Add a new index widget to the given parent Elementary
 * (container) object
 *
 * @param parent The parent object
 * @return a new index widget handle or @c NULL, on errors
 *
 * This function inserts a new index widget on the canvas.
 *
 * @ingroup Elm_Index_Group
  }

function elm_index_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Enable or disable horizontal mode on the index object
 *
 * @note Vertical mode is set by default.
 *
 * On horizontal mode items are displayed on index from left to right, instead
 * of from top to bottom. Also, the index will scroll horizontally.
 *
 * @param[in] horizontal @c true to enable horizontal or @c false to disable
 * it, i.e., to enable vertical mode. it's an area one Fingers "finger" wide on
 * the bottom side of the index widget's container.
 *
 * @ingroup Elm_Index_Group
  }
procedure elm_index_horizontal_set(obj:PEvas_Object; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Get enable or disable status of horizontal mode on the index object.
 *
 * @note Vertical mode is set by default.
 *
 * Returns the current status of horizontal mode on index object.
 * On horizontal mode items are displayed on index from left to right, instead
 * of from top to bottom. Also, the index will scroll horizontally.
 *
 * @return Current status of horizontal mode on index object.
 * @c true if horizontal mode is enabled or @c false if disabled.
 *
 * @ingroup Elm_Index_Group
  }
(* Const before type ignored *)
function elm_index_horizontal_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{$include "elm_index_item_eo.legacy.h"}
{$include "elm_index_eo.legacy.h"}

implementation


end.
