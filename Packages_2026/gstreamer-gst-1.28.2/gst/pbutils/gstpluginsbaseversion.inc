{$IFDEF read_interface}


const
  GST_PLUGINS_BASE_VERSION_MAJOR = 1;
  GST_PLUGINS_BASE_VERSION_MINOR = 28;
  GST_PLUGINS_BASE_VERSION_MICRO = 2;
  GST_PLUGINS_BASE_VERSION_NANO = 0;

procedure gst_plugins_base_version(major: Pguint; minor: Pguint; micro: Pguint; nano: Pguint); cdecl; external libgstpbutils;
function gst_plugins_base_version_string: Pgchar; cdecl; external libgstpbutils;

// === Konventiert am: 23-7-26 19:45:38 ===

function GST_CHECK_PLUGINS_BASE_VERSION(major, minor, micro: integer): boolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_CHECK_PLUGINS_BASE_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (GST_PLUGINS_BASE_VERSION_MAJOR > major) or
    ((GST_PLUGINS_BASE_VERSION_MAJOR = major) and (GST_PLUGINS_BASE_VERSION_MINOR > minor)) or
    ((GST_PLUGINS_BASE_VERSION_MAJOR = major) and (GST_PLUGINS_BASE_VERSION_MINOR = minor) and
    (GST_PLUGINS_BASE_VERSION_MICRO >= micro)) or
    ((GST_PLUGINS_BASE_VERSION_MAJOR = major) and (GST_PLUGINS_BASE_VERSION_MINOR = minor) and
    (GST_PLUGINS_BASE_VERSION_MICRO + 1 = micro) and (GST_PLUGINS_BASE_VERSION_NANO > 0));
end;

{$ENDIF read_implementation}
