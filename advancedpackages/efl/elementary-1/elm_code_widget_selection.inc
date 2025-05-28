{$IFDEF read_interface}


procedure elm_code_widget_selection_start(widget: PEvas_Object; line: dword; col: dword); cdecl; external libelementary;
procedure elm_code_widget_selection_end(widget: PEvas_Object; line: dword; col: dword); cdecl; external libelementary;
procedure elm_code_widget_selection_clear(widget: PEvas_Object); cdecl; external libelementary;
procedure elm_code_widget_selection_delete(widget: PEvas_Object); cdecl; external libelementary;
procedure elm_code_widget_selection_select_line(widget: PEvas_Object; line: dword); cdecl; external libelementary;
procedure elm_code_widget_selection_select_word(widget: PEvas_Object; line: dword; col: dword); cdecl; external libelementary;
function elm_code_widget_selection_text_get(widget: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_code_widget_selection_cut(widget: PEvas_Object); cdecl; external libelementary;
procedure elm_code_widget_selection_copy(widget: PEvas_Object); cdecl; external libelementary;
procedure elm_code_widget_selection_paste(widget: PEvas_Object); cdecl; external libelementary;
function elm_code_widget_selection_is_empty(widget: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_code_widget_selection_select_all(widget: PEvas_Object); cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:44:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
