{$IFDEF read_interface}


function cbor_bytestring_length(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_bytestring_is_definite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_bytestring_is_indefinite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_bytestring_handle(item: Pcbor_item_t): Tcbor_mutable_data; cdecl; external libcbor;
procedure cbor_bytestring_set_handle(item: Pcbor_item_t; data: Tcbor_mutable_data; length: Tsize_t); cdecl; external libcbor;
function cbor_bytestring_chunks_handle(item: Pcbor_item_t): PPcbor_item_t; cdecl; external libcbor;
function cbor_bytestring_chunk_count(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_bytestring_add_chunk(item: Pcbor_item_t; chunk: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_new_definite_bytestring: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_indefinite_bytestring: Pcbor_item_t; cdecl; external libcbor;
function cbor_build_bytestring(handle: Tcbor_data; length: Tsize_t): Pcbor_item_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
