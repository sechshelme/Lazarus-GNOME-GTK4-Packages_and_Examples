
unit shumate_raster_renderer;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_raster_renderer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_raster_renderer.h
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
PShumateDataSource  = ^ShumateDataSource;
PShumateRasterRenderer  = ^ShumateRasterRenderer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 James Westman <james@jwestman.net>
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
{$include <shumate/shumate-data-source.h>}
{$include <shumate/shumate-map-source.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_RASTER_RENDERER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateRasterRenderer, shumate_raster_renderer, SHUMATE, RASTER_RENDERER, ShumateMapSource) }
function shumate_raster_renderer_new(data_source:PShumateDataSource):PShumateRasterRenderer;cdecl;external;
(* Const before type ignored *)
function shumate_raster_renderer_new_from_url(url_template:Pchar):PShumateRasterRenderer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function shumate_raster_renderer_new_full(id:Pchar; name:Pchar; license:Pchar; license_uri:Pchar; min_zoom:Tguint; 
           max_zoom:Tguint; tile_size:Tguint; projection:TShumateMapProjection; data_source:PShumateDataSource):PShumateRasterRenderer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function shumate_raster_renderer_new_full_from_url(id:Pchar; name:Pchar; license:Pchar; license_uri:Pchar; min_zoom:Tguint; 
           max_zoom:Tguint; tile_size:Tguint; projection:TShumateMapProjection; url_template:Pchar):PShumateRasterRenderer;cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_RASTER_RENDERER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_RASTER_RENDERER:=shumate_raster_renderer_get_type;
  end;


end.
