{$IFDEF read_interface}


type
  Psd_hwdb = type Pointer;
  PPsd_hwdb = ^Psd_hwdb;

function sd_hwdb_ref(hwdb: Psd_hwdb): Psd_hwdb; cdecl; external libsystemd;
function sd_hwdb_unref(hwdb: Psd_hwdb): Psd_hwdb; cdecl; external libsystemd;
function sd_hwdb_new(ret: PPsd_hwdb): longint; cdecl; external libsystemd;
function sd_hwdb_new_from_path(path: pchar; ret: PPsd_hwdb): longint; cdecl; external libsystemd;
function sd_hwdb_get(hwdb: Psd_hwdb; modalias: pchar; key: pchar; value: PPchar): longint; cdecl; external libsystemd;
function sd_hwdb_seek(hwdb: Psd_hwdb; modalias: pchar): longint; cdecl; external libsystemd;
function sd_hwdb_enumerate(hwdb: Psd_hwdb; key: PPchar; value: PPchar): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:04:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
