unit mongoc_gridfs_bucket;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2018-present MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_GRIDFS_BUCKET_H}
{$define MONGOC_GRIDFS_BUCKET_H}
{$include "bson/bson.h"}
{$include "mongoc-collection.h"}
{$include "mongoc-database.h"}
{$include "mongoc-stream.h"}
type

function mongoc_gridfs_bucket_new(db:Pmongoc_database_t; opts:Pbson_t; read_prefs:Pmongoc_read_prefs_t; error:Pbson_error_t):Pmongoc_gridfs_bucket_t;cdecl;external libmongoc;
function mongoc_gridfs_bucket_open_upload_stream(bucket:Pmongoc_gridfs_bucket_t; filename:Pchar; opts:Pbson_t; file_id:Pbson_value_t; error:Pbson_error_t):Pmongoc_stream_t;cdecl;external libmongoc;
function mongoc_gridfs_bucket_open_upload_stream_with_id(bucket:Pmongoc_gridfs_bucket_t; file_id:Pbson_value_t; filename:Pchar; opts:Pbson_t; error:Pbson_error_t):Pmongoc_stream_t;cdecl;external libmongoc;
function mongoc_gridfs_bucket_upload_from_stream(bucket:Pmongoc_gridfs_bucket_t; filename:Pchar; source:Pmongoc_stream_t; opts:Pbson_t; file_id:Pbson_value_t; 
           error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_gridfs_bucket_upload_from_stream_with_id(bucket:Pmongoc_gridfs_bucket_t; file_id:Pbson_value_t; filename:Pchar; source:Pmongoc_stream_t; opts:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_gridfs_bucket_open_download_stream(bucket:Pmongoc_gridfs_bucket_t; file_id:Pbson_value_t; error:Pbson_error_t):Pmongoc_stream_t;cdecl;external libmongoc;
function mongoc_gridfs_bucket_download_to_stream(bucket:Pmongoc_gridfs_bucket_t; file_id:Pbson_value_t; destination:Pmongoc_stream_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_gridfs_bucket_delete_by_id(bucket:Pmongoc_gridfs_bucket_t; file_id:Pbson_value_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_gridfs_bucket_find(bucket:Pmongoc_gridfs_bucket_t; filter:Pbson_t; opts:Pbson_t):Pmongoc_cursor_t;cdecl;external libmongoc;
function mongoc_gridfs_bucket_stream_error(stream:Pmongoc_stream_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
procedure mongoc_gridfs_bucket_destroy(bucket:Pmongoc_gridfs_bucket_t);cdecl;external libmongoc;
function mongoc_gridfs_bucket_abort_upload(stream:Pmongoc_stream_t):Tbool;cdecl;external libmongoc;
{$endif}
{ MONGOC_GRIDFS_BUCKET_H  }

// === Konventiert am: 15-5-26 15:15:50 ===


implementation



end.
