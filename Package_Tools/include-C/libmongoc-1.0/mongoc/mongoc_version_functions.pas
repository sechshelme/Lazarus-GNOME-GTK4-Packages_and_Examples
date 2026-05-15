unit mongoc_version_functions;

interface

uses
  fp_mongoc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2015 MongoDB, Inc.
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
{$ifndef MONGOC_VERSION_FUNCTIONS_H}
{$define MONGOC_VERSION_FUNCTIONS_H}
{$include <bson/bson.h> /* for "bool" */}
{$include "mongoc-macros.h"}

function mongoc_get_major_version:longint;cdecl;external libmongoc;
function mongoc_get_minor_version:longint;cdecl;external libmongoc;
function mongoc_get_micro_version:longint;cdecl;external libmongoc;
function mongoc_get_version:Pchar;cdecl;external libmongoc;
function mongoc_check_version(required_major:longint; required_minor:longint; required_micro:longint):Tbool;cdecl;external libmongoc;
{$endif}
{ MONGOC_VERSION_FUNCTIONS_H  }

// === Konventiert am: 15-5-26 15:14:11 ===


implementation



end.
