{$IFDEF read_interface}


type
  Papr_memnode_t = ^Tapr_memnode_t;
  Tapr_memnode_t = record
    next: Papr_memnode_t;
    ref: ^Papr_memnode_t;
    index: Tapr_uint32_t;
    free_index: Tapr_uint32_t;
    first_avail: pchar;
    endp: pchar;
  end;

  Papr_allocator_t = type Pointer;
  PPapr_allocator_t = ^Papr_allocator_t;

const
  APR_MEMNODE_T_SIZE = sizeof(Tapr_memnode_t);
  APR_ALLOCATOR_MAX_FREE_UNLIMITED = 0;

function apr_allocator_create(allocator: PPapr_allocator_t): Tapr_status_t; cdecl; external libapr;
procedure apr_allocator_destroy(allocator: Papr_allocator_t); cdecl; external libapr;
function apr_allocator_alloc(allocator: Papr_allocator_t; size: Tapr_size_t): Papr_memnode_t; cdecl; external libapr;
procedure apr_allocator_free(allocator: Papr_allocator_t; memnode: Papr_memnode_t); cdecl; external libapr;
function apr_allocator_align(allocator: Papr_allocator_t; size: Tapr_size_t): Tapr_size_t; cdecl; external libapr;
procedure apr_allocator_owner_set(allocator: Papr_allocator_t; pool: Papr_pool_t); cdecl; external libapr;
function apr_allocator_owner_get(allocator: Papr_allocator_t): Papr_pool_t; cdecl; external libapr;
procedure apr_allocator_max_free_set(allocator: Papr_allocator_t; size: Tapr_size_t); cdecl; external libapr;
procedure apr_allocator_mutex_set(allocator: Papr_allocator_t; mutex: Papr_thread_mutex_t); cdecl; external libapr;
function apr_allocator_mutex_get(allocator: Papr_allocator_t): Papr_thread_mutex_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
