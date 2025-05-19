
unit efl_pack_table_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_pack_table_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_pack_table_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Pack_Table  = ^Efl_Pack_Table;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PACK_TABLE_EO_H_}
{$define _EFL_PACK_TABLE_EO_H_}
{$ifndef _EFL_PACK_TABLE_EO_CLASS_TYPE}
{$define _EFL_PACK_TABLE_EO_CLASS_TYPE}
type
  PEfl_Pack_Table = ^TEfl_Pack_Table;
  TEfl_Pack_Table = TEo;
{$endif}
{$ifndef _EFL_PACK_TABLE_EO_TYPES}
{$define _EFL_PACK_TABLE_EO_TYPES}
{$endif}
{*
 * @brief Interface for 2D containers which arrange their elements on a table
 * with rows and columns.
 *
 * Elements can be positioned on a specific row and column, or they can be
 * simply added to the table using @ref efl_pack and the container will chose
 * where to put them.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }

{ was #define dname def_expr }
function EFL_PACK_TABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_pack_table_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Pack object at a given location in the table.
 *
 * When this container is deleted, it will request deletion of the given
 * @c subobj. Use @ref efl_pack_unpack to remove @c subobj from this container
 * without deleting it.
 *
 * @param[in] obj The object.
 * @param[in] subobj A child object to pack in this table.
 * @param[in] col Column number
 * @param[in] row Row number
 * @param[in] colspan 0 means 1, -1 means @ref efl_pack_table_columns_get
 * @param[in] rowspan 0 means 1, -1 means @ref efl_pack_table_rows_get
 *
 * @return @c true on success, @c false otherwise
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
function efl_pack_table(obj:PEo; subobj:PEfl_Gfx_Entity; col:longint; row:longint; colspan:longint; 
           rowspan:longint):TEina_Bool;cdecl;external;
{*
 * @brief Returns all objects at a given position in this table.
 *
 * @param[in] obj The object.
 * @param[in] col Column number
 * @param[in] row Row number
 * @param[in] below If @c true get objects spanning over this cell.
 *
 * @return Iterator to table contents
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
function efl_pack_table_contents_get(obj:PEo; col:longint; row:longint; below:TEina_Bool):PEina_Iterator;cdecl;external;
{*
 * @brief Returns a child at a given position, see
 * @ref efl_pack_table_contents_get.
 *
 * @param[in] obj The object.
 * @param[in] col Column number
 * @param[in] row Row number
 *
 * @return Child object
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
function efl_pack_table_content_get(obj:PEo; col:longint; row:longint):PEfl_Gfx_Entity;cdecl;external;
{*
 * @brief column of the @c subobj in this container.
 *
 * @param[in] obj The object.
 * @param[in] subobj Child object
 * @param[in] col Column number
 * @param[in] colspan Column span
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
procedure efl_pack_table_cell_column_set(obj:PEo; subobj:PEfl_Gfx_Entity; col:longint; colspan:longint);cdecl;external;
{*
 * @brief column of the @c subobj in this container.
 *
 * @param[in] obj The object.
 * @param[in] subobj Child object
 * @param[out] col Column number
 * @param[out] colspan Column span
 *
 * @return Returns false if item is not a child
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
(* Const before type ignored *)
function efl_pack_table_cell_column_get(obj:PEo; subobj:PEfl_Gfx_Entity; col:Plongint; colspan:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief row of the @c subobj in this container.
 *
 * @param[in] obj The object.
 * @param[in] subobj Child object
 * @param[in] row Row number
 * @param[in] rowspan Row span
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
procedure efl_pack_table_cell_row_set(obj:PEo; subobj:PEfl_Gfx_Entity; row:longint; rowspan:longint);cdecl;external;
{*
 * @brief row of the @c subobj in this container.
 *
 * @param[in] obj The object.
 * @param[in] subobj Child object
 * @param[out] row Row number
 * @param[out] rowspan Row span
 *
 * @return Returns false if item is not a child
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
(* Const before type ignored *)
function efl_pack_table_cell_row_get(obj:PEo; subobj:PEfl_Gfx_Entity; row:Plongint; rowspan:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Combines @ref efl_pack_table_columns_get and
 * @ref efl_pack_table_rows_get
 *
 * @param[in] obj The object.
 * @param[in] cols Number of columns
 * @param[in] rows Number of rows
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
procedure efl_pack_table_size_set(obj:PEo; cols:longint; rows:longint);cdecl;external;
{*
 * @brief Combines @ref efl_pack_table_columns_get and
 * @ref efl_pack_table_rows_get
 *
 * @param[in] obj The object.
 * @param[out] cols Number of columns
 * @param[out] rows Number of rows
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
(* Const before type ignored *)
procedure efl_pack_table_size_get(obj:PEo; cols:Plongint; rows:Plongint);cdecl;external;
{*
 * @brief Specifies the amount of columns the table will have when the fill
 * direction is horizontal. If it is vertical, the amount of columns depends on
 * the amount of cells added and @ref efl_pack_table_rows_get.
 *
 * @param[in] obj The object.
 * @param[in] cols Amount of columns.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
procedure efl_pack_table_columns_set(obj:PEo; cols:longint);cdecl;external;
{*
 * @brief Specifies the amount of columns the table will have when the fill
 * direction is horizontal. If it is vertical, the amount of columns depends on
 * the amount of cells added and @ref efl_pack_table_rows_get.
 *
 * @param[in] obj The object.
 *
 * @return Amount of columns.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
(* Const before type ignored *)
function efl_pack_table_columns_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Specifies the amount of rows the table will have when the fill
 * direction is vertical. If it is horizontal, the amount of rows depends on
 * the amount of cells added and @ref efl_pack_table_columns_get.
 *
 * @param[in] obj The object.
 * @param[in] rows Amount of rows.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
procedure efl_pack_table_rows_set(obj:PEo; rows:longint);cdecl;external;
{*
 * @brief Specifies the amount of rows the table will have when the fill
 * direction is vertical. If it is horizontal, the amount of rows depends on
 * the amount of cells added and @ref efl_pack_table_columns_get.
 *
 * @param[in] obj The object.
 *
 * @return Amount of rows.
 *
 * @since 1.23
 *
 * @ingroup Efl_Pack_Table
  }
(* Const before type ignored *)
function efl_pack_table_rows_get(obj:PEo):longint;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_PACK_TABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PACK_TABLE_INTERFACE:=efl_pack_table_interface_get;
  end;


end.
