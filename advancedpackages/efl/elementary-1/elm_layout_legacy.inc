{$IFDEF read_interface}


type
  TElm_Layout_Part_Alias_Description = record
    alias: pchar;
    real_part: pchar;
  end;
  PElm_Layout_Part_Alias_Description = ^TElm_Layout_Part_Alias_Description;


  PElm_Layout = ^TElm_Layout;
  TElm_Layout = TEo;

function elm_layout_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_layout_theme_set(obj: PEvas_Object; klass: pchar; group: pchar; style: pchar): TEina_Bool; cdecl; external libelementary;
function elm_layout_data_get(obj: PEvas_Object; key: pchar): pchar; cdecl; external libelementary;
procedure elm_layout_sizing_eval(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_layout_sizing_restricted_eval(obj: PEvas_Object; width: TEina_Bool; height: TEina_Bool); cdecl; external libelementary;
procedure elm_layout_signal_callback_add(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb; data: pointer); cdecl; external libelementary;
function elm_layout_signal_callback_del(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb): pointer; cdecl; external libelementary;
procedure elm_layout_signal_emit(obj: PEvas_Object; emission: pchar; source: pchar); cdecl; external libelementary;
function elm_layout_edje_get(obj: PEvas_Object): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_layout_content_swallow_list_get(obj: PEvas_Object): PEina_List; cdecl; external libelementary;
function elm_layout_content_set(obj: PEvas_Object; swallow: pchar; content: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_layout_content_get(obj: PEvas_Object; swallow: pchar): PEvas_Object; cdecl; external libelementary;
function elm_layout_content_unset(obj: PEvas_Object; swallow: pchar): PEvas_Object; cdecl; external libelementary;
function elm_layout_file_set(obj: PEo; file_: pchar; group: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_layout_file_get(obj: PEo; file_: PPchar; group: PPchar); cdecl; external libelementary;
function elm_layout_mmap_set(obj: PEo; file_: PEina_File; group: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_layout_mmap_get(obj: PEo; file_: PPEina_File; group: PPchar); cdecl; external libelementary;
function elm_layout_freeze(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_layout_thaw(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_layout_box_append(obj: PEvas_Object; part: pchar; child: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_layout_box_prepend(obj: PEvas_Object; part: pchar; child: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_layout_box_insert_before(obj: PEvas_Object; part: pchar; child: PEvas_Object; reference: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_layout_box_insert_at(obj: PEvas_Object; part: pchar; child: PEvas_Object; pos: dword): TEina_Bool; cdecl; external libelementary;
function elm_layout_box_remove(obj: PEvas_Object; part: pchar; child: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_layout_box_remove_all(obj: PEvas_Object; part: pchar; clear: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_layout_table_pack(obj: PEvas_Object; part: pchar; child: PEvas_Object; col: word; row: word; colspan: word; rowspan: word): TEina_Bool; cdecl; external libelementary;
function elm_layout_table_unpack(obj: PEvas_Object; part: pchar; child: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_layout_table_clear(obj: PEvas_Object; part: pchar; clear: TEina_Bool): TEina_Bool; cdecl; external libelementary;
//function elm_layout_data_get(obj: PEvas_Object; key: pchar): pchar; cdecl; external libelementary;
// Doppelt im C-Header
//procedure elm_layout_signal_emit(obj: PEvas_Object; emission: pchar; source: pchar); cdecl; external libelementary;
//procedure elm_layout_signal_callback_add(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb; data: pointer); cdecl; external libelementary;
//function elm_layout_signal_callback_del(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb): pointer; cdecl; external libelementary;
//function elm_layout_freeze(obj: PEvas_Object): longint; cdecl; external libelementary;
//function elm_layout_thaw(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_layout_text_set(obj: PEvas_Object; part: pchar; text: pchar): TEina_Bool; cdecl; external libelementary;
function elm_layout_text_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libelementary;
function elm_layout_edje_object_can_access_set(obj: PEvas_Object; can_access: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_layout_edje_object_can_access_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_layout_part_cursor_engine_only_set(obj: PEvas_Object; part_name: pchar; engine_only: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_layout_part_cursor_engine_only_get(obj: PEvas_Object; part_name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_layout_part_cursor_set(obj: PEvas_Object; part_name: pchar; cursor: pchar): TEina_Bool; cdecl; external libelementary;
function elm_layout_part_cursor_get(obj: PEvas_Object; part_name: pchar): pchar; cdecl; external libelementary;
function elm_layout_part_cursor_style_set(obj: PEvas_Object; part_name: pchar; style: pchar): TEina_Bool; cdecl; external libelementary;
function elm_layout_part_cursor_style_get(obj: PEvas_Object; part_name: pchar): pchar; cdecl; external libelementary;
function elm_layout_part_cursor_unset(obj: PEvas_Object; part_name: pchar): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 13:09:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
