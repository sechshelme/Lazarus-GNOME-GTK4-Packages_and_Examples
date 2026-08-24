{$IFDEF read_interface}


const
  H5PL_NO_PLUGIN = '::';

type
  PH5PL_type_t = ^TH5PL_type_t;
  TH5PL_type_t = longint;
const
  H5PL_TYPE_ERROR = -(1);
  H5PL_TYPE_FILTER = 0;
  H5PL_TYPE_NONE = 1;

const
  H5PL_FILTER_PLUGIN = $0001;
  H5PL_ALL_PLUGIN = $FFFF;

function H5PLset_loading_state(plugin_control_mask: dword): Therr_t; cdecl; external libhdf5_serial;
function H5PLget_loading_state(plugin_control_mask: Pdword): Therr_t; cdecl; external libhdf5_serial;
function H5PLappend(search_path: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5PLprepend(search_path: pchar): Therr_t; cdecl; external libhdf5_serial;
function H5PLreplace(search_path: pchar; index: dword): Therr_t; cdecl; external libhdf5_serial;
function H5PLinsert(search_path: pchar; index: dword): Therr_t; cdecl; external libhdf5_serial;
function H5PLremove(index: dword): Therr_t; cdecl; external libhdf5_serial;
function H5PLget(index: dword; path_buf: pchar; buf_size: Tsize_t): Tssize_t; cdecl; external libhdf5_serial;
function H5PLsize(num_paths: Pdword): Therr_t; cdecl; external libhdf5_serial;

// === Konventiert am: 21-8-26 14:23:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
