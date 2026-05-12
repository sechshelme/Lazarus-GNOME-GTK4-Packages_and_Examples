
unit mongoc_host_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_host_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_host_list.h
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
Pmongoc_host_list_t  = ^mongoc_host_list_t;
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
{$ifndef MONGOC_HOST_LIST_H}
{$define MONGOC_HOST_LIST_H}
{$include <bson/bson.h>}
{$ifdef _POSIX_HOST_NAME_MAX}

const
  BSON_HOST_NAME_MAX = _POSIX_HOST_NAME_MAX;  
{$else}

const
  BSON_HOST_NAME_MAX = 255;  
{$endif}
type
  Pmongoc_host_list_t = ^Tmongoc_host_list_t;
  Tmongoc_host_list_t = record
      next : Pmongoc_host_list_t;
      host : array[0..(BSON_HOST_NAME_MAX+1)-1] of char;
      host_and_port : array[0..(BSON_HOST_NAME_MAX+7)-1] of char;
      port : Tuint16_t;
      family : longint;
      padding : array[0..3] of pointer;
    end;

{$endif}
{ MONGOC_HOST_LIST_H  }

implementation


end.
