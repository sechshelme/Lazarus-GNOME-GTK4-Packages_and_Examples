unit evas_table_eo_legacy;

interface

uses
  ctypes, elf, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Table = ^TEvas_Table;
  TEvas_Table = TEo;

type
  PEvas_Object_Table_Homogeneous_Mode = ^TEvas_Object_Table_Homogeneous_Mode;
  TEvas_Object_Table_Homogeneous_Mode = longint;

const
  EVAS_OBJECT_TABLE_HOMOGENEOUS_NONE = 0;
  EVAS_OBJECT_TABLE_HOMOGENEOUS_TABLE = 1;
  EVAS_OBJECT_TABLE_HOMOGENEOUS_ITEM = 2;

procedure evas_object_table_homogeneous_set(obj: PEvas_Table; homogeneous: TEvas_Object_Table_Homogeneous_Mode); cdecl; external libevas;
function evas_object_table_homogeneous_get(obj: PEvas_Table): TEvas_Object_Table_Homogeneous_Mode; cdecl; external libevas;
procedure evas_object_table_align_set(obj: PEvas_Table; horizontal: double; vertical: double); cdecl; external libevas;
procedure evas_object_table_align_get(obj: PEvas_Table; horizontal: Pdouble; vertical: Pdouble); cdecl; external libevas;
procedure evas_object_table_padding_set(obj: PEvas_Table; horizontal: longint; vertical: longint); cdecl; external libevas;
procedure evas_object_table_padding_get(obj: PEvas_Table; horizontal: Plongint; vertical: Plongint); cdecl; external libevas;
procedure evas_object_table_col_row_size_get(obj: PEvas_Table; cols: Plongint; rows: Plongint); cdecl; external libevas;
function evas_object_table_children_get(obj: PEvas_Table): PEina_List; cdecl; external libevas;
function evas_object_table_child_get(obj: PEvas_Table; col: word; row: word): PEfl_Canvas_Object; cdecl; external libevas;
procedure evas_object_table_clear(obj: PEvas_Table; clear: TEina_Bool); cdecl; external libevas;
function evas_object_table_accessor_new(obj: PEvas_Table): PEina_Accessor; cdecl; external libevas;
function evas_object_table_iterator_new(obj: PEvas_Table): PEina_Iterator; cdecl; external libevas;
function evas_object_table_add_to(obj: PEvas_Table): PEfl_Canvas_Object; cdecl; external libevas;
function evas_object_table_pack_get(obj: PEvas_Table; child: PEfl_Canvas_Object; col: Pword; row: Pword; colspan: Pword; rowspan: Pword): TEina_Bool; cdecl; external libevas;
function evas_object_table_pack(obj: PEvas_Table; child: PEfl_Canvas_Object; col: word; row: word; colspan: word; rowspan: word): TEina_Bool; cdecl; external libevas;
function evas_object_table_unpack(obj: PEvas_Table; child: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 13-5-25 16:50:32 ===


implementation



end.
