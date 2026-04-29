
{$IFDEF read_function}
var
  vips__vector_enabled : Tgboolean;cvar;external libvips;

function vips_vector_isenabled: Tgboolean; cdecl; external libvips;
procedure vips_vector_set_enabled(enabled: Tgboolean); cdecl; external libvips;
function vips_vector_get_builtin_targets: Tgint64; cdecl; external libvips;
function vips_vector_get_supported_targets: Tgint64; cdecl; external libvips;
function vips_vector_target_name(target: Tgint64): pchar; cdecl; external libvips;
procedure vips_vector_disable_targets(disabled_targets: Tgint64); cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:08:29 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
