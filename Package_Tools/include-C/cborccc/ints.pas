unit ints;

interface

uses
  fp_cbor, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cbor_get_uint8(item: Pcbor_item_t): Tuint8_t; cdecl; external libcbor;
function cbor_get_uint16(item: Pcbor_item_t): Tuint16_t; cdecl; external libcbor;
function cbor_get_uint32(item: Pcbor_item_t): Tuint32_t; cdecl; external libcbor;
function cbor_get_uint64(item: Pcbor_item_t): Tuint64_t; cdecl; external libcbor;
function cbor_get_int(item: Pcbor_item_t): Tuint64_t; cdecl; external libcbor;
procedure cbor_set_uint8(item: Pcbor_item_t; value: Tuint8_t); cdecl; external libcbor;
procedure cbor_set_uint16(item: Pcbor_item_t; value: Tuint16_t); cdecl; external libcbor;
procedure cbor_set_uint32(item: Pcbor_item_t; value: Tuint32_t); cdecl; external libcbor;
procedure cbor_set_uint64(item: Pcbor_item_t; value: Tuint64_t); cdecl; external libcbor;
function cbor_int_get_width(item: Pcbor_item_t): Tcbor_int_width; cdecl; external libcbor;
procedure cbor_mark_uint(item: Pcbor_item_t); cdecl; external libcbor;
procedure cbor_mark_negint(item: Pcbor_item_t); cdecl; external libcbor;
function cbor_new_int8: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_int16: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_int32: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_int64: Pcbor_item_t; cdecl; external libcbor;
function cbor_build_uint8(value: Tuint8_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_uint16(value: Tuint16_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_uint32(value: Tuint32_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_uint64(value: Tuint64_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_negint8(value: Tuint8_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_negint16(value: Tuint16_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_negint32(value: Tuint32_t): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_negint64(value: Tuint64_t): Pcbor_item_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:34 ===


implementation



end.
