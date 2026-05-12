
unit mongoc_stream_buffered;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_stream_buffered.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_stream_buffered.h
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
Pmongoc_stream_t  = ^mongoc_stream_t;
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
{$ifndef MONGOC_STREAM_BUFFERED_H}
{$define MONGOC_STREAM_BUFFERED_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-stream.h"}

function mongoc_stream_buffered_new(base_stream:Pmongoc_stream_t; buffer_size:Tsize_t):Pmongoc_stream_t;cdecl;external;
{$endif}
{ MONGOC_STREAM_BUFFERED_H  }

implementation


end.
