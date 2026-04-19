unit common;

interface

uses
  fp_cbor, configuration, data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  cbor_major_version = CBOR_MAJOR_VERSION;
  cbor_minor_version = CBOR_MINOR_VERSION;
  cbor_patch_version = CBOR_PATCH_VERSION;

type
  Tcbor_malloc_t = function(para1: Tsize_t): pointer; cdecl;
  Tcbor_realloc_t = function(para1: pointer; para2: Tsize_t): pointer; cdecl;
  Tcbor_free_t = procedure(para1: pointer); cdecl;

procedure cbor_set_allocs(custom_malloc: Tcbor_malloc_t; custom_realloc: Tcbor_realloc_t; custom_free: Tcbor_free_t); cdecl; external libcbor;
function cbor_typeof(item: Pcbor_item_t): Tcbor_type; cdecl; external libcbor;
function cbor_isa_uint(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_negint(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_bytestring(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_string(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_array(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_map(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_tag(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_isa_float_ctrl(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_is_int(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_is_float(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_is_bool(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_is_null(item: Pcbor_item_t): Tbool; cdecl; external libcbor;
function cbor_is_undef(item: Pcbor_item_t): Tbool; cdecl; external libcbor;

function cbor_incref(item: Pcbor_item_t): Pcbor_item_t; cdecl; external libcbor;
procedure cbor_decref(item: PPcbor_item_t); cdecl; external libcbor;
procedure cbor_intermediate_decref(item: Pcbor_item_t); cdecl; external libcbor;
function cbor_refcount(item: Pcbor_item_t): Tsize_t; cdecl; external libcbor;
function cbor_move(item: Pcbor_item_t): Pcbor_item_t; cdecl; external libcbor;

// === Konventiert am: 9-4-26 17:15:22 ===


implementation



end.
