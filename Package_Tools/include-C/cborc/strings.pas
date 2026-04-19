unit strings;

interface

uses
  fp_cbor, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cbor_string_length(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_string_codepoint_count(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_string_is_definite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_string_is_indefinite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_string_handle(item: Pcbor_item_t): Tcbor_mutable_data; cdecl; external libcbor;
procedure cbor_string_set_handle(item: Pcbor_item_t; data: Tcbor_mutable_data; length: Tsize_t); cdecl; external libcbor;
function cbor_string_chunks_handle(item: Pcbor_item_t): PPcbor_item_t; cdecl; external libcbor;
function cbor_string_chunk_count(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_string_add_chunk(item: Pcbor_item_t; chunk: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_new_definite_string: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_indefinite_string: Pcbor_item_t; cdecl; external libcbor;
function cbor_build_string(val: pchar): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_stringn(val: pchar; length: Tsize_t): Pcbor_item_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:49 ===


implementation



end.
