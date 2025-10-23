{$IFDEF read_interface}

const
  HB_VERSION_MAJOR = 8;
  HB_VERSION_MINOR = 3;
  HB_VERSION_MICRO = 0;
  HB_VERSION_STRING_ = '8.3.0';

procedure hb_version(major: Pdword; minor: Pdword; micro: Pdword); cdecl; external libharfbuzz;
function hb_version_string: pchar; cdecl; external libharfbuzz;
function hb_version_atleast(major: dword; minor: dword; micro: dword): Thb_bool_t; cdecl; external libharfbuzz;

function HB_VERSION_ATLEAST(major, minor, micro: longint): Boolean;

// === Konventiert am: 27-12-24 15:19:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function HB_VERSION_ATLEAST(major, minor, micro: longint): Boolean;
begin
  HB_VERSION_ATLEAST := (((major * 10000) + (minor * 100)) + micro) <= (((HB_VERSION_MAJOR * 10000) + (HB_VERSION_MINOR * 100)) + HB_VERSION_MICRO);
end;


{$ENDIF read_implementation}
