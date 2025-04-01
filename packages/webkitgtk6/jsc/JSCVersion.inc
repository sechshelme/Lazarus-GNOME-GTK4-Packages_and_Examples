{$IFDEF read_interface}

const
  JSC_MAJOR_VERSION = 2;
  JSC_MINOR_VERSION = 48;
  JSC_MICRO_VERSION = 0;

function JSC_CHECK_VERSION(major, minor, micro: longint): Tgboolean;

function jsc_get_major_version: Tguint; cdecl; external libjavascriptcoregtk;
function jsc_get_minor_version: Tguint; cdecl; external libjavascriptcoregtk;
function jsc_get_micro_version: Tguint; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 19:12:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function JSC_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
begin
  Result := (JSC_MAJOR_VERSION > major) or
    ((JSC_MAJOR_VERSION = major) and (JSC_MINOR_VERSION > minor)) or
    ((JSC_MAJOR_VERSION = major) and (JSC_MINOR_VERSION = minor) and (JSC_MICRO_VERSION >= micro));
end;


{$ENDIF read_implementation}
