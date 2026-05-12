
unit mongoc_init;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_init.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_init.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

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
{$ifndef MONGOC_INIT_H}
{$define MONGOC_INIT_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}

procedure mongoc_init;cdecl;external;
procedure mongoc_cleanup;cdecl;external;
{$endif}
{ MONGOC_INIT_H  }

implementation


end.
