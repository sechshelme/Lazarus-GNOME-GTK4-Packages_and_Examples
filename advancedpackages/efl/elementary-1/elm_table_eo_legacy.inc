{$IFDEF read_interface}


type
  PElm_Table = ^TElm_Table;
  TElm_Table = TEo;

procedure elm_table_homogeneous_set(obj: PElm_Table; homogeneous: TEina_Bool); cdecl; external libelementary;
function elm_table_homogeneous_get(obj: PElm_Table): TEina_Bool; cdecl; external libelementary;
procedure elm_table_padding_set(obj: PElm_Table; horizontal: longint; vertical: longint); cdecl; external libelementary;
procedure elm_table_padding_get(obj: PElm_Table; horizontal: Plongint; vertical: Plongint); cdecl; external libelementary;
procedure elm_table_align_set(obj: PElm_Table; horizontal: double; vertical: double); cdecl; external libelementary;
procedure elm_table_align_get(obj: PElm_Table; horizontal: Pdouble; vertical: Pdouble); cdecl; external libelementary;
procedure elm_table_clear(obj: PElm_Table; clear: TEina_Bool); cdecl; external libelementary;
function elm_table_child_get(obj: PElm_Table; col: longint; row: longint): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_table_unpack(obj: PElm_Table; subobj: PEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_table_pack(obj: PElm_Table; subobj: PEfl_Canvas_Object; column: longint; row: longint; colspan: longint;
  rowspan: longint); cdecl; external libelementary;

// === Konventiert am: 30-5-25 14:00:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
