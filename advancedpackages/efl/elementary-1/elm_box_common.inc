{$IFDEF read_interface}

type
  TElm_Box_Transition = record
  end;
  PElm_Box_Transition = ^TElm_Box_Transition;

procedure elm_box_layout_transition(obj: PEvas_Object; priv: PEvas_Object_Box_Data; data: pointer); cdecl; external libelementary;
function elm_box_transition_new(duration: double; start_layout: TEvas_Object_Box_Layout; start_layout_data: pointer; start_layout_free_data: TEcore_Cb; end_layout: TEvas_Object_Box_Layout;
  end_layout_data: pointer; end_layout_free_data: TEcore_Cb; transition_end_cb: TEcore_Cb; transition_end_data: pointer): PElm_Box_Transition; cdecl; external libelementary;
procedure elm_box_transition_free(data: pointer); cdecl; external libelementary;

// === Konventiert am: 29-5-25 20:23:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
