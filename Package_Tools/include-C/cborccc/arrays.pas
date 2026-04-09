unit arrays;

interface

uses
  fp_cbor, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cbor_array_size(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_array_allocated(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_array_get(item: Pcbor_item_t; index: Tsize_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_array_set(item: Pcbor_item_t; index: Tsize_t; value: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_array_replace(item: Pcbor_item_t; index: Tsize_t; value: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_array_is_definite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_array_is_indefinite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_array_handle(item: Pcbor_item_t): PPcbor_item_t; cdecl; external libcbor;
function cbor_new_definite_array(size: Tsize_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_new_indefinite_array: Pcbor_item_t; cdecl; external libcbor;
function cbor_array_push(arr: Pcbor_item_t; pushee: Pcbor_item_t): Tbool; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:13 ===


implementation



end.
