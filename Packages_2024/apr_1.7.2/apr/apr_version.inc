{$IFDEF read_interface}


const
  APR_COPYRIGHT = 'Copyright (c) 2000-2023 The Apache Software Foundation or its licensors, as applicable.';
  APR_MAJOR_VERSION = 1;
  APR_MINOR_VERSION = 7;
  APR_PATCH_VERSION = 2;

type
  Papr_version_t = ^Tapr_version_t;
  Tapr_version_t = record
    major: longint;
    minor: longint;
    patch: longint;
    is_dev: longint;
  end;

procedure apr_version(pvsn: Papr_version_t); cdecl; external libapr;
function apr_version_string: pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
