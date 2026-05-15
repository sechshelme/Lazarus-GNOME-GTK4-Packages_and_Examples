unit mongoc_cursor;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
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
{$ifndef MONGOC_CURSOR_H}
{$define MONGOC_CURSOR_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-host-list.h"}
type
{ forward decl  }
  Pmongoc_client_t = ^Tmongoc_client_t;
  Tmongoc_client_t = record
      {undefined structure}
    end;


function mongoc_cursor_clone(cursor:Pmongoc_cursor_t):Pmongoc_cursor_t;cdecl;external libmongoc;
procedure mongoc_cursor_destroy(cursor:Pmongoc_cursor_t);cdecl;external libmongoc;
function mongoc_cursor_more(cursor:Pmongoc_cursor_t):Tbool;cdecl;external libmongoc;
function mongoc_cursor_next(cursor:Pmongoc_cursor_t; bson:PPbson_t):Tbool;cdecl;external libmongoc;
function mongoc_cursor_error(cursor:Pmongoc_cursor_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_cursor_error_document(cursor:Pmongoc_cursor_t; error:Pbson_error_t; doc:PPbson_t):Tbool;cdecl;external libmongoc;
procedure mongoc_cursor_get_host(cursor:Pmongoc_cursor_t; host:Pmongoc_host_list_t);cdecl;external libmongoc;
function mongoc_cursor_is_alive(cursor:Pmongoc_cursor_t):Tbool;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_cursor_more); }
function mongoc_cursor_current(cursor:Pmongoc_cursor_t):Pbson_t;cdecl;external libmongoc;
procedure mongoc_cursor_set_batch_size(cursor:Pmongoc_cursor_t; batch_size:Tuint32_t);cdecl;external libmongoc;
function mongoc_cursor_get_batch_size(cursor:Pmongoc_cursor_t):Tuint32_t;cdecl;external libmongoc;
function mongoc_cursor_set_limit(cursor:Pmongoc_cursor_t; limit:Tint64_t):Tbool;cdecl;external libmongoc;
function mongoc_cursor_get_limit(cursor:Pmongoc_cursor_t):Tint64_t;cdecl;external libmongoc;
{ These names include the term "hint" for backward compatibility, should be
 * mongoc_cursor_get_server_id, mongoc_cursor_set_server_id.  }
function mongoc_cursor_set_hint(cursor:Pmongoc_cursor_t; server_id:Tuint32_t):Tbool;cdecl;external libmongoc;
function mongoc_cursor_get_hint(cursor:Pmongoc_cursor_t):Tuint32_t;cdecl;external libmongoc;
function mongoc_cursor_get_id(cursor:Pmongoc_cursor_t):Tint64_t;cdecl;external libmongoc;
procedure mongoc_cursor_set_max_await_time_ms(cursor:Pmongoc_cursor_t; max_await_time_ms:Tuint32_t);cdecl;external libmongoc;
function mongoc_cursor_get_max_await_time_ms(cursor:Pmongoc_cursor_t):Tuint32_t;cdecl;external libmongoc;
function mongoc_cursor_new_from_command_reply(client:Pmongoc_client_t; reply:Pbson_t; server_id:Tuint32_t):Pmongoc_cursor_t;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_cursor_new_from_command_reply_with_opts); }
function mongoc_cursor_new_from_command_reply_with_opts(client:Pmongoc_client_t; reply:Pbson_t; opts:Pbson_t):Pmongoc_cursor_t;cdecl;external libmongoc;
{$endif}
{ MONGOC_CURSOR_H  }

// === Konventiert am: 15-5-26 15:16:09 ===


implementation



end.
