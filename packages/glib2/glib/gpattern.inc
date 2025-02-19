
{$IFDEF read_interface}

type
  TGPatternSpec = record
  end;
  PGPatternSpec = ^tGPatternSpec;

function g_pattern_spec_new(pattern: Pgchar): PGPatternSpec; cdecl; external libglib2;
procedure g_pattern_spec_free(pspec: PGPatternSpec); cdecl; external libglib2;
function g_pattern_spec_copy(pspec: PGPatternSpec): PGPatternSpec; cdecl; external libglib2;
function g_pattern_spec_equal(pspec1: PGPatternSpec; pspec2: PGPatternSpec): Tgboolean; cdecl; external libglib2;
function g_pattern_spec_match(pspec: PGPatternSpec; string_length: Tgsize; _string: Pgchar; string_reversed: Pgchar): Tgboolean; cdecl; external libglib2;
function g_pattern_spec_match_string(pspec: PGPatternSpec; _string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_pattern_match(pspec: PGPatternSpec; string_length: Tguint; _string: Pgchar; string_reversed: Pgchar): Tgboolean; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_70_FOR (g_pattern_spec_match)';
function g_pattern_match_string(pspec: PGPatternSpec; _string: Pgchar): Tgboolean; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_70_FOR (g_pattern_spec_match_string)';
function g_pattern_match_simple(pattern: Pgchar; _string: Pgchar): Tgboolean; cdecl; external libglib2;

// === Konventiert am: 11-8-24 15:49:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
