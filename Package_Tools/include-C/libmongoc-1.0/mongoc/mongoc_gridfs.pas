unit mongoc_gridfs;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB Inc.
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
{$ifndef MONGOC_GRIDFS_H}
{$define MONGOC_GRIDFS_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-stream.h"}
{$include "mongoc-gridfs-file.h"}
{$include "mongoc-collection.h"}
{$include "mongoc-gridfs-file-list.h"}
type

function mongoc_gridfs_create_file_from_stream(gridfs:Pmongoc_gridfs_t; stream:Pmongoc_stream_t; opt:Pmongoc_gridfs_file_opt_t):Pmongoc_gridfs_file_t;cdecl;external libmongoc;
function mongoc_gridfs_create_file(gridfs:Pmongoc_gridfs_t; opt:Pmongoc_gridfs_file_opt_t):Pmongoc_gridfs_file_t;cdecl;external libmongoc;
function mongoc_gridfs_find(gridfs:Pmongoc_gridfs_t; query:Pbson_t):Pmongoc_gridfs_file_list_t;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_gridfs_find_with_opts); }
function mongoc_gridfs_find_one(gridfs:Pmongoc_gridfs_t; query:Pbson_t; error:Pbson_error_t):Pmongoc_gridfs_file_t;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_gridfs_find_one_with_opts); }
function mongoc_gridfs_find_with_opts(gridfs:Pmongoc_gridfs_t; filter:Pbson_t; opts:Pbson_t):Pmongoc_gridfs_file_list_t;cdecl;external libmongoc;
function mongoc_gridfs_find_one_with_opts(gridfs:Pmongoc_gridfs_t; filter:Pbson_t; opts:Pbson_t; error:Pbson_error_t):Pmongoc_gridfs_file_t;cdecl;external libmongoc;
function mongoc_gridfs_find_one_by_filename(gridfs:Pmongoc_gridfs_t; filename:Pchar; error:Pbson_error_t):Pmongoc_gridfs_file_t;cdecl;external libmongoc;
function mongoc_gridfs_drop(gridfs:Pmongoc_gridfs_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
procedure mongoc_gridfs_destroy(gridfs:Pmongoc_gridfs_t);cdecl;external libmongoc;
function mongoc_gridfs_get_files(gridfs:Pmongoc_gridfs_t):Pmongoc_collection_t;cdecl;external libmongoc;
function mongoc_gridfs_get_chunks(gridfs:Pmongoc_gridfs_t):Pmongoc_collection_t;cdecl;external libmongoc;
function mongoc_gridfs_remove_by_filename(gridfs:Pmongoc_gridfs_t; filename:Pchar; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
{$endif}
{ MONGOC_GRIDFS_H  }

// === Konventiert am: 15-5-26 15:15:53 ===


implementation



end.
