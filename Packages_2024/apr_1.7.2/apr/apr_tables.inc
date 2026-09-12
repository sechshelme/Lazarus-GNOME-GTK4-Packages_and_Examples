{$IFDEF read_interface}

type
  Papr_table_t = type Pointer;

  PPapr_array_header_t = ^Papr_array_header_t;
  Papr_array_header_t = ^Tapr_array_header_t;
  Tapr_array_header_t = record
    pool: Papr_pool_t;
    elt_size: longint;
    nelts: longint;
    nalloc: longint;
    elts: pchar;
  end;

  Papr_table_entry_t = ^Tapr_table_entry_t;
  Tapr_table_entry_t = record
    key: pchar;
    val: pchar;
    key_checksum: Tapr_uint32_t;
  end;

function apr_table_elts(t: Papr_table_t): Papr_array_header_t; cdecl; external libapr;
function apr_is_empty_table(t: Papr_table_t): longint; cdecl; external libapr;
function apr_is_empty_array(a: Papr_array_header_t): longint; cdecl; external libapr;
function apr_array_make(p: Papr_pool_t; nelts: longint; elt_size: longint): Papr_array_header_t; cdecl; external libapr;
function apr_array_push(arr: Papr_array_header_t): pointer; cdecl; external libapr;
function apr_array_pop(arr: Papr_array_header_t): pointer; cdecl; external libapr;
procedure apr_array_clear(arr: Papr_array_header_t); cdecl; external libapr;
procedure apr_array_cat(dst: Papr_array_header_t; src: Papr_array_header_t); cdecl; external libapr;
function apr_array_copy(p: Papr_pool_t; arr: Papr_array_header_t): Papr_array_header_t; cdecl; external libapr;
function apr_array_copy_hdr(p: Papr_pool_t; arr: Papr_array_header_t): Papr_array_header_t; cdecl; external libapr;
function apr_array_append(p: Papr_pool_t; first: Papr_array_header_t; second: Papr_array_header_t): Papr_array_header_t; cdecl; external libapr;
function apr_array_pstrcat(p: Papr_pool_t; arr: Papr_array_header_t; sep: char): pchar; cdecl; external libapr;
function apr_table_make(p: Papr_pool_t; nelts: longint): Papr_table_t; cdecl; external libapr;
function apr_table_copy(p: Papr_pool_t; t: Papr_table_t): Papr_table_t; cdecl; external libapr;
function apr_table_clone(p: Papr_pool_t; t: Papr_table_t): Papr_table_t; cdecl; external libapr;
procedure apr_table_clear(t: Papr_table_t); cdecl; external libapr;
function apr_table_get(t: Papr_table_t; key: pchar): pchar; cdecl; external libapr;
function apr_table_getm(p: Papr_pool_t; t: Papr_table_t; key: pchar): pchar; cdecl; external libapr;
procedure apr_table_set(t: Papr_table_t; key: pchar; val: pchar); cdecl; external libapr;
procedure apr_table_setn(t: Papr_table_t; key: pchar; val: pchar); cdecl; external libapr;
procedure apr_table_unset(t: Papr_table_t; key: pchar); cdecl; external libapr;
procedure apr_table_merge(t: Papr_table_t; key: pchar; val: pchar); cdecl; external libapr;
procedure apr_table_mergen(t: Papr_table_t; key: pchar; val: pchar); cdecl; external libapr;
procedure apr_table_add(t: Papr_table_t; key: pchar; val: pchar); cdecl; external libapr;
procedure apr_table_addn(t: Papr_table_t; key: pchar; val: pchar); cdecl; external libapr;
function apr_table_overlay(p: Papr_pool_t; overlay: Papr_table_t; base: Papr_table_t): Papr_table_t; cdecl; external libapr;

type
  Tapr_table_do_callback_fn_t = function(rec: Pointer; key: pchar; value: pchar): longint; cdecl;

function apr_table_do(comp: Tapr_table_do_callback_fn_t; rec: pointer; t: Papr_table_t): longint; cdecl; varargs; external libapr;
function apr_table_vdo(comp: Tapr_table_do_callback_fn_t; rec: pointer; t: Papr_table_t; vp: Tva_list): longint; cdecl; external libapr;

const
  APR_OVERLAP_TABLES_SET = 0;
  APR_OVERLAP_TABLES_MERGE = 1;
  APR_OVERLAP_TABLES_ADD = 2;

procedure apr_table_overlap(a: Papr_table_t; b: Papr_table_t; flags: dword); cdecl; external libapr;
procedure apr_table_compress(t: Papr_table_t; flags: dword); cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
