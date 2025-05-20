{$IFDEF read_interface}


type
  PEfl_Pack_Table = ^TEfl_Pack_Table;
  TEfl_Pack_Table = TEo;

function EFL_PACK_TABLE_INTERFACE: PEfl_Class;

function efl_pack_table_interface_get: PEfl_Class; cdecl; external libefl;
function efl_pack_table(obj: PEo; subobj: PEfl_Gfx_Entity; col: longint; row: longint; colspan: longint; rowspan: longint): TEina_Bool; cdecl; external libefl;
function efl_pack_table_contents_get(obj: PEo; col: longint; row: longint; below: TEina_Bool): PEina_Iterator; cdecl; external libefl;
function efl_pack_table_content_get(obj: PEo; col: longint; row: longint): PEfl_Gfx_Entity; cdecl; external libefl;
procedure efl_pack_table_cell_column_set(obj: PEo; subobj: PEfl_Gfx_Entity; col: longint; colspan: longint); cdecl; external libefl;
function efl_pack_table_cell_column_get(obj: PEo; subobj: PEfl_Gfx_Entity; col: Plongint; colspan: Plongint): TEina_Bool; cdecl; external libefl;
procedure efl_pack_table_cell_row_set(obj: PEo; subobj: PEfl_Gfx_Entity; row: longint; rowspan: longint); cdecl; external libefl;
function efl_pack_table_cell_row_get(obj: PEo; subobj: PEfl_Gfx_Entity; row: Plongint; rowspan: Plongint): TEina_Bool; cdecl; external libefl;
procedure efl_pack_table_size_set(obj: PEo; cols: longint; rows: longint); cdecl; external libefl;
procedure efl_pack_table_size_get(obj: PEo; cols: Plongint; rows: Plongint); cdecl; external libefl;
procedure efl_pack_table_columns_set(obj: PEo; cols: longint); cdecl; external libefl;
function efl_pack_table_columns_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_pack_table_rows_set(obj: PEo; rows: longint); cdecl; external libefl;
function efl_pack_table_rows_get(obj: PEo): longint; cdecl; external libefl;

// === Konventiert am: 19-5-25 19:44:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_PACK_TABLE_INTERFACE: PEfl_Class;
begin
  EFL_PACK_TABLE_INTERFACE := efl_pack_table_interface_get;
end;


{$ENDIF read_implementation}
