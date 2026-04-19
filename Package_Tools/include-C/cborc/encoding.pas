unit encoding;

interface

uses
  fp_cbor;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function cbor_encode_uint8(para1: Tuint8_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_uint16(para1: Tuint16_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_uint32(para1: Tuint32_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_uint64(para1: Tuint64_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_uint(para1: Tuint64_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_negint8(para1: Tuint8_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_negint16(para1: Tuint16_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_negint32(para1: Tuint32_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_negint64(para1: Tuint64_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_negint(para1: Tuint64_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_bytestring_start(para1: Tsize_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_indef_bytestring_start(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_string_start(para1: Tsize_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_indef_string_start(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_array_start(para1: Tsize_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_indef_array_start(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_map_start(para1: Tsize_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_indef_map_start(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_tag(para1: Tuint64_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_bool(para1: Tbool; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_null(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_undef(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_half(para1: single; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_single(para1: single; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_double(para1: double; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_break(para1: pbyte; para2: Tsize_t): Tsize_t; cdecl; external libcbor;
function cbor_encode_ctrl(para1: Tuint8_t; para2: pbyte; para3: Tsize_t): Tsize_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:29 ===


implementation



end.
