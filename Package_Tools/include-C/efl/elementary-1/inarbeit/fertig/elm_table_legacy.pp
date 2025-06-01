
unit elm_table_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_table_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_table_legacy.h
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
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Add a new table to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Table_Group
  }

function elm_table_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the packing location of an existing child of the table
 *
 * @param subobj The subobject to be modified in the table
 * @param col Column number
 * @param row Row number
 * @param colspan colspan
 * @param rowspan rowspan
 *
 * Modifies the position of an object already in the table.
 *
 * @note All positioning inside the table is relative to rows and columns, so
 * a value of 0 for col and row, means the top left cell of the table, and a
 * value of 1 for colspan and rowspan means @p subobj only takes that 1 cell.
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_pack_set(subobj:PEvas_Object; col:longint; row:longint; colspan:longint; rowspan:longint);cdecl;external;
{*
 * @brief Get the packing location of an existing child of the table
 *
 * @param subobj The subobject to be modified in the table
 * @param col Column number
 * @param row Row number
 * @param colspan colspan
 * @param rowspan rowspan
 *
 * @see elm_table_pack_set()
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_pack_get(subobj:PEvas_Object; col:Plongint; row:Plongint; colspan:Plongint; rowspan:Plongint);cdecl;external;
{$include "elm_table_eo.legacy.h"}

implementation


end.
