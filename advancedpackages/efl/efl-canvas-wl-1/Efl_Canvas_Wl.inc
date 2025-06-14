{$IFDEF read_interface}


type
  TEfl_Canvas_Wl_Wl_Surface = record
  end;
  PEfl_Canvas_Wl_Wl_Surface = ^TEfl_Canvas_Wl_Wl_Surface;

  TEfl_Canvas_Wl_Wl_Global = record
  end;
  PEfl_Canvas_Wl_Wl_Global = ^TEfl_Canvas_Wl_Wl_Global;

  TEfl_Canvas_Wl_Wl_Interface = record
  end;
  PEfl_Canvas_Wl_Wl_Interface = ^TEfl_Canvas_Wl_Wl_Interface;

  TEfl_Canvas_Wl_Wl_Array = record
  end;
  PEfl_Canvas_Wl_Wl_Array = ^TEfl_Canvas_Wl_Wl_Array;
  PEfl_Canvas_Wl_Wl_Interface_Data = ^TEfl_Canvas_Wl_Wl_Interface_Data;
  TEfl_Canvas_Wl_Wl_Interface_Data = pointer;

  PEfl_Canvas_Wl_Wl_Interface_Bind_Cb = ^TEfl_Canvas_Wl_Wl_Interface_Bind_Cb;
  TEfl_Canvas_Wl_Wl_Interface_Bind_Cb = pointer;

type
  TEfl_Canvas_Wl_Xkb_State = record
  end;
  PEfl_Canvas_Wl_Xkb_State = ^TEfl_Canvas_Wl_Xkb_State;

function efl_canvas_wl_extracted_surface_object_find(surface_resource: pointer): PEvas_Object; cdecl; external libefl_canvas_wl;

// === Konventiert am: 14-6-25 16:27:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
