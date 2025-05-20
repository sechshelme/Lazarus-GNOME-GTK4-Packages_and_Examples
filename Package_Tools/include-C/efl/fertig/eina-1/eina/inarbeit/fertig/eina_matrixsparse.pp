
unit eina_matrixsparse;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_matrixsparse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_matrixsparse.h
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
Pdword  = ^dword;
PEina_Iterator  = ^Eina_Iterator;
PEina_Matrixsparse  = ^Eina_Matrixsparse;
PEina_Matrixsparse_Cell  = ^Eina_Matrixsparse_Cell;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2009 Gustavo Sverzut Barbieri
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_MATRIXSPARSE_H_}
{$define EINA_MATRIXSPARSE_H_}
{$include <stdlib.h>}
{$include "eina_config.h"}
{$include "eina_types.h"}
{$include "eina_iterator.h"}
{$include "eina_accessor.h"}
{*
 * @addtogroup Eina_Matrixsparse_Group Sparse Matrix
 *
 * @brief These functions manage sparse matrices.
 *
 * A sparse matrix stores data objects in cells within a row / column
 * tabular structure, where the majority of cells will be empty.  The
 * sparse matrix takes advantage of this emptiness by allocating memory
 * only for non-empty cells and, in this implementation, storing them
 * internally in linked lists.
 *
 * For more information, you can look at the @ref tutorial_matrixsparse_page.
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @addtogroup Eina_Containers_Group Containers
 *
 * @
  }
{*
 * @defgroup Eina_Matrixsparse_Group Sparse Matrix
 *
 * @
  }
{*
 * @typedef Eina_Matrixsparse
 * Type for a generic sparse matrix.
  }
type
{*
 * @typedef Eina_Matrixsparse_Row
 * Type for a generic sparse matrix row, opaque for users.
  }
{*
 * @typedef Eina_Matrixsparse_Cell
 * Type for a generic sparse matrix cell, opaque for users.
  }
{ constructors and destructors  }
{*
 * @brief Creates a new Sparse Matrix.
 *
 * @param[in] rows Number of rows in matrix. Operations with rows
 *        greater than this value will fail.
 * @param[in] cols Number of columns in matrix. Operations with columns
 *        greater than this value will fail.
 * @param[in] free_func Used to delete cell data contents, used by
 *        eina_matrixsparse_free(), eina_matrixsparse_size_set(),
 *        eina_matrixsparse_row_idx_clear(),
 *        eina_matrixsparse_column_idx_clear(),
 *        eina_matrixsparse_cell_idx_clear() and possible others.
 * @param[in] user_data Given to @a free_func as first parameter.
 *
 * @return Newly allocated matrix, or @c NULL if allocation failed.
  }
(* Const before type ignored *)

function eina_matrixsparse_new(rows:dword; cols:dword; free_func:procedure (user_data:pointer; cell_data:pointer); user_data:pointer):PEina_Matrixsparse;cdecl;external;
{*
 * @brief Frees resources allocated for a Sparse Matrix.
 *
 * @param[in] m The Sparse Matrix instance to free; must @b not be @c NULL.
  }
procedure eina_matrixsparse_free(m:PEina_Matrixsparse);cdecl;external;
{ size manipulation  }
{*
 * @brief Gets the current size of a Sparse Matrix.
 *
 * The given parameters are guaranteed to be set if they're not @c NULL,
 * even if this function fails (i.e.: @a m is not a valid matrix instance).
 *
 * @param[in] m The sparse matrix to operate on.
 * @param[out] rows Returns the number of rows; may be @c NULL. If @a m
 *        is invalid, returned value is zero, otherwise it's a positive
 *        integer.
 * @param[out] cols Returns the number of columns; may be @c NULL. If @a m is
 *        invalid, returned value is zero, otherwise it's a positive integer.
  }
(* Const before type ignored *)
procedure eina_matrixsparse_size_get(m:PEina_Matrixsparse; rows:Pdword; cols:Pdword);cdecl;external;
{*
 * @brief Resizes the Sparse Matrix.
 *
 * This will resize the sparse matrix, potentially freeing cells on rows
 * and columns that will no longer exist.
 *
 * @param[in,out] m The sparse matrix to operate on.
 * @param[in] rows The new number of rows; must be greater than zero.
 * @param[in] cols The new number of columns; must be greater than zero.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * @warning Cells, rows or columns are not reference counted and thus
 *     references to freed instances may become invalid.
  }
function eina_matrixsparse_size_set(m:PEina_Matrixsparse; rows:dword; cols:dword):TEina_Bool;cdecl;external;
{ Data getting  }
{*
 * @brief Gets the cell reference inside the Sparse Matrix.
 *
 * @param[in] m The sparse matrix.
 * @param[in] row The new number of row to clear.
 * @param[in] col The new number of column to clear.
 * @param[out] cell Pointer to return cell reference, if any exists.
 *
 * @return @c 1 on success, @c 0 on failure. It is considered successful if did not
 *     exist but index is inside matrix size, in this case @c *cell == NULL
 *
 * @see eina_matrixsparse_cell_data_get()
 * @see eina_matrixsparse_data_idx_get()
  }
