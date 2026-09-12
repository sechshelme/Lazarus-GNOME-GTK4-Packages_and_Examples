{$IFDEF read_interface}


const
  APR_MMAP_READ = 1;
  APR_MMAP_WRITE = 2;

type
  Papr_mmap_t = type Pointer;
  PPapr_mmap_t = ^Papr_mmap_t;

const
  APR_MMAP_THRESHOLD = 1;
  APR_MMAP_LIMIT = (4 * 1024) * 1024;

function apr_mmap_create(newmmap: PPapr_mmap_t; file_: Papr_file_t; offset: Tapr_off_t; size: Tapr_size_t; flag: Tapr_int32_t;
  cntxt: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_mmap_dup(new_mmap: PPapr_mmap_t; old_mmap: Papr_mmap_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_mmap_delete(mm: Papr_mmap_t): Tapr_status_t; cdecl; external libapr;
function apr_mmap_offset(addr: Ppointer; mm: Papr_mmap_t; offset: Tapr_off_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
