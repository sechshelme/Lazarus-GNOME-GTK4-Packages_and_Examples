
unit shumate_vector_reader_iter;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_vector_reader_iter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_vector_reader_iter.h
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
Pchar  = ^char;
Pdouble  = ^double;
PGValue  = ^GValue;
PShumateGeometryType  = ^ShumateGeometryType;
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
{$include <glib-object.h>}
{*
 * ShumateGeometryType:
 * @SHUMATE_GEOMETRY_TYPE_UNKNOWN: Unknown geometry type
 * @SHUMATE_GEOMETRY_TYPE_POINT: A single point
 * @SHUMATE_GEOMETRY_TYPE_MULTIPOINT: A collection of points
 * @SHUMATE_GEOMETRY_TYPE_LINESTRING: A single line
 * @SHUMATE_GEOMETRY_TYPE_MULTILINESTRING: A collection of lines
 * @SHUMATE_GEOMETRY_TYPE_POLYGON: A single polygon
 * @SHUMATE_GEOMETRY_TYPE_MULTIPOLYGON: A collection of polygons
 *
 * A type of geometry.
 *
 * Since: 1.2
  }
type
  PShumateGeometryType = ^TShumateGeometryType;
  TShumateGeometryType =  Longint;
  Const
    SHUMATE_GEOMETRY_TYPE_UNKNOWN = 0;
    SHUMATE_GEOMETRY_TYPE_POINT = 1;
    SHUMATE_GEOMETRY_TYPE_MULTIPOINT = 2;
    SHUMATE_GEOMETRY_TYPE_LINESTRING = 3;
    SHUMATE_GEOMETRY_TYPE_MULTILINESTRING = 4;
    SHUMATE_GEOMETRY_TYPE_POLYGON = 5;
    SHUMATE_GEOMETRY_TYPE_MULTIPOLYGON = 6;
;

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_READER_ITER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateVectorReaderIter, shumate_vector_reader_iter, SHUMATE, VECTOR_READER_ITER, GObject) }
function shumate_vector_reader_iter_get_layer_count(self:PShumateVectorReaderIter):Tguint;cdecl;external;
procedure shumate_vector_reader_iter_read_layer(self:PShumateVectorReaderIter; index:longint);cdecl;external;
(* Const before type ignored *)
function shumate_vector_reader_iter_read_layer_by_name(self:PShumateVectorReaderIter; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function shumate_vector_reader_iter_get_layer_name(self:PShumateVectorReaderIter):Pchar;cdecl;external;
function shumate_vector_reader_iter_get_layer_extent(self:PShumateVectorReaderIter):Tguint;cdecl;external;
function shumate_vector_reader_iter_get_layer_feature_count(self:PShumateVectorReaderIter):Tguint;cdecl;external;
procedure shumate_vector_reader_iter_read_feature(self:PShumateVectorReaderIter; index:longint);cdecl;external;
function shumate_vector_reader_iter_next_feature(self:PShumateVectorReaderIter):Tgboolean;cdecl;external;
function shumate_vector_reader_iter_get_feature_id(self:PShumateVectorReaderIter):Tguint64;cdecl;external;
(* Const before type ignored *)
function shumate_vector_reader_iter_get_feature_tag(self:PShumateVectorReaderIter; key:Pchar; value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function shumate_vector_reader_iter_get_feature_keys(self:PShumateVectorReaderIter):^Pchar;cdecl;external;
function shumate_vector_reader_iter_get_feature_geometry_type(self:PShumateVectorReaderIter):TShumateGeometryType;cdecl;external;
function shumate_vector_reader_iter_get_feature_point(self:PShumateVectorReaderIter; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external;
function shumate_vector_reader_iter_feature_contains_point(self:PShumateVectorReaderIter; x:Tdouble; y:Tdouble):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_READER_ITER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_VECTOR_READER_ITER:=shumate_vector_reader_iter_get_type;
  end;


end.
