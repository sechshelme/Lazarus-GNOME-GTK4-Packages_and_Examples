{$IFDEF read_interface}


type
  PEfl_Canvas_Event_Grabber = ^TEfl_Canvas_Event_Grabber;
  TEfl_Canvas_Event_Grabber = TEo;

procedure evas_object_event_grabber_freeze_when_visible_set(obj: PEfl_Canvas_Event_Grabber; set_: TEina_Bool); cdecl; external libevas;
function evas_object_event_grabber_freeze_when_visible_get(obj: PEfl_Canvas_Event_Grabber): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 14-5-25 15:27:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
