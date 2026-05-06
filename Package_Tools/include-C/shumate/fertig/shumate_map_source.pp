
unit shumate_map_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_map_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_map_source
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PShumateMapProjection  = ^ShumateMapProjection;
PShumateMapSource  = ^ShumateMapSource;
PShumateMapSourceClass  = ^ShumateMapSourceClass;
PShumateTile  = ^ShumateTile;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2010-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
{$ifndef _SHUMATE_MAP_SOURCE_H_}
{$define _SHUMATE_MAP_SOURCE_H_}
{$include <shumate/shumate-tile.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_MAP_SOURCE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (ShumateMapSource, shumate_map_source, SHUMATE, MAP_SOURCE, GObject) }
{*
 * ShumateMapProjection:
 * @SHUMATE_MAP_PROJECTION_MERCATOR: Currently the only supported projection
 *
 * Projections supported by the library.
  }
type
  PShumateMapProjection = ^TShumateMapProjection;
  TShumateMapProjection =  Longint;
  Const
    SHUMATE_MAP_PROJECTION_MERCATOR = 0;
;
{< private > }
type
  PShumateMapSourceClass = ^TShumateMapSourceClass;
  TShumateMapSourceClass = record
      parent_class : TGObjectClass;
      fill_tile_async : procedure (self:PShumateMapSource; tile:PShumateTile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      fill_tile_finish : function (self:PShumateMapSource; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      padding : array[0..15] of Tgpointer;
    end;

(* Const before type ignored *)

function shumate_map_source_get_id(map_source:PShumateMapSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure shumate_map_source_set_id(map_source:PShumateMapSource; id:Pchar);cdecl;external;
(* Const before type ignored *)
function shumate_map_source_get_name(map_source:PShumateMapSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure shumate_map_source_set_name(map_source:PShumateMapSource; name:Pchar);cdecl;external;
(* Const before type ignored *)
function shumate_map_source_get_license(map_source:PShumateMapSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure shumate_map_source_set_license(map_source:PShumateMapSource; license:Pchar);cdecl;external;
(* Const before type ignored *)
function shumate_map_source_get_license_uri(map_source:PShumateMapSource):Pchar;cdecl;external;
(* Const before type ignored *)
procedure shumate_map_source_set_license_uri(map_source:PShumateMapSource; license_uri:Pchar);cdecl;external;
function shumate_map_source_get_min_zoom_level(map_source:PShumateMapSource):Tguint;cdecl;external;
procedure shumate_map_source_set_min_zoom_level(map_source:PShumateMapSource; zoom_level:Tguint);cdecl;external;
function shumate_map_source_get_max_zoom_level(map_source:PShumateMapSource):Tguint;cdecl;external;
procedure shumate_map_source_set_max_zoom_level(map_source:PShumateMapSource; zoom_level:Tguint);cdecl;external;
function shumate_map_source_get_tile_size(map_source:PShumateMapSource):Tguint;cdecl;external;
function shumate_map_source_get_tile_size_at_zoom(map_source:PShumateMapSource; zoom_level:Tdouble):Tdouble;cdecl;external;
procedure shumate_map_source_set_tile_size(map_source:PShumateMapSource; tile_size:Tguint);cdecl;external;
function shumate_map_source_get_projection(map_source:PShumateMapSource):TShumateMapProjection;cdecl;external;
procedure shumate_map_source_set_projection(map_source:PShumateMapSource; projection:TShumateMapProjection);cdecl;external;
function shumate_map_source_get_x(map_source:PShumateMapSource; zoom_level:Tdouble; longitude:Tdouble):Tdouble;cdecl;external;
function shumate_map_source_get_y(map_source:PShumateMapSource; zoom_level:Tdouble; latitude:Tdouble):Tdouble;cdecl;external;
function shumate_map_source_get_longitude(map_source:PShumateMapSource; zoom_level:Tdouble; x:Tdouble):Tdouble;cdecl;external;
function shumate_map_source_get_latitude(map_source:PShumateMapSource; zoom_level:Tdouble; y:Tdouble):Tdouble;cdecl;external;
function shumate_map_source_get_row_count(map_source:PShumateMapSource; zoom_level:Tguint):Tguint;cdecl;external;
function shumate_map_source_get_column_count(map_source:PShumateMapSource; zoom_level:Tguint):Tguint;cdecl;external;
function shumate_map_source_get_meters_per_pixel(map_source:PShumateMapSource; zoom_level:Tdouble; latitude:Tdouble; longitude:Tdouble):Tdouble;cdecl;external;
procedure shumate_map_source_fill_tile_async(self:PShumateMapSource; tile:PShumateTile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function shumate_map_source_fill_tile_finish(self:PShumateMapSource; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _SHUMATE_MAP_SOURCE_H_  }

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_MAP_SOURCE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_MAP_SOURCE:=shumate_map_source_get_type;
  end;


end.
