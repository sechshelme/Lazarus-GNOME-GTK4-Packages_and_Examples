unit mongoc_gridfs_bucket;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_stream, mongoc_database,mongoc_read_prefs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_gridfs_bucket_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_gridfs_bucket_new(db: Pmongoc_database_t; opts: Pbson_t; read_prefs: Pmongoc_read_prefs_t; error: Pbson_error_t): Pmongoc_gridfs_bucket_t; cdecl; external libmongoc;
function mongoc_gridfs_bucket_open_upload_stream(bucket: Pmongoc_gridfs_bucket_t; filename: pchar; opts: Pbson_t; file_id: Pbson_value_t; error: Pbson_error_t): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_gridfs_bucket_open_upload_stream_with_id(bucket: Pmongoc_gridfs_bucket_t; file_id: Pbson_value_t; filename: pchar; opts: Pbson_t; error: Pbson_error_t): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_gridfs_bucket_upload_from_stream(bucket: Pmongoc_gridfs_bucket_t; filename: pchar; source: Pmongoc_stream_t; opts: Pbson_t; file_id: Pbson_value_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_gridfs_bucket_upload_from_stream_with_id(bucket: Pmongoc_gridfs_bucket_t; file_id: Pbson_value_t; filename: pchar; source: Pmongoc_stream_t; opts: Pbson_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_gridfs_bucket_open_download_stream(bucket: Pmongoc_gridfs_bucket_t; file_id: Pbson_value_t; error: Pbson_error_t): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_gridfs_bucket_download_to_stream(bucket: Pmongoc_gridfs_bucket_t; file_id: Pbson_value_t; destination: Pmongoc_stream_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_gridfs_bucket_delete_by_id(bucket: Pmongoc_gridfs_bucket_t; file_id: Pbson_value_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_gridfs_bucket_find(bucket: Pmongoc_gridfs_bucket_t; filter: Pbson_t; opts: Pbson_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_gridfs_bucket_stream_error(stream: Pmongoc_stream_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_gridfs_bucket_destroy(bucket: Pmongoc_gridfs_bucket_t); cdecl; external libmongoc;
function mongoc_gridfs_bucket_abort_upload(stream: Pmongoc_stream_t): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:50 ===


implementation



end.
