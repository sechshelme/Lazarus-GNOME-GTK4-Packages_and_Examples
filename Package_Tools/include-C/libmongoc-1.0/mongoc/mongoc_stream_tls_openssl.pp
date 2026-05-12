
unit mongoc_stream_tls_openssl;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_stream_tls_openssl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_stream_tls_openssl.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pmongoc_ssl_opt_t  = ^mongoc_ssl_opt_t;
Pmongoc_stream_t  = ^mongoc_stream_t;
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
{$ifndef MONGOC_STREAM_TLS_OPENSSL_H}
{$define MONGOC_STREAM_TLS_OPENSSL_H}
{$ifdef MONGOC_ENABLE_SSL_OPENSSL}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
(* Const before type ignored *)

function mongoc_stream_tls_openssl_new(base_stream:Pmongoc_stream_t; host:Pchar; opt:Pmongoc_ssl_opt_t; client:longint):Pmongoc_stream_t;cdecl;external;
{$endif}
{ MONGOC_ENABLE_SSL_OPENSSL  }
{$endif}
{ MONGOC_STREAM_TLS_OPENSSL_H  }

implementation


end.
