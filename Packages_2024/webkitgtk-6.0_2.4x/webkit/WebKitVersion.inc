{$IFDEF read_interface}


const
  WEBKIT_MAJOR_VERSION = 2;
  WEBKIT_MINOR_VERSION = 48;
  WEBKIT_MICRO_VERSION = 5;

function WEBKIT_CHECK_VERSION(major, minor, micro: longint): Tgboolean;

function webkit_get_major_version: Tguint; cdecl; external libwebkit;
function webkit_get_minor_version: Tguint; cdecl; external libwebkit;
function webkit_get_micro_version: Tguint; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:45:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function WEBKIT_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
begin
  Result := (WEBKIT_MAJOR_VERSION > major) or
    ((WEBKIT_MAJOR_VERSION = major) and (WEBKIT_MINOR_VERSION > minor)) or
    ((WEBKIT_MAJOR_VERSION = major) and (WEBKIT_MINOR_VERSION= minor) and (WEBKIT_MICRO_VERSION >= micro));
end;


{$ENDIF read_implementation}
