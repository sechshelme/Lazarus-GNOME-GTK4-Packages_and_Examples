unit eina_matrixsparse;

interface

uses
  ctypes, efl, eina_types, eina_iterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Matrixsparse = record
  end;
  PEina_Matrixsparse = ^TEina_Matrixsparse;

  TEina_Matrixsparse_Cell = record
  end;
  PEina_Matrixsparse_Cell = ^TEina_Matrixsparse_Cell;
  PPEina_Matrixsparse_Cell = ^PEina_Matrixsparse_Cell;

  Tfree_func_proc = procedure(user_data: pointer; cell_data: pointer);

function eina_matrixsparse_new(rows: dword; cols: dword; free_func: Tfree_func_proc; user_data: pointer): PEina_Matrixsparse; cdecl; external libeina;
procedure eina_matrixsparse_free(m: PEina_Matrixsparse); cdecl; external libeina;
procedure eina_matrixsparse_size_get(m: PEina_Matrixsparse; rows: Pdword; cols: Pdword); cdecl; external libeina;
function eina_matrixsparse_size_set(m: PEina_Matrixsparse; rows: dword; cols: dword): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_cell_idx_get(m: PEina_Matrixsparse; row: dword; col: dword; cell: PPEina_Matrixsparse_Cell): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_cell_data_get(cell: PEina_Matrixsparse_Cell): pointer; cdecl; external libeina;
function eina_matrixsparse_data_idx_get(m: PEina_Matrixsparse; row: dword; col: dword): pointer; cdecl; external libeina;
function eina_matrixsparse_cell_position_get(cell: PEina_Matrixsparse_Cell; row: Pdword; col: Pdword): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_cell_data_replace(cell: PEina_Matrixsparse_Cell; data: pointer; p_old: Ppointer): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_cell_data_set(cell: PEina_Matrixsparse_Cell; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_data_idx_replace(m: PEina_Matrixsparse; row: dword; col: dword; data: pointer; p_old: Ppointer): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_data_idx_set(m: PEina_Matrixsparse; row: dword; col: dword; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_row_idx_clear(m: PEina_Matrixsparse; row: dword): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_column_idx_clear(m: PEina_Matrixsparse; col: dword): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_cell_idx_clear(m: PEina_Matrixsparse; row: dword; col: dword): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_cell_clear(cell: PEina_Matrixsparse_Cell): TEina_Bool; cdecl; external libeina;
function eina_matrixsparse_iterator_new(m: PEina_Matrixsparse): PEina_Iterator; cdecl; external libeina;
function eina_matrixsparse_iterator_complete_new(m: PEina_Matrixsparse): PEina_Iterator; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:12:58 ===


implementation



end.
