
unit mongoc_stream_tls;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_stream_tls.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_stream_tls
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
Pbson_error_t  = ^bson_error_t;
Pchar  = ^char;
Plongint  = ^longint;
Pmongoc_ssl_opt_t  = ^mongoc_ssl_opt_t;
Pmongoc_stream_t  = ^mongoc_stream_t;
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
(* Const before type ignored *)

function mongoc_stream_tls_handshake(stream:Pmongoc_stream_t; host:Pchar; timeout_msec:Tint32_t; events:Plongint; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_stream_tls_handshake_block(stream:Pmongoc_stream_t; host:Pchar; timeout_msec:Tint32_t; error:Pbson_error_t):Tbool;cdecl;external;
function mongoc_stream_tls_do_handshake(stream:Pmongoc_stream_t; timeout_msec:Tint32_t):Tbool;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_stream_tls_handshake); }
(* Const before type ignored *)
function mongoc_stream_tls_check_cert(stream:Pmongoc_stream_t; host:Pchar):Tbool;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_stream_tls_handshake); }
(* Const before type ignored *)
function mongoc_stream_tls_new_with_hostname(base_stream:Pmongoc_stream_t; host:Pchar; opt:Pmongoc_ssl_opt_t; client:longint):Pmongoc_stream_t;cdecl;external;
function mongoc_stream_tls_new(base_stream:Pmongoc_stream_t; opt:Pmongoc_ssl_opt_t; client:longint):Pmongoc_stream_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_stream_tls_new_with_hostname); }
{$endif}
{ MONGOC_STREAM_TLS_H  }

implementation


end.
