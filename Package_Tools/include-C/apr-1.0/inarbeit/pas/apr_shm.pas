unit apr_shm;

interface

uses
  fp_apr, apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papr_shm_t = type Pointer;
  PPapr_shm_t = ^Papr_shm_t;

function apr_shm_create(m: PPapr_shm_t; reqsize: Tapr_size_t; filename: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

const
  APR_SHM_NS_LOCAL = 1;
  APR_SHM_NS_GLOBAL = 2;

function apr_shm_create_ex(m: PPapr_shm_t; reqsize: Tapr_size_t; filename: pchar; pool: Papr_pool_t; flags: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_remove(filename: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_delete(m: Papr_shm_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_destroy(m: Papr_shm_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_attach(m: PPapr_shm_t; filename: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_attach_ex(m: PPapr_shm_t; filename: pchar; pool: Papr_pool_t; flags: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_detach(m: Papr_shm_t): Tapr_status_t; cdecl; external libapr;
function apr_shm_baseaddr_get(m: Papr_shm_t): pointer; cdecl; external libapr;
function apr_shm_size_get(m: Papr_shm_t): Tapr_size_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:47:38 ===


implementation



end.
