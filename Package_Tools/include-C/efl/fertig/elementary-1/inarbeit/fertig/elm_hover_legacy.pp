
unit elm_hover_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_hover_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_hover_legacy.h
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
 * @brief Adds a hover object to @p parent
 *
 * @param parent The parent object
 * @return The hover object or NULL if one could not be created
 *
 * @ingroup Elm_Hover
  }

function elm_hover_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Sets the parent object for the hover.
 *
 * @param obj The hover object
 * @param parent The object to locate the hover over.
 *
 * This function will cause the hover to take up the entire space that the
 * parent object fills.
 *
 * @ingroup Elm_Hover
  }
procedure elm_hover_parent_set(obj:PEvas_Object; parent:PEvas_Object);cdecl;external;
{*
 * @brief Get the parent object for the hover.
 *
 * @param obj The hover object
 * @return The parent object to locate the hover over.
 *
 * @see elm_hover_parent_set()
 *
 * @ingroup Elm_Hover
  }
(* Const before type ignored *)
function elm_hover_parent_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_hover_eo.legacy.h"}

implementation


end.
