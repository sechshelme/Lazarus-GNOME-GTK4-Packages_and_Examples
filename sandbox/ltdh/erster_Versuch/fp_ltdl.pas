unit fp_ltdl;

interface

uses
  lt_dlloader;


const
  {$IFDEF linux}
  libltdl = 'libltdl';
  {$ENDIF}

  {$IFDEF windows}
  libltdl = 'libltdl-7.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/libltdl/lt_error.h

type
  Tlt_dlerror = (
    LT_ERROR_UNKNOWN,
    LT_ERROR_DLOPEN_NOT_SUPPORTED,
    LT_ERROR_INVALID_LOADER,
    LT_ERROR_INIT_LOADER,
    LT_ERROR_REMOVE_LOADER,
    LT_ERROR_FILE_NOT_FOUND,
    LT_ERROR_DEPLIB_NOT_FOUND,
    LT_ERROR_NO_SYMBOLS,
    LT_ERROR_CANNOT_OPEN,
    LT_ERROR_CANNOT_CLOSE,
    LT_ERROR_SYMBOL_NOT_FOUND,
    LT_ERROR_NO_MEMORY,
    LT_ERROR_INVALID_HANDLE,
    LT_ERROR_BUFFER_OVERFLOW,
    LT_ERROR_INVALID_ERRORCODE,
    LT_ERROR_SHUTDOWN,
    LT_ERROR_CLOSE_RESIDENT_MODULE,
    LT_ERROR_INVALID_MUTEX_ARGS,
    LT_ERROR_INVALID_POSITION,
    LT_ERROR_CONFLICTING_FLAGS,
    LT_ERROR_MAX);

const
  lt_dlerror_descriptions: array[Tlt_dlerror] of pchar = (
    'unknown error',
    'dlopen support not available',
    'invalid loader',
    'loader initialization failed',
    'loader removal failed',
    'file not found',
    'dependency library not found',
    'no symbols defined',
    'can''t open the module',
    'can''t close the module',
    'symbol not found',
    'not enough memory',
    'invalid module handle',
    'internal buffer overflow',
    'invalid errorcode',
    'library already shutdown',
    'can''t close resident module',
    'internal error (code withdrawn)',
    'invalid search path insert position',
    'symbol visibility can be global or local',
    '');

const
  LT_ERROR_LEN_MAX = 41;
  { These functions are only useful from inside custom module loaders.  }

function lt_dladderror(diagnostic: pchar): longint; cdecl; external libltdl;
function lt_dlseterror(errorcode: longint): longint; cdecl; external libltdl;


// /usr/include/libltdl/lt_system.h

const
  EXIT_SUCCESS = 0;
  EXIT_FAILURE = 1;

const
  LT_FILENAME_MAX = 2048;
  LT_EOS_CHAR = #0;


  // /usr/include/libltdl/lt_dlloader.h

type
  PPlt_dlloader = ^Plt_dlloader;
  Plt_dlloader = type pointer;

  PPlt_module = ^Plt_module;
  Plt_module = type pointer;

  PPlt_user_data = ^Plt_user_data;
  Plt_user_data = type pointer;

  PPlt_dladvise = ^Plt_dladvise;
  Plt_dladvise = type Pointer;

  Tlt_module_open = function(data: Plt_user_data; filename: pchar; advise: Plt_dladvise): Plt_module; cdecl;
  Tlt_module_close = function(data: Plt_user_data; module: Plt_module): longint; cdecl;
  Tlt_find_sym = function(data: Plt_user_data; module: Plt_module; symbolname: pchar): pointer; cdecl;
  Tlt_dlloader_init = function(data: Plt_user_data): longint; cdecl;
  Tlt_dlloader_exit = function(data: Plt_user_data): longint; cdecl;

  Plt_dlloader_priority = ^Tlt_dlloader_priority;
  Tlt_dlloader_priority = longint;

const
  LT_DLLOADER_PREPEND = 0;
  LT_DLLOADER_APPEND = 1;

type
  Tlt_dlvtable = record
    name: pchar;
    sym_prefix: pchar;
    module_open: Tlt_module_open;
    module_close: Tlt_module_close;
    find_sym: Tlt_find_sym;
    dlloader_init: Tlt_dlloader_init;
    dlloader_exit: Tlt_dlloader_exit;
    dlloader_data: Plt_user_data;
    priority: Tlt_dlloader_priority;
  end;
  Plt_dlvtable = ^Tlt_dlvtable;

function lt_dlloader_add(vtable: Plt_dlvtable): longint; cdecl; external libltdl;
function lt_dlloader_next(loader: Plt_dlloader): Plt_dlloader; cdecl; external libltdl;
function lt_dlloader_remove(name: pchar): Plt_dlvtable; cdecl; external libltdl;
function lt_dlloader_find(name: pchar): Plt_dlvtable; cdecl; external libltdl;
function lt_dlloader_get(loader: Plt_dlloader): Plt_dlvtable; cdecl; external libltdl;

