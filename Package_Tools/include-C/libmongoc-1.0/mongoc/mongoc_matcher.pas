unit mongoc_matcher;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2014 MongoDB, Inc.
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
{$ifndef MONGOC_MATCHER_H}
{$define MONGOC_MATCHER_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
type

function mongoc_matcher_new(query:Pbson_t; error:Pbson_error_t):Pmongoc_matcher_t;cdecl;external libmongoc;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
function mongoc_matcher_match(matcher:Pmongoc_matcher_t; document:Pbson_t):Tbool;cdecl;external libmongoc;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
procedure mongoc_matcher_destroy(matcher:Pmongoc_matcher_t);cdecl;external libmongoc;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
{$endif}
{ MONGOC_MATCHER_H  }

// === Konventiert am: 15-5-26 15:15:17 ===


implementation



end.
