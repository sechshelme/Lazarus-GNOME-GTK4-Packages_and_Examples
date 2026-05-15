unit mongoc_stream_tls;

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
{$ifndef MONGOC_STREAM_TLS_H}
{$define MONGOC_STREAM_TLS_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-ssl.h"}
{$include "mongoc-stream.h"}
type

function mongoc_stream_tls_handshake(stream:Pmongoc_stream_t; host:Pchar; timeout_msec:Tint32_t; events:Plongint; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_stream_tls_handshake_block(stream:Pmongoc_stream_t; host:Pchar; timeout_msec:Tint32_t; error:Pbson_error_t):Tbool;cdecl;external libmongoc;
function mongoc_stream_tls_do_handshake(stream:Pmongoc_stream_t; timeout_msec:Tint32_t):Tbool;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_stream_tls_handshake); }
function mongoc_stream_tls_check_cert(stream:Pmongoc_stream_t; host:Pchar):Tbool;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_stream_tls_handshake); }
function mongoc_stream_tls_new_with_hostname(base_stream:Pmongoc_stream_t; host:Pchar; opt:Pmongoc_ssl_opt_t; client:longint):Pmongoc_stream_t;cdecl;external libmongoc;
function mongoc_stream_tls_new(base_stream:Pmongoc_stream_t; opt:Pmongoc_ssl_opt_t; client:longint):Pmongoc_stream_t;cdecl;external libmongoc;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_stream_tls_new_with_hostname); }
{$endif}
{ MONGOC_STREAM_TLS_H  }

// === Konventiert am: 15-5-26 15:14:31 ===


implementation



end.
