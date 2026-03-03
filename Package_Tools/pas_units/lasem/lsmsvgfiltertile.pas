unit lsmsvgfiltertile;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2012 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_SVG_FILTER_TILE_H}
{$define LSM_SVG_FILTER_TILE_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterTile = ^TLsmSvgFilterTile;
  TLsmSvgFilterTile = record
      base : TLsmSvgFilterPrimitive;
      std_deviation : TLsmSvgOneOrTwoDoubleAttribute;
    end;

  PLsmSvgFilterTileClass = ^TLsmSvgFilterTileClass;
  TLsmSvgFilterTileClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_tile_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_tile_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:01:27 ===

function LSM_TYPE_SVG_FILTER_TILE : TGType;
function LSM_SVG_FILTER_TILE(obj : Pointer) : PLsmSvgFilterTile;
function LSM_SVG_FILTER_TILE_CLASS(klass : Pointer) : PLsmSvgFilterTileClass;
function LSM_IS_SVG_FILTER_TILE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_TILE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_TILE_GET_CLASS(obj : Pointer) : PLsmSvgFilterTileClass;

implementation

function LSM_TYPE_SVG_FILTER_TILE : TGType;
  begin
    LSM_TYPE_SVG_FILTER_TILE:=lsm_svg_filter_tile_get_type;
  end;

function LSM_SVG_FILTER_TILE(obj : Pointer) : PLsmSvgFilterTile;
begin
  Result := PLsmSvgFilterTile(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_TILE));
end;

function LSM_SVG_FILTER_TILE_CLASS(klass : Pointer) : PLsmSvgFilterTileClass;
begin
  Result := PLsmSvgFilterTileClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_TILE));
end;

function LSM_IS_SVG_FILTER_TILE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_TILE);
end;

function LSM_IS_SVG_FILTER_TILE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_TILE);
end;

function LSM_SVG_FILTER_TILE_GET_CLASS(obj : Pointer) : PLsmSvgFilterTileClass;
begin
  Result := PLsmSvgFilterTileClass(PGTypeInstance(obj)^.g_class);
end;



end.
