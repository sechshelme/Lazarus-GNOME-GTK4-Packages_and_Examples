{$IFDEF read_interface}


function json_gvariant_serialize(variant: PGVariant): PJsonNode; cdecl; external libjsonglib;
function json_gvariant_serialize_data(variant: PGVariant; length: Pgsize): Pgchar; cdecl; external libjsonglib;
function json_gvariant_deserialize(json_node: PJsonNode; signature: Pgchar; error: PPGError): PGVariant; cdecl; external libjsonglib;
function json_gvariant_deserialize_data(json: Pgchar; length: Tgssize; signature: Pgchar; error: PPGError): PGVariant; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:26:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
