
unit elm_menu_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_menu_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_menu_legacy.h
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
 * @brief Add a new menu to the parent
 *
 * @param parent The parent object.
 * @return The new object or NULL if it cannot be created.
 *
 * @ingroup Elm_Menu
  }

function elm_menu_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the parent for the given menu widget
 *
 * @param obj The menu object.
 * @param parent The new parent.
 *
 * @ingroup Elm_Menu
  }
procedure elm_menu_parent_set(obj:PEvas_Object; parent:PEvas_Object);cdecl;external;
{*
 * @brief Get the parent for the given menu widget
 *
 * @param obj The menu object.
 * @return The parent.
 *
 * @see elm_menu_parent_set()
 *
 * @ingroup Elm_Menu
  }
(* Const before type ignored *)
function elm_menu_parent_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_menu_item_eo.legacy.h"}
{$include "elm_menu_eo.legacy.h"}

implementation


end.
