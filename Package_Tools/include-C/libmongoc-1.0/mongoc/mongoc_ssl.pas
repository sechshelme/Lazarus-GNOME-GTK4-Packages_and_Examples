unit mongoc_ssl;

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
{$ifndef MONGOC_SSL_H}
{$define MONGOC_SSL_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type
  Pmongoc_ssl_opt_t = ^Tmongoc_ssl_opt_t;
  Tmongoc_ssl_opt_t = record
      pem_file : Pchar;
      pem_pwd : Pchar;
      ca_file : Pchar;
      ca_dir : Pchar;
      crl_file : Pchar;
      weak_cert_validation : Tbool;
      allow_invalid_hostname : Tbool;
      internal : pointer;
      padding : array[0..5] of pointer;
    end;


function mongoc_ssl_opt_get_default:Pmongoc_ssl_opt_t;cdecl;external libmongoc;
{$endif}
{ MONGOC_SSL_H  }

// === Konventiert am: 15-5-26 15:14:48 ===


implementation



end.