(* Const before type ignored *)
function eina_matrixsparse_cell_idx_get(m:PEina_Matrixsparse; row:dword; col:dword; cell:PPEina_Matrixsparse_Cell):TEina_Bool;cdecl;external;
{*
 * @brief Gets data associated with given cell reference.
 *
 * @param[in] cell Given cell reference, must @b not be @c NULL.
 *
 * @return Data associated with given cell.
 *
 * @see eina_matrixsparse_cell_idx_get()
 * @see eina_matrixsparse_data_idx_get()
  }
(* Const before type ignored *)
function eina_matrixsparse_cell_data_get(cell:PEina_Matrixsparse_Cell):pointer;cdecl;external;
{*
 * @brief Gets data associated with given cell given its indexes.
 *
 * @param[in] m The sparse matrix to operate on.
 * @param[in] row The row number.
 * @param[in] col The column number.
 *
 * @return Data associated with given cell or @c NULL if nothing is associated.
 *
 * @see eina_matrixsparse_cell_idx_get()
 * @see eina_matrixsparse_cell_data_get()
  }
(* Const before type ignored *)
function eina_matrixsparse_data_idx_get(m:PEina_Matrixsparse; row:dword; col:dword):pointer;cdecl;external;
{*
 * @brief Gets the row and column position of the given cell.
 *
 * @param[in] cell The cell reference; must @b not be @c NULL.
 * @param[out] row The returned row number; may be @c NULL.
 * @param[out] col The returned column number; may be @c NULL.
 *
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise (@c cell is @c NULL).
  }
(* Const before type ignored *)
function eina_matrixsparse_cell_position_get(cell:PEina_Matrixsparse_Cell; row:Pdword; col:Pdword):TEina_Bool;cdecl;external;
{ Data setting  }
{*
 * @brief Changes cell reference value without freeing the possibly existing old value.
 *
 * @param[in,out] cell The cell reference; must @b not be @c NULL.
 * @param[in] data New data to set.
 * @param[out] p_old Returns the old value intact (not freed).
 *
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise (@a cell is @c NULL).
 *
 * @see eina_matrixsparse_cell_data_set()
 * @see eina_matrixsparse_data_idx_replace()
  }
(* Const before type ignored *)
function eina_matrixsparse_cell_data_replace(cell:PEina_Matrixsparse_Cell; data:pointer; p_old:Ppointer):TEina_Bool;cdecl;external;
{*
 * @brief Changes cell value, freeing any previously existing value.
 *
 * @param[in,out] cell The cell reference; must @b not be @c NULL.
 * @param[in] data New data to set.
 *
 * In contrast to eina_matrixsparse_cell_data_replace(), this function will
 * call @c free_func() on the existing value, if one exists.
 *
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise (@a cell is @c NULL).
 *
 * @see eina_matrixsparse_cell_data_replace()
 * @see eina_matrixsparse_data_idx_set()
  }
(* Const before type ignored *)
function eina_matrixsparse_cell_data_set(cell:PEina_Matrixsparse_Cell; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Changes cell value at a given row and column position, without
 * freeing previously existing values.
 *
 * @param[in,out] m The sparse matrix; must @b not be @c NULL.
 * @param[in] row The row number.
 * @param[in] col The column number.
 * @param[in] data New data to set.
 * @param[out] p_old The previous value, returned intact (not freed).
 *
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise (@a m is @c NULL,
 * or row, column indexes are not valid).
 *
 * @see eina_matrixsparse_cell_data_replace()
 * @see eina_matrixsparse_data_idx_set()
  }
(* Const before type ignored *)
function eina_matrixsparse_data_idx_replace(m:PEina_Matrixsparse; row:dword; col:dword; data:pointer; p_old:Ppointer):TEina_Bool;cdecl;external;
{*
 * @brief Changes cell value at a given row and column position, freeing
 * any previously existing value.
 *
 * @param[in,out] m The sparse matrix, must @b not be @c NULL.
 * @param[in] row The row number to set the value.
 * @param[in] col The column number to set the value.
 * @param[in] data New data to set.
 *
 * In contrast to eina_matrixsparse_data_idx_replace(), this function will
 * call @c free_func() on the existing value, if one exists.
 *
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise (@a m is @c NULL, indexes are not valid).
 *
 * @see eina_matrixsparse_cell_data_replace()
  }
