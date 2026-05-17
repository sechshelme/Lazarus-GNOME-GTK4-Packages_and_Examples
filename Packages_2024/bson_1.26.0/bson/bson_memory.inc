{$IFDEF read_interface}

type
  Tbson_realloc_func = function(mem: pointer; num_bytes: Tsize_t; ctx: pointer): pointer; cdecl;

  Tbson_mem_vtable_t = record
    malloc: function(num_bytes: Tsize_t): pointer; cdecl;
    calloc: function(n_members: Tsize_t; num_bytes: Tsize_t): pointer; cdecl;
    realloc: function(mem: pointer; num_bytes: Tsize_t): pointer; cdecl;
    free: procedure(mem: pointer); cdecl;
    aligned_alloc: function(alignment: Tsize_t; num_bytes: Tsize_t): pointer; cdecl;
    padding: array[0..2] of pointer;
  end;
  Pbson_mem_vtable_t = ^Tbson_mem_vtable_t;

procedure bson_mem_set_vtable(vtable: Pbson_mem_vtable_t); cdecl; external libbson;
procedure bson_mem_restore_vtable; cdecl; external libbson;
function bson_malloc(num_bytes: Tsize_t): pointer; cdecl; external libbson;
function bson_malloc0(num_bytes: Tsize_t): pointer; cdecl; external libbson;
function bson_aligned_alloc(alignment: Tsize_t; num_bytes: Tsize_t): pointer; cdecl; external libbson;
function bson_aligned_alloc0(alignment: Tsize_t; num_bytes: Tsize_t): pointer; cdecl; external libbson;
function bson_realloc(mem: pointer; num_bytes: Tsize_t): pointer; cdecl; external libbson;
function bson_realloc_ctx(mem: pointer; num_bytes: Tsize_t; ctx: pointer): pointer; cdecl; external libbson;
procedure bson_free(mem: pointer); cdecl; external libbson;
procedure bson_zero_free(mem: pointer; size: Tsize_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
