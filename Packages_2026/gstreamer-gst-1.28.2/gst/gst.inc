

{$IFDEF read_function}
procedure gst_init(argc: Plongint; argv: PPPchar); cdecl; external libgstreamer;
function gst_init_check(argc: Plongint; argv: PPPchar; error: PPGError): Tgboolean; cdecl; external libgstreamer;
function gst_is_initialized: Tgboolean; cdecl; external libgstreamer;
function gst_init_get_option_group: PGOptionGroup; cdecl; external libgstreamer;
procedure gst_deinit; cdecl; external libgstreamer;
procedure gst_version(major: Pguint; minor: Pguint; micro: Pguint; nano: Pguint); cdecl; external libgstreamer;
function gst_version_string: Pgchar; cdecl; external libgstreamer;
function gst_check_version(major: Tguint; minor: Tguint; micro: Tguint): Tgboolean; cdecl; external libgstreamer;
function gst_segtrap_is_enabled: Tgboolean; cdecl; external libgstreamer;
procedure gst_segtrap_set_enabled(enabled: Tgboolean); cdecl; external libgstreamer;
function gst_registry_fork_is_enabled: Tgboolean; cdecl; external libgstreamer;
procedure gst_registry_fork_set_enabled(enabled: Tgboolean); cdecl; external libgstreamer;
function gst_update_registry: Tgboolean; cdecl; external libgstreamer;
function gst_get_main_executable_path: Pgchar; cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 10-7-26 19:47:56 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
