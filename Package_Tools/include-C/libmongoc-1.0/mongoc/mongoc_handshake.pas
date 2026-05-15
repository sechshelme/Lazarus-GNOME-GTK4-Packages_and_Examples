unit mongoc_handshake;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2016-present MongoDB, Inc.
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
{$ifndef MONGOC_HANDSHAKE_H}
{$define MONGOC_HANDSHAKE_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}

const
  MONGOC_HANDSHAKE_APPNAME_MAX = 128;  

function mongoc_handshake_data_append(driver_name:Pchar; driver_version:Pchar; platform:Pchar):Tbool;cdecl;external libmongoc;
{$endif}

// === Konventiert am: 15-5-26 15:15:38 ===


implementation



end.
