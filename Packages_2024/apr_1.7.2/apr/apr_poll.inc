{$IFDEF read_interface}


const
  APR_POLLIN = $001;
  APR_POLLPRI = $002;
  APR_POLLOUT = $004;
  APR_POLLERR = $010;
  APR_POLLHUP = $020;
  APR_POLLNVAL = $040;

  APR_POLLSET_THREADSAFE = $001;
  APR_POLLSET_NOCOPY = $002;
  APR_POLLSET_WAKEABLE = $004;
  APR_POLLSET_NODEFAULT = $010;

type
  Papr_pollset_method_e = ^Tapr_pollset_method_e;
  Tapr_pollset_method_e = longint;
const
  APR_POLLSET_DEFAULT = 0;
  APR_POLLSET_SELECT = 1;
  APR_POLLSET_KQUEUE = 2;
  APR_POLLSET_PORT = 3;
  APR_POLLSET_EPOLL = 4;
  APR_POLLSET_POLL_ = 5;
  APR_POLLSET_AIO_MSGQ = 6;

type
  Papr_datatype_e = ^Tapr_datatype_e;
  Tapr_datatype_e = longint;
const
  APR_NO_DESC = 0;
  APR_POLL_SOCKET = 1;
  APR_POLL_FILE = 2;
  APR_POLL_LASTDESC = 3;

type
  Papr_descriptor = ^Tapr_descriptor;
  Tapr_descriptor = record
    case longint of
      0: (f: Papr_file_t);
      1: (s: Papr_socket_t);
  end;

  PPapr_pollfd_t = ^Papr_pollfd_t;
  Papr_pollfd_t = ^Tapr_pollfd_t;
  Tapr_pollfd_t = record
    p: Papr_pool_t;
    desc_type: Tapr_datatype_e;
    reqevents: Tapr_int16_t;
    rtnevents: Tapr_int16_t;
    desc: Tapr_descriptor;
    client_data: pointer;
  end;

  Papr_pollset_t = type Pointer;
  PPapr_pollset_t = ^Papr_pollset_t;

function apr_pollset_create(pollset: PPapr_pollset_t; size: Tapr_uint32_t; p: Papr_pool_t; flags: Tapr_uint32_t): Tapr_status_t; cdecl; external libapr;
function apr_pollset_create_ex(pollset: PPapr_pollset_t; size: Tapr_uint32_t; p: Papr_pool_t; flags: Tapr_uint32_t; method: Tapr_pollset_method_e): Tapr_status_t; cdecl; external libapr;
function apr_pollset_destroy(pollset: Papr_pollset_t): Tapr_status_t; cdecl; external libapr;
function apr_pollset_add(pollset: Papr_pollset_t; descriptor: Papr_pollfd_t): Tapr_status_t; cdecl; external libapr;
function apr_pollset_remove(pollset: Papr_pollset_t; descriptor: Papr_pollfd_t): Tapr_status_t; cdecl; external libapr;
function apr_pollset_poll(pollset: Papr_pollset_t; timeout: Tapr_interval_time_t; num: Papr_int32_t; descriptors: PPapr_pollfd_t): Tapr_status_t; cdecl; external libapr;
function apr_pollset_wakeup(pollset: Papr_pollset_t): Tapr_status_t; cdecl; external libapr;
function apr_poll(aprset: Papr_pollfd_t; numsock: Tapr_int32_t; nsds: Papr_int32_t; timeout: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_pollset_method_name(pollset: Papr_pollset_t): pchar; cdecl; external libapr;
function apr_poll_method_defname: pchar; cdecl; external libapr;

type
  Papr_pollcb_t = type Pointer;
  PPapr_pollcb_t = ^Papr_pollcb_t;

function apr_pollcb_create(pollcb: PPapr_pollcb_t; size: Tapr_uint32_t; p: Papr_pool_t; flags: Tapr_uint32_t): Tapr_status_t; cdecl; external libapr;
function apr_pollcb_create_ex(pollcb: PPapr_pollcb_t; size: Tapr_uint32_t; p: Papr_pool_t; flags: Tapr_uint32_t; method: Tapr_pollset_method_e): Tapr_status_t; cdecl; external libapr;
function apr_pollcb_add(pollcb: Papr_pollcb_t; descriptor: Papr_pollfd_t): Tapr_status_t; cdecl; external libapr;
function apr_pollcb_remove(pollcb: Papr_pollcb_t; descriptor: Papr_pollfd_t): Tapr_status_t; cdecl; external libapr;
type
  Tapr_pollcb_cb_t = function(baton: pointer; descriptor: Papr_pollfd_t): Tapr_status_t; cdecl;

function apr_pollcb_poll(pollcb: Papr_pollcb_t; timeout: Tapr_interval_time_t; func: Tapr_pollcb_cb_t; baton: pointer): Tapr_status_t; cdecl; external libapr;
function apr_pollcb_wakeup(pollcb: Papr_pollcb_t): Tapr_status_t; cdecl; external libapr;
function apr_pollcb_method_name(pollcb: Papr_pollcb_t): pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:47:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
