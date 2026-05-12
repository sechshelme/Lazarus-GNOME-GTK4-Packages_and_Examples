
unit mongoc_client_pool;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_client_pool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_client_pool.h
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
Pmongoc_apm_callbacks_t  = ^mongoc_apm_callbacks_t;
Pmongoc_auto_encryption_opts_t  = ^mongoc_auto_encryption_opts_t;
Pmongoc_client_pool_t  = ^mongoc_client_pool_t;
Pmongoc_client_t  = ^mongoc_client_t;
Pmongoc_server_api_t  = ^mongoc_server_api_t;
Pmongoc_ssl_opt_t  = ^mongoc_ssl_opt_t;
Pmongoc_uri_t  = ^mongoc_uri_t;
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
{$ifndef MONGOC_CLIENT_POOL_H}
{$define MONGOC_CLIENT_POOL_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-apm.h"}
{$include "mongoc-client.h"}
{$include "mongoc-config.h"}
{$ifdef MONGOC_ENABLE_SSL}
{$include "mongoc-ssl.h"}
{$endif}
{$include "mongoc-uri.h"}
type
(* Const before type ignored *)

function mongoc_client_pool_new(uri:Pmongoc_uri_t):Pmongoc_client_pool_t;cdecl;external;
(* Const before type ignored *)
function mongoc_client_pool_new_with_error(uri:Pmongoc_uri_t; error:Pbson_error_t):Pmongoc_client_pool_t;cdecl;external;
procedure mongoc_client_pool_destroy(pool:Pmongoc_client_pool_t);cdecl;external;
function mongoc_client_pool_pop(pool:Pmongoc_client_pool_t):Pmongoc_client_t;cdecl;external;
procedure mongoc_client_pool_push(pool:Pmongoc_client_pool_t; client:Pmongoc_client_t);cdecl;external;
function mongoc_client_pool_try_pop(pool:Pmongoc_client_pool_t):Pmongoc_client_t;cdecl;external;
procedure mongoc_client_pool_max_size(pool:Pmongoc_client_pool_t; max_pool_size:Tuint32_t);cdecl;external;
procedure mongoc_client_pool_min_size(pool:Pmongoc_client_pool_t; min_pool_size:Tuint32_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
{$ifdef MONGOC_ENABLE_SSL}
(* Const before type ignored *)
procedure mongoc_client_pool_set_ssl_opts(pool:Pmongoc_client_pool_t; opts:Pmongoc_ssl_opt_t);cdecl;external;
{$endif}

function mongoc_client_pool_set_apm_callbacks(pool:Pmongoc_client_pool_t; callbacks:Pmongoc_apm_callbacks_t; context:pointer):Tbool;cdecl;external;
function mongoc_client_pool_set_error_api(pool:Pmongoc_client_pool_t; version:Tint32_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_pool_set_appname(pool:Pmongoc_client_pool_t; appname:Pchar):Tbool;cdecl;external;
function mongoc_client_pool_enable_auto_encryption(pool:Pmongoc_client_pool_t; opts:Pmongoc_auto_encryption_opts_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_pool_set_server_api(pool:Pmongoc_client_pool_t; api:Pmongoc_server_api_t; error:Pbson_error_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_CLIENT_POOL_H  }

implementation


end.
