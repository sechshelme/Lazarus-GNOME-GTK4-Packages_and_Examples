{$IFDEF read_interface}


function snd_asoundlib_version: pchar; cdecl; external libasound;

type
  Psnd_dlsym_link = ^Tsnd_dlsym_link;
  Tsnd_dlsym_link = record
    next: Psnd_dlsym_link;
    dlsym_name: pchar;
    dlsym_ptr: pointer;
  end;

var
  snd_dlsym_start: Psnd_dlsym_link; cvar;external libasound;

function snd_dlpath(path: pchar; path_len: Tsize_t; name: pchar): longint; cdecl; external libasound;
function snd_dlopen(file_: pchar; mode: longint; errbuf: pchar; errbuflen: Tsize_t): pointer; cdecl; external libasound;
function snd_dlsym(handle: pointer; name: pchar; version: pchar): pointer; cdecl; external libasound;
function snd_dlclose(handle: pointer): longint; cdecl; external libasound;

type
  Psnd_async_handler_t = type Pointer;
  PPsnd_async_handler_t = ^Psnd_async_handler_t;

  Tsnd_async_callback_t = procedure(handler: Psnd_async_handler_t); cdecl;

function snd_async_add_handler(handler: PPsnd_async_handler_t; fd: longint; callback: Tsnd_async_callback_t; private_data: pointer): longint; cdecl; external libasound;
function snd_async_del_handler(handler: Psnd_async_handler_t): longint; cdecl; external libasound;
function snd_async_handler_get_fd(handler: Psnd_async_handler_t): longint; cdecl; external libasound;
function snd_async_handler_get_signo(handler: Psnd_async_handler_t): longint; cdecl; external libasound;
function snd_async_handler_get_callback_private(handler: Psnd_async_handler_t): pointer; cdecl; external libasound;
function snd_shm_area_create(shmid: longint; ptr: pointer): Psnd_shm_area; cdecl; external libasound;
function snd_shm_area_share(area: Psnd_shm_area): Psnd_shm_area; cdecl; external libasound;
function snd_shm_area_destroy(area: Psnd_shm_area): longint; cdecl; external libasound;
function snd_user_file(file_: pchar; result: PPchar): longint; cdecl; external libasound;

type
  Ttimeval = record
    tv_sec: Ttime_t;
    tv_usec: Tclong;
  end;
  Ptimeval = ^Ttimeval;

  Ttimespec = record
    tv_sec: Ttime_t;
    tv_nsec: Tclong;
  end;
  Ptimespec = ^Ttimespec;

type
  Tsnd_timestamp_t = Ttimeval;
  Psnd_timestamp_t = ^Tsnd_timestamp_t;

  Tsnd_htimestamp_t = Ttimespec;
  Psnd_htimestamp_t = ^Tsnd_htimestamp_t;

  // === Konventiert am: 19-11-25 16:12:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
