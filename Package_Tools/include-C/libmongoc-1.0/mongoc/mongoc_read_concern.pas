unit mongoc_read_concern;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  MONGOC_READ_CONCERN_LEVEL_AVAILABLE = 'available';
  MONGOC_READ_CONCERN_LEVEL_LOCAL = 'local';
  MONGOC_READ_CONCERN_LEVEL_MAJORITY = 'majority';
  MONGOC_READ_CONCERN_LEVEL_LINEARIZABLE = 'linearizable';
  MONGOC_READ_CONCERN_LEVEL_SNAPSHOT = 'snapshot';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Pmongoc_read_concern_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_read_concern_new: Pmongoc_read_concern_t; cdecl; external libmongoc;
function mongoc_read_concern_copy(read_concern: Pmongoc_read_concern_t): Pmongoc_read_concern_t; cdecl; external libmongoc;
procedure mongoc_read_concern_destroy(read_concern: Pmongoc_read_concern_t); cdecl; external libmongoc;
function mongoc_read_concern_get_level(read_concern: Pmongoc_read_concern_t): pchar; cdecl; external libmongoc;
function mongoc_read_concern_set_level(read_concern: Pmongoc_read_concern_t; level: pchar): boolean; cdecl; external libmongoc;
function mongoc_read_concern_append(read_concern: Pmongoc_read_concern_t; doc: Pbson_t): boolean; cdecl; external libmongoc;
function mongoc_read_concern_is_default(read_concern: Pmongoc_read_concern_t): boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:04 ===


implementation



end.
