{$IFDEF read_interface}


type
  PElm_Plug = ^TElm_Plug;
  TElm_Plug = TEo;

function elm_plug_image_object_get(obj: PElm_Plug): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_plug_connect(obj: PElm_Plug; svcname: pchar; svcnum: longint; svcsys: TEina_Bool): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:00:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
