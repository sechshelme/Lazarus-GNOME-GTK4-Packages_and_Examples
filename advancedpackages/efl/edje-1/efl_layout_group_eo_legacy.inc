{$IFDEF read_interface}


// Doppelt im C-Header
//type
//  PEfl_Layout_Group = ^TEfl_Layout_Group;
//  TEfl_Layout_Group = TEo;

function edje_object_data_get(obj: PEfl_Layout_Group; key: pchar): pchar; cdecl; external libedje;

// === Konventiert am: 22-5-25 19:57:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
