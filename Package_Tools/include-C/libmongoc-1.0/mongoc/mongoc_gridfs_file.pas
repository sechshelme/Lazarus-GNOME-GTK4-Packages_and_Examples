unit mongoc_gridfs_file;

interface

uses
  fp_mongoc, mongoc_iovec;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmongoc_gridfs_file_t = type Pointer;

  Tmongoc_gridfs_file_opt_t = record
    md5: pchar;
    filename: pchar;
    content_type: pchar;
    aliases: Pbson_t;
    metadata: Pbson_t;
    chunk_size: Tuint32_t;
  end;
  Pmongoc_gridfs_file_opt_t = ^Tmongoc_gridfs_file_opt_t;

function mongoc_gridfs_file_get_md5(file_: Pmongoc_gridfs_file_t): pchar; cdecl; external libmongoc;
procedure mongoc_gridfs_file_set_md5(file_: Pmongoc_gridfs_file_t; str: pchar); cdecl; external libmongoc;
function mongoc_gridfs_file_get_filename(file_: Pmongoc_gridfs_file_t): pchar; cdecl; external libmongoc;
procedure mongoc_gridfs_file_set_filename(file_: Pmongoc_gridfs_file_t; str: pchar); cdecl; external libmongoc;
function mongoc_gridfs_file_get_content_type(file_: Pmongoc_gridfs_file_t): pchar; cdecl; external libmongoc;
procedure mongoc_gridfs_file_set_content_type(file_: Pmongoc_gridfs_file_t; str: pchar); cdecl; external libmongoc;
function mongoc_gridfs_file_get_aliases(file_: Pmongoc_gridfs_file_t): Pbson_t; cdecl; external libmongoc;
procedure mongoc_gridfs_file_set_aliases(file_: Pmongoc_gridfs_file_t; bson: Pbson_t); cdecl; external libmongoc;
function mongoc_gridfs_file_get_metadata(file_: Pmongoc_gridfs_file_t): Pbson_t; cdecl; external libmongoc;
procedure mongoc_gridfs_file_set_metadata(file_: Pmongoc_gridfs_file_t; bson: Pbson_t); cdecl; external libmongoc;

function mongoc_gridfs_file_get_id(file_: Pmongoc_gridfs_file_t): Pbson_value_t; cdecl; external libmongoc;
function mongoc_gridfs_file_get_length(file_: Pmongoc_gridfs_file_t): Tint64_t; cdecl; external libmongoc;
function mongoc_gridfs_file_get_chunk_size(file_: Pmongoc_gridfs_file_t): Tint32_t; cdecl; external libmongoc;
function mongoc_gridfs_file_get_upload_date(file_: Pmongoc_gridfs_file_t): Tint64_t; cdecl; external libmongoc;
function mongoc_gridfs_file_writev(file_: Pmongoc_gridfs_file_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; timeout_msec: Tuint32_t): Tssize_t; cdecl; external libmongoc;
function mongoc_gridfs_file_readv(file_: Pmongoc_gridfs_file_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; min_bytes: Tsize_t; timeout_msec: Tuint32_t): Tssize_t; cdecl; external libmongoc;
function mongoc_gridfs_file_seek(file_: Pmongoc_gridfs_file_t; delta: Tint64_t; whence: longint): longint; cdecl; external libmongoc;
function mongoc_gridfs_file_tell(file_: Pmongoc_gridfs_file_t): Tuint64_t; cdecl; external libmongoc;
function mongoc_gridfs_file_set_id(file_: Pmongoc_gridfs_file_t; id: Pbson_value_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_gridfs_file_save(file_: Pmongoc_gridfs_file_t): Tbool; cdecl; external libmongoc;
procedure mongoc_gridfs_file_destroy(file_: Pmongoc_gridfs_file_t); cdecl; external libmongoc;
function mongoc_gridfs_file_error(file_: Pmongoc_gridfs_file_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;
function mongoc_gridfs_file_remove(file_: Pmongoc_gridfs_file_t; error: Pbson_error_t): Tbool; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:15:46 ===


implementation



end.
