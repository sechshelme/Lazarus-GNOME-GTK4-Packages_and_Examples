
unit bson_reader;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_reader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_reader.h
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
Pbool  = ^bool;
Pbson_error_t  = ^bson_error_t;
Pbson_reader_t  = ^bson_reader_t;
Pbson_t  = ^bson_t;
Pchar  = ^char;
Puint8_t  = ^uint8_t;
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
{$include <bson/bson-prelude.h>}
{$ifndef BSON_READER_H}
{$define BSON_READER_H}
{$include <bson/bson-compat.h>}
{$include <bson/bson-oid.h>}
{$include <bson/bson-types.h>}

const
  BSON_ERROR_READER_BADFD = 1;  
{
 *--------------------------------------------------------------------------
 *
 * bson_reader_read_func_t --
 *
 *       This function is a callback used by bson_reader_t to read the
 *       next chunk of data from the underlying opaque file descriptor.
 *
 *       This function is meant to operate similar to the read() function
 *       as part of libc on UNIX-like systems.
 *
 * Parameters:
 *       @handle: The handle to read from.
 *       @buf: The buffer to read into.
 *       @count: The number of bytes to read.
 *
 * Returns:
 *       0 for end of stream.
 *       -1 for read failure.
 *       Greater than zero for number of bytes read into @buf.
 *
 * Side effects:
 *       None.
 *
 *--------------------------------------------------------------------------
  }
{ IN  }
{ IN  }
type

  Tbson_reader_read_func_t = function (handle:pointer; buf:pointer; count:Tsize_t):Tssize_t;cdecl;
{ IN  }
{
 *--------------------------------------------------------------------------
 *
 * bson_reader_destroy_func_t --
 *
 *       Destroy callback to release any resources associated with the
 *       opaque handle.
 *
 * Parameters:
 *       @handle: the handle provided to bson_reader_new_from_handle().
 *
 * Returns:
 *       None.
 *
 * Side effects:
 *       None.
 *
 *--------------------------------------------------------------------------
  }

  Tbson_reader_destroy_func_t = procedure (handle:pointer);cdecl;
{ IN  }

function bson_reader_new_from_handle(handle:pointer; rf:Tbson_reader_read_func_t; df:Tbson_reader_destroy_func_t):Pbson_reader_t;cdecl;external;
function bson_reader_new_from_fd(fd:longint; close_on_destroy:Tbool):Pbson_reader_t;cdecl;external;
(* Const before type ignored *)
function bson_reader_new_from_file(path:Pchar; error:Pbson_error_t):Pbson_reader_t;cdecl;external;
(* Const before type ignored *)
function bson_reader_new_from_data(data:Puint8_t; length:Tsize_t):Pbson_reader_t;cdecl;external;
procedure bson_reader_destroy(reader:Pbson_reader_t);cdecl;external;
procedure bson_reader_set_read_func(reader:Pbson_reader_t; func:Tbson_reader_read_func_t);cdecl;external;
procedure bson_reader_set_destroy_func(reader:Pbson_reader_t; func:Tbson_reader_destroy_func_t);cdecl;external;
(* Const before type ignored *)
function bson_reader_read(reader:Pbson_reader_t; reached_eof:Pbool):Pbson_t;cdecl;external;
function bson_reader_tell(reader:Pbson_reader_t):Toff_t;cdecl;external;
procedure bson_reader_reset(reader:Pbson_reader_t);cdecl;external;
{$endif}
{ BSON_READER_H  }

implementation


end.
