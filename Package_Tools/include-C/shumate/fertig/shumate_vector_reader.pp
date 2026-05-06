
unit shumate_vector_reader;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_vector_reader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_vector_reader
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
PGBytes  = ^GBytes;
PShumateVectorReader  = ^ShumateVectorReader;
PShumateVectorReaderIter  = ^ShumateVectorReaderIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 James Westman <james@jwestman.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include "shumate-vector-reader-iter.h"}

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_READER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateVectorReader, shumate_vector_reader, SHUMATE, VECTOR_READER, GObject) }
function shumate_vector_reader_new(bytes:PGBytes):PShumateVectorReader;cdecl;external;
function shumate_vector_reader_iterate(self:PShumateVectorReader):PShumateVectorReaderIter;cdecl;external;
function shumate_vector_reader_iter_get_reader(self:PShumateVectorReaderIter):PShumateVectorReader;cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_READER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_VECTOR_READER:=shumate_vector_reader_get_type;
  end;


end.
