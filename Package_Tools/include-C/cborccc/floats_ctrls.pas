unit floats_ctrls;

interface

uses
  fp_cbor, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cbor_float_ctrl_is_ctrl(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_float_get_width(item: Pcbor_item_t): Tcbor_float_width; cdecl; external libcbor;
function cbor_float_get_float2(item: Pcbor_item_t): single; cdecl; external libcbor;
function cbor_float_get_float4(item: Pcbor_item_t): single; cdecl; external libcbor;
function cbor_float_get_float8(item: Pcbor_item_t): double; cdecl; external libcbor;
function cbor_float_get_float(item: Pcbor_item_t): double; cdecl; external libcbor;
function cbor_get_bool(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_new_ctrl: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_float2: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_float4: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_float8: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_null: Pcbor_item_t; cdecl; external libcbor;
function cbor_new_undef: Pcbor_item_t; cdecl; external libcbor;
function cbor_build_bool(value: Tbool): Pcbor_item_t; cdecl; external libcbor;
procedure cbor_set_ctrl(item: Pcbor_item_t; value: Tuint8_t); cdecl; external libcbor;
procedure cbor_set_bool(item: Pcbor_item_t; value: Tbool); cdecl; external libcbor;
procedure cbor_set_float2(item: Pcbor_item_t; value: single); cdecl; external libcbor;
procedure cbor_set_float4(item: Pcbor_item_t; value: single); cdecl; external libcbor;
procedure cbor_set_float8(item: Pcbor_item_t; value: double); cdecl; external libcbor;
function cbor_ctrl_value(item: Pcbor_item_t): Tuint8_t; cdecl; external libcbor;
function cbor_build_float2(value: single): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_float4(value: single): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_float8(value: double): Pcbor_item_t; cdecl; external libcbor;
function cbor_build_ctrl(value: Tuint8_t): Pcbor_item_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:32 ===


implementation



end.
