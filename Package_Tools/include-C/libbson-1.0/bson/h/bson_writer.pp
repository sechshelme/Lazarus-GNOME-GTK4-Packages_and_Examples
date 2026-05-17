
unit bson_writer;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_writer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_writer.h
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
Pbson_writer_t  = ^bson_writer_t;
Psize_t  = ^size_t;
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
{$ifndef BSON_WRITER_H}
{$define BSON_WRITER_H}
{$include "bson.h"}
{*
 * bson_writer_t:
 *
 * The bson_writer_t structure is a helper for writing a series of BSON
 * documents to a single malloc() buffer. You can provide a realloc() style
 * function to grow the buffer as you go.
 *
 * This is useful if you want to build a series of BSON documents right into
 * the target buffer for an outgoing packet. The offset parameter allows you to
 * start at an offset of the target buffer.
  }
type

function bson_writer_new(buf:PPuint8_t; buflen:Psize_t; offset:Tsize_t; realloc_func:Tbson_realloc_func; realloc_func_ctx:pointer):Pbson_writer_t;cdecl;external;
procedure bson_writer_destroy(writer:Pbson_writer_t);cdecl;external;
function bson_writer_get_length(writer:Pbson_writer_t):Tsize_t;cdecl;external;
function bson_writer_begin(writer:Pbson_writer_t; bson:PPbson_t):Tbool;cdecl;external;
procedure bson_writer_end(writer:Pbson_writer_t);cdecl;external;
procedure bson_writer_rollback(writer:Pbson_writer_t);cdecl;external;
{$endif}
{ BSON_WRITER_H  }

implementation


end.
