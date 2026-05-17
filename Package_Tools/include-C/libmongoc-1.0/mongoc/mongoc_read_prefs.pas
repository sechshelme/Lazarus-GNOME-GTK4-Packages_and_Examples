unit mongoc_read_prefs;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  MONGOC_NO_MAX_STALENESS = -(1);
  MONGOC_SMALLEST_MAX_STALENESS_SECONDS = 90;

type
  Pmongoc_read_mode_t = ^Tmongoc_read_mode_t;
  Tmongoc_read_mode_t = longint;

const
  MONGOC_READ_PRIMARY = 1 shl 0;
  MONGOC_READ_SECONDARY = 1 shl 1;
  MONGOC_READ_PRIMARY_PREFERRED = (1 shl 2) or MONGOC_READ_PRIMARY;
  MONGOC_READ_SECONDARY_PREFERRED = (1 shl 2) or MONGOC_READ_SECONDARY;
  MONGOC_READ_NEAREST = (1 shl 3) or MONGOC_READ_SECONDARY;
  {$ENDIF read_enum}


  {$IFDEF read_struct}
type
  Pmongoc_read_prefs_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_read_prefs_new(read_mode: Tmongoc_read_mode_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
function mongoc_read_prefs_copy(read_prefs: Pmongoc_read_prefs_t): Pmongoc_read_prefs_t; cdecl; external libmongoc;
procedure mongoc_read_prefs_destroy(read_prefs: Pmongoc_read_prefs_t); cdecl; external libmongoc;
function mongoc_read_prefs_get_mode(read_prefs: Pmongoc_read_prefs_t): Tmongoc_read_mode_t; cdecl; external libmongoc;
procedure mongoc_read_prefs_set_mode(read_prefs: Pmongoc_read_prefs_t; mode: Tmongoc_read_mode_t); cdecl; external libmongoc;
function mongoc_read_prefs_get_tags(read_prefs: Pmongoc_read_prefs_t): Pbson_t; cdecl; external libmongoc;
procedure mongoc_read_prefs_set_tags(read_prefs: Pmongoc_read_prefs_t; tags: Pbson_t); cdecl; external libmongoc;
procedure mongoc_read_prefs_add_tag(read_prefs: Pmongoc_read_prefs_t; tag: Pbson_t); cdecl; external libmongoc;
function mongoc_read_prefs_get_max_staleness_seconds(read_prefs: Pmongoc_read_prefs_t): Tint64_t; cdecl; external libmongoc;
procedure mongoc_read_prefs_set_max_staleness_seconds(read_prefs: Pmongoc_read_prefs_t; max_staleness_seconds: Tint64_t); cdecl; external libmongoc;
function mongoc_read_prefs_get_hedge(read_prefs: Pmongoc_read_prefs_t): Pbson_t; cdecl; external libmongoc;
procedure mongoc_read_prefs_set_hedge(read_prefs: Pmongoc_read_prefs_t; hedge: Pbson_t); cdecl; external libmongoc;
function mongoc_read_prefs_is_valid(read_prefs: Pmongoc_read_prefs_t): boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:02 ===


implementation



end.
