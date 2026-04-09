{$IFDEF read_interface}



function cbor_load(source: Tcbor_data; source_size: Tsize_t; result: Pcbor_load_result): Pcbor_item_t; cdecl; external libcbor;
function cbor_copy(item: Pcbor_item_t): Pcbor_item_t; cdecl; external libcbor;
procedure cbor_describe(item: Pcbor_item_t; out_: PFILE); cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:39:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
