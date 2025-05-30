{$IFDEF read_interface}


procedure elm_radio_state_value_set(obj: PEfl_Ui_Radio; value: longint); cdecl; external libelementary;
function elm_radio_state_value_get(obj: PEfl_Ui_Radio): longint; cdecl; external libelementary;
procedure elm_radio_value_pointer_set(obj: PEfl_Ui_Radio; valuep: Plongint); cdecl; external libelementary;
function elm_radio_selected_object_get(obj: PEfl_Ui_Radio): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_radio_group_add(obj: PEfl_Ui_Radio; group: PEfl_Ui_Radio); cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:52:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
