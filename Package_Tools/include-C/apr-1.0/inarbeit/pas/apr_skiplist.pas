unit apr_skiplist;

interface

uses
  fp_apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tapr_skiplist_compare = function(para1: pointer; para2: pointer): longint; cdecl;
  Tapr_skiplist_freefunc = procedure(para1: pointer); cdecl;

  Papr_skiplist = type Pointer;
  PPapr_skiplist = ^Papr_skiplist;

  Papr_skiplistnode = type Pointer;
  PPapr_skiplistnode = ^Papr_skiplistnode;

function apr_skiplist_alloc(sl: Papr_skiplist; size: SizeUInt): pointer; cdecl; external libapr;
procedure apr_skiplist_free(sl: Papr_skiplist; mem: pointer); cdecl; external libapr;
function apr_skiplist_init(sl: PPapr_skiplist; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
procedure apr_skiplist_set_compare(sl: Papr_skiplist; XXX1: Tapr_skiplist_compare; XXX2: Tapr_skiplist_compare); cdecl; external libapr;
procedure apr_skiplist_add_index(sl: Papr_skiplist; XXX1: Tapr_skiplist_compare; XXX2: Tapr_skiplist_compare); cdecl; external libapr;
function apr_skiplist_getlist(sl: Papr_skiplist): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_find_compare(sl: Papr_skiplist; data: pointer; iter: PPapr_skiplistnode; func: Tapr_skiplist_compare): pointer; cdecl; external libapr;
function apr_skiplist_find(sl: Papr_skiplist; data: pointer; iter: PPapr_skiplistnode): pointer; cdecl; external libapr;
function apr_skiplist_last_compare(sl: Papr_skiplist; data: pointer; iter: PPapr_skiplistnode; comp: Tapr_skiplist_compare): pointer; cdecl; external libapr;
function apr_skiplist_last(sl: Papr_skiplist; data: pointer; iter: PPapr_skiplistnode): pointer; cdecl; external libapr;
function apr_skiplist_next(sl: Papr_skiplist; iter: PPapr_skiplistnode): pointer; cdecl; external libapr;
function apr_skiplist_previous(sl: Papr_skiplist; iter: PPapr_skiplistnode): pointer; cdecl; external libapr;
function apr_skiplist_element(iter: Papr_skiplistnode): pointer; cdecl; external libapr;
function apr_skiplist_insert_compare(sl: Papr_skiplist; data: pointer; comp: Tapr_skiplist_compare): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_insert(sl: Papr_skiplist; data: pointer): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_add_compare(sl: Papr_skiplist; data: pointer; comp: Tapr_skiplist_compare): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_add(sl: Papr_skiplist; data: pointer): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_replace_compare(sl: Papr_skiplist; data: pointer; myfree: Tapr_skiplist_freefunc; comp: Tapr_skiplist_compare): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_replace(sl: Papr_skiplist; data: pointer; myfree: Tapr_skiplist_freefunc): Papr_skiplistnode; cdecl; external libapr;
function apr_skiplist_remove_node(sl: Papr_skiplist; iter: Papr_skiplistnode; myfree: Tapr_skiplist_freefunc): longint; cdecl; external libapr;
function apr_skiplist_remove_compare(sl: Papr_skiplist; data: pointer; myfree: Tapr_skiplist_freefunc; comp: Tapr_skiplist_compare): longint; cdecl; external libapr;
function apr_skiplist_remove(sl: Papr_skiplist; data: pointer; myfree: Tapr_skiplist_freefunc): longint; cdecl; external libapr;
procedure apr_skiplist_remove_all(sl: Papr_skiplist; myfree: Tapr_skiplist_freefunc); cdecl; external libapr;
procedure apr_skiplist_destroy(sl: Papr_skiplist; myfree: Tapr_skiplist_freefunc); cdecl; external libapr;
function apr_skiplist_pop(sl: Papr_skiplist; myfree: Tapr_skiplist_freefunc): pointer; cdecl; external libapr;
function apr_skiplist_peek(sl: Papr_skiplist): pointer; cdecl; external libapr;
function apr_skiplist_size(sl: Papr_skiplist): SizeUInt; cdecl; external libapr;
function apr_skiplist_height(sl: Papr_skiplist): longint; cdecl; external libapr;
function apr_skiplist_preheight(sl: Papr_skiplist): longint; cdecl; external libapr;
procedure apr_skiplist_set_preheight(sl: Papr_skiplist; to_: longint); cdecl; external libapr;
function apr_skiplist_merge(sl1: Papr_skiplist; sl2: Papr_skiplist): Papr_skiplist; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:47:12 ===


implementation



end.
