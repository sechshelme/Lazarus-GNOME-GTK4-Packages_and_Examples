unit maps;

interface

uses
  fp_cbor, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cbor_map_size(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_map_allocated(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_new_definite_map(size: Tsize_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_new_indefinite_map: Pcbor_item_t; cdecl; external libcbor;
function cbor_map_add(item: Pcbor_item_t; pair: Tcbor_pair): Tbool; cdecl; external libcbor;
function _cbor_map_add_key(item: Pcbor_item_t; key: Pcbor_item_t): Tbool; cdecl; external libcbor;
function _cbor_map_add_value(item: Pcbor_item_t; value: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_map_is_definite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_map_is_indefinite(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_map_handle(item: Pcbor_item_t): Pcbor_pair; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:38 ===


implementation



end.
