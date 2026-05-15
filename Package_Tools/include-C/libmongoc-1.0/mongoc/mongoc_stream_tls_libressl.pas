unit mongoc_stream_tls_libressl;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2016 MongoDB, Inc.
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
{$ifndef MONGOC_STREAM_TLS_LIBRESSL_H}
{$define MONGOC_STREAM_TLS_LIBRESSL_H}
{$ifdef MONGOC_ENABLE_SSL_LIBRESSL}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}

function mongoc_stream_tls_libressl_new(base_stream:Pmongoc_stream_t; host:Pchar; opt:Pmongoc_ssl_opt_t; client:longint):Pmongoc_stream_t;cdecl;external libmongoc;
{$endif}
{ MONGOC_ENABLE_SSL_LIBRESSL  }
{$endif}
{ MONGOC_STREAM_TLS_LIBRESSL_H  }

// === Konventiert am: 15-5-26 15:14:27 ===


implementation



end.
