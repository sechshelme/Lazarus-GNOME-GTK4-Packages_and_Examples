

  {$IFDEF read_enum}
type
  Pmongoc_find_and_modify_flags_t = ^Tmongoc_find_and_modify_flags_t;
  Tmongoc_find_and_modify_flags_t = longint;

const
  MONGOC_FIND_AND_MODIFY_NONE = 0;
  MONGOC_FIND_AND_MODIFY_REMOVE = 1 shl 0;
  MONGOC_FIND_AND_MODIFY_UPSERT = 1 shl 1;
  MONGOC_FIND_AND_MODIFY_RETURN_NEW = 1 shl 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Pmongoc_find_and_modify_opts_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_find_and_modify_opts_new: Pmongoc_find_and_modify_opts_t; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_set_sort(opts: Pmongoc_find_and_modify_opts_t; sort: Pbson_t): Boolean; cdecl; external libmongoc;
procedure mongoc_find_and_modify_opts_get_sort(opts: Pmongoc_find_and_modify_opts_t; sort: Pbson_t); cdecl; external libmongoc;
function mongoc_find_and_modify_opts_set_update(opts: Pmongoc_find_and_modify_opts_t; update: Pbson_t): Boolean; cdecl; external libmongoc;
procedure mongoc_find_and_modify_opts_get_update(opts: Pmongoc_find_and_modify_opts_t; update: Pbson_t); cdecl; external libmongoc;
function mongoc_find_and_modify_opts_set_fields(opts: Pmongoc_find_and_modify_opts_t; fields: Pbson_t): Boolean; cdecl; external libmongoc;
procedure mongoc_find_and_modify_opts_get_fields(opts: Pmongoc_find_and_modify_opts_t; fields: Pbson_t); cdecl; external libmongoc;
function mongoc_find_and_modify_opts_set_flags(opts: Pmongoc_find_and_modify_opts_t; flags: Tmongoc_find_and_modify_flags_t): Boolean; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_get_flags(opts: Pmongoc_find_and_modify_opts_t): Tmongoc_find_and_modify_flags_t; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_set_bypass_document_validation(opts: Pmongoc_find_and_modify_opts_t; bypass: Boolean): Boolean; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_get_bypass_document_validation(opts: Pmongoc_find_and_modify_opts_t): Boolean; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_set_max_time_ms(opts: Pmongoc_find_and_modify_opts_t; max_time_ms: Tuint32_t): Boolean; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_get_max_time_ms(opts: Pmongoc_find_and_modify_opts_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_find_and_modify_opts_append(opts: Pmongoc_find_and_modify_opts_t; extra: Pbson_t): Boolean; cdecl; external libmongoc;
procedure mongoc_find_and_modify_opts_get_extra(opts: Pmongoc_find_and_modify_opts_t; extra: Pbson_t); cdecl; external libmongoc;
procedure mongoc_find_and_modify_opts_destroy(opts: Pmongoc_find_and_modify_opts_t); cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:58 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