type
  Tlt_get_vtable = function(data: Plt_user_data): Plt_dlvtable; cdecl;

procedure lt_dlloader_dump; cdecl; external libltdl;


// /usr/include/ltdl.h

type
  Plt_dlhandle = ^Tlt_dlhandle;
  Tlt_dlhandle = type Pointer;

function lt_dlinit: longint; cdecl; external libltdl;
function lt_dlexit: longint; cdecl; external libltdl;
function lt_dladdsearchdir(search_dir: pchar): longint; cdecl; external libltdl;
function lt_dlinsertsearchdir(before: pchar; search_dir: pchar): longint; cdecl; external libltdl;
function lt_dlsetsearchpath(search_path: pchar): longint; cdecl; external libltdl;
function lt_dlgetsearchpath: pchar; cdecl; external libltdl;

type
  TFileFunc = function(filename: pchar; data: Pointer): longint; cdecl;

function lt_dlforeachfile(search_path: pchar; func: TFileFunc; data: pointer): longint; cdecl; external libltdl;
function lt_dladvise_init(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dladvise_destroy(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dladvise_ext(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dladvise_resident(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dladvise_local(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dladvise_global(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dladvise_preload(advise: PPlt_dladvise): longint; cdecl; external libltdl;
function lt_dlopen(filename: pchar): Tlt_dlhandle; cdecl; external libltdl;
function lt_dlopenext(filename: pchar): Tlt_dlhandle; cdecl; external libltdl;
function lt_dlopenadvise(filename: pchar; advise: Plt_dladvise): Tlt_dlhandle; cdecl; external libltdl;
function lt_dlsym(handle: Tlt_dlhandle; name: pchar): pointer; cdecl; external libltdl;
function lt_dlerror: pchar; cdecl; external libltdl;
function lt_dlclose(handle: Tlt_dlhandle): longint; cdecl; external libltdl;

type
  Tlt_dlsymlist = record
    name: pchar;
    address: pointer;
  end;
  Plt_dlsymlist = ^Tlt_dlsymlist;

  Tlt_dlpreload_callback_func = function(handle: Tlt_dlhandle): longint; cdecl;

function lt_dlpreload(preloaded: Plt_dlsymlist): longint; cdecl; external libltdl;
function lt_dlpreload_default(preloaded: Plt_dlsymlist): longint; cdecl; external libltdl;
function lt_dlpreload_open(originator: pchar; func: Tlt_dlpreload_callback_func): longint; cdecl; external libltdl;

type
  Tlt_dlinterface_id = pointer;
  Tlt_dlhandle_interface = function(handle: Tlt_dlhandle; id_string: pchar): longint; cdecl;

function lt_dlinterface_register(id_string: pchar; iface: Tlt_dlhandle_interface): Tlt_dlinterface_id; cdecl; external libltdl;
procedure lt_dlinterface_free(key: Tlt_dlinterface_id); cdecl; external libltdl;
function lt_dlcaller_set_data(key: Tlt_dlinterface_id; handle: Tlt_dlhandle; data: pointer): pointer; cdecl; external libltdl;
function lt_dlcaller_get_data(key: Tlt_dlinterface_id; handle: Tlt_dlhandle): pointer; cdecl; external libltdl;

type
  Tlt_dlinfo = bitpacked record
    filename: pchar;
    name: pchar;
    ref_count: longint;
    is_resident: 0..1;
    is_symglobal: 0..1;
    is_symlocal: 0..1;
  end;
  Plt_dlinfo = ^Tlt_dlinfo;

function lt_dlgetinfo(handle: Tlt_dlhandle): Plt_dlinfo; cdecl; external libltdl;
function lt_dlhandle_iterate(iface: Tlt_dlinterface_id; place: Tlt_dlhandle): Tlt_dlhandle; cdecl; external libltdl;
function lt_dlhandle_fetch(iface: Tlt_dlinterface_id; module_name: pchar): Tlt_dlhandle; cdecl; external libltdl;

type
  THandleFunc = function(handle: Tlt_dlhandle; data: Pointer): longint; cdecl;

function lt_dlhandle_map(iface: Tlt_dlinterface_id; func: THandleFunc; data: pointer): longint; cdecl; external libltdl;
function lt_dlmakeresident(handle: Tlt_dlhandle): longint; cdecl; external libltdl;
function lt_dlisresident(handle: Tlt_dlhandle): longint; cdecl; external libltdl;

type
  Tlt_ptr = Pointer;

  // === Konventiert am: 8-9-25 13:57:40 ===


implementation

end.
