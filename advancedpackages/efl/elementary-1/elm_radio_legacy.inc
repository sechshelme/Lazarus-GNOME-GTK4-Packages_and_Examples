{$IFDEF read_interface}


type
  PElm_Radio = ^TElm_Radio;
  TElm_Radio = TEo;

function elm_radio_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_radio_value_set(obj: PEvas_Object; value: longint); cdecl; external libelementary;
function elm_radio_value_get(obj: PEvas_Object): longint; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:01:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
