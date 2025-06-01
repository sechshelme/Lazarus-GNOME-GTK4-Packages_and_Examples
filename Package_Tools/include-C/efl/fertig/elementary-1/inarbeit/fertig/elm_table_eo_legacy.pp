
unit elm_table_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_table_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_table_eo_legacy.h
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
Pdouble  = ^double;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PElm_Table  = ^Elm_Table;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_TABLE_EO_LEGACY_H_}
{$define _ELM_TABLE_EO_LEGACY_H_}
{$ifndef _ELM_TABLE_EO_CLASS_TYPE}
{$define _ELM_TABLE_EO_CLASS_TYPE}
type
  PElm_Table = ^TElm_Table;
  TElm_Table = TEo;
{$endif}
{$ifndef _ELM_TABLE_EO_TYPES}
{$define _ELM_TABLE_EO_TYPES}
{$endif}
{*
 * @brief Control the homogeneous state in a table.
 *
 * @param[in] obj The object.
 * @param[in] homogeneous A boolean to set if the layout is homogeneous in the
 * table.
 *
 * @ingroup Elm_Table_Group
  }

procedure elm_table_homogeneous_set(obj:PElm_Table; homogeneous:TEina_Bool);cdecl;external;
{*
 * @brief Control the homogeneous state in a table.
 *
 * @param[in] obj The object.
 *
 * @return A boolean to set if the layout is homogeneous in the table.
 *
 * @ingroup Elm_Table_Group
  }
(* Const before type ignored *)
function elm_table_homogeneous_get(obj:PElm_Table):TEina_Bool;cdecl;external;
{*
 * @brief Set padding between cells. Default value is 0.
 *
 * @param[in] obj The object.
 * @param[in] horizontal The horizontal padding.
 * @param[in] vertical The vertical padding.
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_padding_set(obj:PElm_Table; horizontal:longint; vertical:longint);cdecl;external;
{*
 * @brief Get padding between cells.
 *
 * @param[in] obj The object.
 * @param[out] horizontal The horizontal padding.
 * @param[out] vertical The vertical padding.
 *
 * @ingroup Elm_Table_Group
  }
(* Const before type ignored *)
procedure elm_table_padding_get(obj:PElm_Table; horizontal:Plongint; vertical:Plongint);cdecl;external;
{*
 * @brief Set alignment of table. Default value is 0.5.
 *
 * @param[in] obj The object.
 * @param[in] horizontal The horizontal alignment.
 * @param[in] vertical The vertical alignment.
 *
 * @since 1.13
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_align_set(obj:PElm_Table; horizontal:Tdouble; vertical:Tdouble);cdecl;external;
{*
 * @brief Get alignment of table.
 *
 * @param[in] obj The object.
 * @param[out] horizontal The horizontal alignment.
 * @param[out] vertical The vertical alignment.
 *
 * @since 1.13
 *
 * @ingroup Elm_Table_Group
  }
(* Const before type ignored *)
procedure elm_table_align_get(obj:PElm_Table; horizontal:Pdouble; vertical:Pdouble);cdecl;external;
{*
 * @brief Faster way to remove all child objects from a table object.
 *
 * @param[in] obj The object.
 * @param[in] clear If @c true, will delete children, else just remove from
 * table.
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_clear(obj:PElm_Table; clear:TEina_Bool);cdecl;external;
{*
 * @brief Get child object of table at given coordinates.
 *
 * @param[in] obj The object.
 * @param[in] col Column number of child object.
 * @param[in] row Row number of child object.
 *
 * @return Child of object if find if not return @c null.
 *
 * @ingroup Elm_Table_Group
  }
(* Const before type ignored *)
function elm_table_child_get(obj:PElm_Table; col:longint; row:longint):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Remove child from table.
 *
 * @param[in] obj The object.
 * @param[in] subobj The subobject.
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_unpack(obj:PElm_Table; subobj:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Add a subobject on the table with the coordinates passed.
 *
 * @note All positioning inside the table is relative to rows and columns, so a
 * value of 0 for x and y, means the top left cell of the table, and a value of
 * 1 for w and h means @c subobj only takes that 1 cell.
 *
 * @note Columns and rows only guarantee 16bit unsigned values at best. That
 * means that col + colspan AND row + rowspan must fit inside 16bit unsigned
 * values cleanly. You will be warned once values exceed 15bit storage, and
 * attempting to use values not able to fit in 16bits will result in failure.
 *
 * @param[in] obj The object.
 * @param[in] subobj The subobject to be added to the table.
 * @param[in] column Column number.
 * @param[in] row Row number.
 * @param[in] colspan Columns span.
 * @param[in] rowspan Rows span.
 *
 * @ingroup Elm_Table_Group
  }
procedure elm_table_pack(obj:PElm_Table; subobj:PEfl_Canvas_Object; column:longint; row:longint; colspan:longint; 
            rowspan:longint);cdecl;external;
{$endif}

implementation


end.
