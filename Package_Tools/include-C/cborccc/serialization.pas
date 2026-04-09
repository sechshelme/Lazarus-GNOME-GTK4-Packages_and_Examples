unit serialization;

interface

uses
  fp_cbor, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cbor_serialize(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialized_size(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_alloc(item: Pcbor_item_t; buffer: PPbyte; buffer_size: Psize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_uint(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_negint(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_bytestring(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_string(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_array(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_map(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_tag(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_serialize_float_ctrl(item: Pcbor_item_t; buffer: Tcbor_mutable_data; buffer_size: Tsize_t): Tsize_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:44 ===


implementation



end.
