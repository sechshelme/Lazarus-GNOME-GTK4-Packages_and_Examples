{$IFDEF read_interface}


function cbor_new_tag(value: Tuint64_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_tag_item(item: Pcbor_item_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_tag_value(item: Pcbor_item_t): Tuint64_t; cdecl; external libcbor;
procedure cbor_tag_set_item(item: Pcbor_item_t; tagged_item: Pcbor_item_t); cdecl; external libcbor;
function cbor_build_tag(value: Tuint64_t; item: Pcbor_item_t): Pcbor_item_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
