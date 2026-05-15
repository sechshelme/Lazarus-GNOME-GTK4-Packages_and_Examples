
unit mongoc_gridfs_file;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_gridfs_file.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_gridfs_file
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
Pbson_t  = ^bson_t;
Pbson_value_t  = ^bson_value_t;
Pchar  = ^char;
Pmongoc_gridfs_file_opt_t  = ^mongoc_gridfs_file_opt_t;
Pmongoc_gridfs_file_t  = ^mongoc_gridfs_file_t;
Pmongoc_iovec_t  = ^mongoc_iovec_t;
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
{$ifndef MONGOC_GRIDFS_FILE_H}
{$define MONGOC_GRIDFS_FILE_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-socket.h"}
{xxxxxxxxxxx
#define MONGOC_GRIDFS_FILE_STR_HEADER(name)                    \
   extern const char *                                \
   mongoc_gridfs_file_get_##name (mongoc_gridfs_file_t *file); \
   extern void                                        \
   mongoc_gridfs_file_set_##name (mongoc_gridfs_file_t *file, const char *str);


#define MONGOC_GRIDFS_FILE_BSON_HEADER(name)                   \
   extern const bson_t *                              \
   mongoc_gridfs_file_get_##name (mongoc_gridfs_file_t *file); \
   extern void                                        \
   mongoc_gridfs_file_set_##name (mongoc_gridfs_file_t *file,  \
                                  const bson_t *bson);


typedef struct _mongoc_gridfs_file_t mongoc_gridfs_file_t;
typedef struct _mongoc_gridfs_file_opt_t mongoc_gridfs_file_opt_t;
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pmongoc_gridfs_file_opt_t = ^Tmongoc_gridfs_file_opt_t;
  Tmongoc_gridfs_file_opt_t = record
      md5 : Pchar;
      filename : Pchar;
      content_type : Pchar;
      aliases : Pbson_t;
      metadata : Pbson_t;
      chunk_size : Tuint32_t;
    end;

{xxxxxxxxxxx
MONGOC_GRIDFS_FILE_STR_HEADER (md5)
MONGOC_GRIDFS_FILE_STR_HEADER (filename)
MONGOC_GRIDFS_FILE_STR_HEADER (content_type)
MONGOC_GRIDFS_FILE_BSON_HEADER (aliases)
MONGOC_GRIDFS_FILE_BSON_HEADER (metadata)
 }
(* Const before type ignored *)

function mongoc_gridfs_file_get_id(file:Pmongoc_gridfs_file_t):Pbson_value_t;cdecl;external;
function mongoc_gridfs_file_get_length(file:Pmongoc_gridfs_file_t):Tint64_t;cdecl;external;
function mongoc_gridfs_file_get_chunk_size(file:Pmongoc_gridfs_file_t):Tint32_t;cdecl;external;
function mongoc_gridfs_file_get_upload_date(file:Pmongoc_gridfs_file_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_gridfs_file_writev(file:Pmongoc_gridfs_file_t; iov:Pmongoc_iovec_t; iovcnt:Tsize_t; timeout_msec:Tuint32_t):Tssize_t;cdecl;external;
function mongoc_gridfs_file_readv(file:Pmongoc_gridfs_file_t; iov:Pmongoc_iovec_t; iovcnt:Tsize_t; min_bytes:Tsize_t; timeout_msec:Tuint32_t):Tssize_t;cdecl;external;
function mongoc_gridfs_file_seek(file:Pmongoc_gridfs_file_t; delta:Tint64_t; whence:longint):longint;cdecl;external;
function mongoc_gridfs_file_tell(file:Pmongoc_gridfs_file_t):Tuint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_gridfs_file_set_id(file:Pmongoc_gridfs_file_t; id:Pbson_value_t; error:Pbson_error_t):Tbool;cdecl;external;
function mongoc_gridfs_file_save(file:Pmongoc_gridfs_file_t):Tbool;cdecl;external;
procedure mongoc_gridfs_file_destroy(file:Pmongoc_gridfs_file_t);cdecl;external;
function mongoc_gridfs_file_error(file:Pmongoc_gridfs_file_t; error:Pbson_error_t):Tbool;cdecl;external;
function mongoc_gridfs_file_remove(file:Pmongoc_gridfs_file_t; error:Pbson_error_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_GRIDFS_FILE_H  }

implementation


end.
