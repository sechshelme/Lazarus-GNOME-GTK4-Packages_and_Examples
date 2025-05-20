{$IFDEF read_interface}

type
  PEfl_Canvas_Group = ^TEfl_Canvas_Group;
  TEfl_Canvas_Group = TEo;

procedure evas_object_smart_need_recalculate_set(obj: PEfl_Canvas_Group; value: TEina_Bool); cdecl; external libevas;
function evas_object_smart_need_recalculate_get(obj: PEfl_Canvas_Group): TEina_Bool; cdecl; external libevas;
procedure evas_object_smart_changed(obj: PEfl_Canvas_Group); cdecl; external libevas;
procedure evas_object_smart_calculate(obj: PEfl_Canvas_Group); cdecl; external libevas;
function evas_object_smart_iterator_new(obj: PEfl_Canvas_Group): PEina_Iterator; cdecl; external libevas;

// === Konventiert am: 14-5-25 15:08:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
