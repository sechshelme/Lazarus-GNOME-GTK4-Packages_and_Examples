{$IFDEF read_interface}

type
  Phb_memory_mode_t = ^Thb_memory_mode_t;
  Thb_memory_mode_t = longint;

const
  HB_MEMORY_MODE_DUPLICATE = 0;
  HB_MEMORY_MODE_READONLY = 1;
  HB_MEMORY_MODE_WRITABLE = 2;
  HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE = 3;

type
  Thb_blob_t = record
  end;
  Phb_blob_t = ^Thb_blob_t;

function hb_blob_create(Data: pchar; length: dword; mode: Thb_memory_mode_t; user_data: pointer; Destroy: Thb_destroy_func_t): Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_create_or_fail(Data: pchar; length: dword; mode: Thb_memory_mode_t; user_data: pointer; Destroy: Thb_destroy_func_t): Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_create_from_file(file_name: pchar): Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_create_from_file_or_fail(file_name: pchar): Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_create_sub_blob(parent: Phb_blob_t; offset: dword; length: dword): Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_copy_writable_or_fail(blob: Phb_blob_t): Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_get_empty: Phb_blob_t; cdecl; external libharfbuzz;
function hb_blob_reference(blob: Phb_blob_t): Phb_blob_t; cdecl; external libharfbuzz;
procedure hb_blob_destroy(blob: Phb_blob_t); cdecl; external libharfbuzz;
function hb_blob_set_user_data(blob: Phb_blob_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_blob_get_user_data(blob: Phb_blob_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_blob_make_immutable(blob: Phb_blob_t); cdecl; external libharfbuzz;
function hb_blob_is_immutable(blob: Phb_blob_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_blob_get_length(blob: Phb_blob_t): dword; cdecl; external libharfbuzz;
function hb_blob_get_data(blob: Phb_blob_t; length: Pdword): pchar; cdecl; external libharfbuzz;
function hb_blob_get_data_writable(blob: Phb_blob_t; length: Pdword): pchar; cdecl; external libharfbuzz;

// === Konventiert am: 25-12-24 19:46:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
