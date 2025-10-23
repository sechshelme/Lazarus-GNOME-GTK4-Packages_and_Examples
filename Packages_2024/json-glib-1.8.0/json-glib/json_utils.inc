{$IFDEF read_interface}



function json_from_string(str: pchar; error: PPGError): PJsonNode; cdecl; external libjsonglib;
function json_to_string(node: PJsonNode; pretty: Tgboolean): pchar; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:27:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
