unit mongoc_change_stream;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2017-present MongoDB, Inc.
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
{$ifndef MONGOC_CHANGE_STREAM_H}
{$define MONGOC_CHANGE_STREAM_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type

procedure mongoc_change_stream_destroy(para1:Pmongoc_change_stream_t);cdecl;external libmongoc;
function mongoc_change_stream_get_resume_token(para1:Pmongoc_change_stream_t):Pbson_t;cdecl;external libmongoc;
function mongoc_change_stream_next(para1:Pmongoc_change_stream_t; para2:PPbson_t):Tbool;cdecl;external libmongoc;
function mongoc_change_stream_error_document(para1:Pmongoc_change_stream_t; para2:Pbson_error_t; para3:PPbson_t):Tbool;cdecl;external libmongoc;
{$endif}
{ MONGOC_CHANGE_STREAM_H  }

// === Konventiert am: 15-5-26 15:16:29 ===


implementation



end.