(* Const before type ignored *)
function eina_matrixsparse_data_idx_set(m:PEina_Matrixsparse; row:dword; col:dword; data:pointer):TEina_Bool;cdecl;external;
{ data deleting  }
{*
 * @brief Clears (erases all cells) of a given row number.
 *
 * @param[in,out] m The sparse matrix to operate on.
 * @param[in] row The row number to clear.
 *
 * Existing cells will be cleared with @c free_func() given to
 * eina_matrixsparse_new().
 *
 * @return #EINA_TRUE on success, #EINA_FALSE on failure (such as
 *     requesting a row outside the matrix's defined size). It is
 *     considered successful if the row had no cells filled.
 *
 * @warning Cells, rows or columns are not reference counted and thus
 *     references to freed instances may become invalid.
  }
function eina_matrixsparse_row_idx_clear(m:PEina_Matrixsparse; row:dword):TEina_Bool;cdecl;external;
{*
 * @brief Clears (erases all cells) of column given its index.
 *
 * Existing cells will be cleared with @c free_func() given to
 * eina_matrixsparse_new().
 *
 * @param[in,out] m The sparse matrix to operate on.
 * @param[in] col The column number to clear.
 *
 * @return #EINA_TRUE on success, #EINA_FALSE on failure (such as
 *     requesting a column outside the matrix's defined size). It is
 *     considered successful if the column had no cells filled.
 *
 * @warning Cells, rows or columns are not reference counted and thus
 *     references to freed instances may become invalid.
  }
function eina_matrixsparse_column_idx_clear(m:PEina_Matrixsparse; col:dword):TEina_Bool;cdecl;external;
{*
 * @brief Clears (erases) cell at a given row, column position.
 *
 * Existing cell will be cleared with the @c free_func() given to
 * eina_matrixsparse_new().
 *
 * @param[in,out] m The sparse matrix to operate on.
 * @param[in] row The row number.
 * @param[in] col The column number.
 *
 * @return #EINA_TRUE on success, #EINA_FALSE on failure (such as
 *     requesting a row or column outside the matrix's defined size). It
 *     is considered successful if no cell existed at the otherwise
 *     valid position.
 *
 * @warning Cells, rows or columns are not reference counted and thus
 *     references to freed instances may become invalid.
 *
 * @note This call might also free the column and/or row if this was the
 * last remaining cell contained.
  }
function eina_matrixsparse_cell_idx_clear(m:PEina_Matrixsparse; row:dword; col:dword):TEina_Bool;cdecl;external;
{*
 * @brief Clears (erases) cell given its reference.
 *
 * @param[in,out] cell The cell reference; must @b not be @c NULL.
 *
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * @warning Cells, rows or columns are not reference counted and thus
 *     references to freed instances may become invalid.
 *
 * @note This call might also free the column and/or row if this was the
 * last remaining cell contained.
  }
function eina_matrixsparse_cell_clear(cell:PEina_Matrixsparse_Cell):TEina_Bool;cdecl;external;
{ Iterators  }
{*
 * @brief Creates a new iterator over only the existing matrix cells.
 *
 * This is a quick walk over the defined cells; the holes in the Sparse
 * Matrix are skipped over, thus the returned entries will not have
 * consecutive index numbers.
 *
 * The iterator's data element will be the current cell reference.  This
 * cell's position and value can be retrieved with
 * eina_matrixsparse_cell_position_get() and
 * eina_matrixsparse_cell_data_get().
 *
 * @param[in] m The Sparse Matrix reference; must @b not be @c NULL.
 * @return A new iterator.
 *
 * @warning If the matrix structure changes then the iterator becomes
 *    invalid! That is, if you add or remove cells this iterator
 *    behavior is undefined and your program may crash!
  }
(* Const before type ignored *)
function eina_matrixsparse_iterator_new(m:PEina_Matrixsparse):PEina_Iterator;cdecl;external;
{*
 * @brief Creates a new iterator over all matrix cells.
 *
 * In contrast to eina_matrixsparse_iterator_new(), this routine iterates
 * across all row and column positions in the matrix, returning dummy cells
 * with no data where there are empty holes.
 *
 * Be aware that since this iterates over all potential elements of a
 * Sparse Matrix, not just the elements with actual data, this can result
 * in a very large number of function calls.
 *
 * The iterator's data element will be the current cell reference.  This
 * cell's position and value can be retrieved with
 * eina_matrixsparse_cell_position_get() and
 * eina_matrixsparse_cell_data_get().  If the cell is empty then the
 * reference will be a dummy/placeholder, thus setting value with
 * eina_matrixsparse_cell_data_set() will leave the pointer
 * unreferenced.
 *
 * @param[in] m The Sparse Matrix reference; must @b not be @c NULL.
 * @return A new iterator.
 *
 * @warning If the matrix structure changes then the iterator becomes
 *    invalid! That is, if you add or remove cells this iterator
 *    behavior is undefined and your program may crash!
  }
(* Const before type ignored *)
function eina_matrixsparse_iterator_complete_new(m:PEina_Matrixsparse):PEina_Iterator;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_MATRIXSPARSE_H_  }

implementation


end.
