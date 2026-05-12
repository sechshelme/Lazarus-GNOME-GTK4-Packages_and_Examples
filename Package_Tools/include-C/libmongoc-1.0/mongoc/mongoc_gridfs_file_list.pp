
unit mongoc_gridfs_file_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_gridfs_file_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_gridfs_file_list.h
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
Pmongoc_gridfs_file_list_t  = ^mongoc_gridfs_file_list_t;
Pmongoc_gridfs_file_t  = ^mongoc_gridfs_file_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB Inc.
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
{$ifndef MONGOC_GRIDFS_FILE_LIST_H}
{$define MONGOC_GRIDFS_FILE_LIST_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-gridfs-file.h"}
type

function mongoc_gridfs_file_list_next(list:Pmongoc_gridfs_file_list_t):Pmongoc_gridfs_file_t;cdecl;external;
procedure mongoc_gridfs_file_list_destroy(list:Pmongoc_gridfs_file_list_t);cdecl;external;
function mongoc_gridfs_file_list_error(list:Pmongoc_gridfs_file_list_t; error:Pbson_error_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_GRIDFS_FILE_LIST_H  }

implementation


end.
