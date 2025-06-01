
unit elm_grid_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_grid_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_grid_legacy.h
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
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new grid to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Grid_Group
  }

function elm_grid_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Set packing of an existing child at to position and size
 *
 * @param subobj The child to set packing of
 * @param x The virtual x coord at which to pack it
 * @param y The virtual y coord at which to pack it
 * @param w The virtual width at which to pack it
 * @param h The virtual height at which to pack it
 *
 * @ingroup Elm_Grid_Group
  }
procedure elm_grid_pack_set(subobj:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord; w:TEvas_Coord; h:TEvas_Coord);cdecl;external;
{*
 * Get packing of a child
 *
 * @param subobj The child to query
 * @param x Pointer to integer to store the virtual x coord
 * @param y Pointer to integer to store the virtual y coord
 * @param w Pointer to integer to store the virtual width
 * @param h Pointer to integer to store the virtual height
 *
 * @ingroup Elm_Grid_Group
  }
procedure elm_grid_pack_get(subobj:PEvas_Object; x:PEvas_Coord; y:PEvas_Coord; w:PEvas_Coord; h:PEvas_Coord);cdecl;external;
{$include "elm_grid_eo.legacy.h"}

implementation


end.
