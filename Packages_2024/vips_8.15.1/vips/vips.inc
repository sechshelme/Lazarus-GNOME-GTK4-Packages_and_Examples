


{$IFDEF read_function}
function vips_init(argv0: pchar): longint; cdecl; external libvips;
function vips_get_argv0: pchar; cdecl; external libvips;
function vips_get_prgname: pchar; cdecl; external libvips;
procedure vips_shutdown; cdecl; external libvips;
procedure vips_thread_shutdown; cdecl; external libvips;
procedure vips_add_option_entries(option_group: PGOptionGroup); cdecl; external libvips;
procedure vips_leak_set(leak: Tgboolean); cdecl; external libvips;
procedure vips_block_untrusted_set(state: Tgboolean); cdecl; external libvips;
function vips_version_string: pchar; cdecl; external libvips;
function vips_version(flag: longint): longint; cdecl; external libvips;
function vips_guess_prefix(argv0: pchar; env_name: pchar): pchar; cdecl; external libvips;
function vips_guess_libdir(argv0: pchar; env_name: pchar): pchar; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:08:00 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
