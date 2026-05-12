
unit mongoc_read_prefs;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_read_prefs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_read_prefs.h
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
Pbson_t  = ^bson_t;
Pmongoc_read_mode_t  = ^mongoc_read_mode_t;
Pmongoc_read_prefs_t  = ^mongoc_read_prefs_t;
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
{$ifndef MONGOC_READ_PREFS_H}
{$define MONGOC_READ_PREFS_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-config.h"}

const
  MONGOC_NO_MAX_STALENESS = -(1);  
  MONGOC_SMALLEST_MAX_STALENESS_SECONDS = 90;  
type
{* Represents $readPreference.mode of 'primary'  }
{* Represents $readPreference.mode of 'secondary'  }
{* Represents $readPreference.mode of 'primaryPreferred'  }
{* Represents $readPreference.mode of 'secondaryPreferred'  }
{* Represents $readPreference.mode of 'nearest'  }

  Pmongoc_read_mode_t = ^Tmongoc_read_mode_t;
  Tmongoc_read_mode_t =  Longint;
  Const
    MONGOC_READ_PRIMARY = 1 shl 0;
    MONGOC_READ_SECONDARY = 1 shl 1;
    MONGOC_READ_PRIMARY_PREFERRED = (1 shl 2) or MONGOC_READ_PRIMARY;
    MONGOC_READ_SECONDARY_PREFERRED = (1 shl 2) or MONGOC_READ_SECONDARY;
    MONGOC_READ_NEAREST = (1 shl 3) or MONGOC_READ_SECONDARY;
;

function mongoc_read_prefs_new(read_mode:Tmongoc_read_mode_t):Pmongoc_read_prefs_t;cdecl;external;
(* Const before type ignored *)
function mongoc_read_prefs_copy(read_prefs:Pmongoc_read_prefs_t):Pmongoc_read_prefs_t;cdecl;external;
procedure mongoc_read_prefs_destroy(read_prefs:Pmongoc_read_prefs_t);cdecl;external;
(* Const before type ignored *)
function mongoc_read_prefs_get_mode(read_prefs:Pmongoc_read_prefs_t):Tmongoc_read_mode_t;cdecl;external;
procedure mongoc_read_prefs_set_mode(read_prefs:Pmongoc_read_prefs_t; mode:Tmongoc_read_mode_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_read_prefs_get_tags(read_prefs:Pmongoc_read_prefs_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_read_prefs_set_tags(read_prefs:Pmongoc_read_prefs_t; tags:Pbson_t);cdecl;external;
(* Const before type ignored *)
procedure mongoc_read_prefs_add_tag(read_prefs:Pmongoc_read_prefs_t; tag:Pbson_t);cdecl;external;
(* Const before type ignored *)
function mongoc_read_prefs_get_max_staleness_seconds(read_prefs:Pmongoc_read_prefs_t):Tint64_t;cdecl;external;
procedure mongoc_read_prefs_set_max_staleness_seconds(read_prefs:Pmongoc_read_prefs_t; max_staleness_seconds:Tint64_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_read_prefs_get_hedge(read_prefs:Pmongoc_read_prefs_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_read_prefs_set_hedge(read_prefs:Pmongoc_read_prefs_t; hedge:Pbson_t);cdecl;external;
(* Const before type ignored *)
function mongoc_read_prefs_is_valid(read_prefs:Pmongoc_read_prefs_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_READ_PREFS_H  }

implementation


end.
