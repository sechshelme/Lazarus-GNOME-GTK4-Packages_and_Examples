unit mongoc_gridfs;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_stream, mongoc_gridfs_file, mongoc_gridfs_file_list, mongoc_collection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_gridfs_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_gridfs_create_file_from_stream(gridfs: Pmongoc_gridfs_t; stream: Pmongoc_stream_t; opt: Pmongoc_gridfs_file_opt_t): Pmongoc_gridfs_file_t; cdecl; external libmongoc;
function mongoc_gridfs_create_file(gridfs: Pmongoc_gridfs_t; opt: Pmongoc_gridfs_file_opt_t): Pmongoc_gridfs_file_t; cdecl; external libmongoc;
function mongoc_gridfs_find(gridfs: Pmongoc_gridfs_t; query: Pbson_t): Pmongoc_gridfs_file_list_t; cdecl; external libmongoc; deprecated;
function mongoc_gridfs_find_one(gridfs: Pmongoc_gridfs_t; query: Pbson_t; error: Pbson_error_t): Pmongoc_gridfs_file_t; cdecl; external libmongoc; deprecated;
function mongoc_gridfs_find_with_opts(gridfs: Pmongoc_gridfs_t; filter: Pbson_t; opts: Pbson_t): Pmongoc_gridfs_file_list_t; cdecl; external libmongoc;
function mongoc_gridfs_find_one_with_opts(gridfs: Pmongoc_gridfs_t; filter: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Pmongoc_gridfs_file_t; cdecl; external libmongoc;
function mongoc_gridfs_find_one_by_filename(gridfs: Pmongoc_gridfs_t; filename: pchar; error: Pbson_error_t): Pmongoc_gridfs_file_t; cdecl; external libmongoc;
function mongoc_gridfs_drop(gridfs: Pmongoc_gridfs_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_gridfs_destroy(gridfs: Pmongoc_gridfs_t); cdecl; external libmongoc;
function mongoc_gridfs_get_files(gridfs: Pmongoc_gridfs_t): Pmongoc_collection_t; cdecl; external libmongoc;
function mongoc_gridfs_get_chunks(gridfs: Pmongoc_gridfs_t): Pmongoc_collection_t; cdecl; external libmongoc;
function mongoc_gridfs_remove_by_filename(gridfs: Pmongoc_gridfs_t; filename: pchar; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:53 ===


implementation



end.
