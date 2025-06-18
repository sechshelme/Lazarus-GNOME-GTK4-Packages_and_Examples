{$IFDEF read_interface}


type
  PEfl_Ui_Layout_Data = ^TEfl_Ui_Layout_Data;
  TEfl_Ui_Layout_Data = record
  end;

type
  TElm_Layout_Data = record
  end;
  PElm_Layout_Data = ^TElm_Layout_Data;

procedure _efl_ui_layout_subobjs_calc_set(obj: PEo; set_: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 29-5-25 19:47:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
