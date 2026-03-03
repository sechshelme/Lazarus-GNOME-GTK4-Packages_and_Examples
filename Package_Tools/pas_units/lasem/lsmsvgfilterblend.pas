unit lsmsvgfilterblend;

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
{$ifndef LSM_SVG_FILTER_BLEND_H}
{$define LSM_SVG_FILTER_BLEND_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterBlend = ^TLsmSvgFilterBlend;
  TLsmSvgFilterBlend = record
      base : TLsmSvgFilterPrimitive;
      in2 : TLsmAttribute;
      mode : TLsmSvgBlendingModeAttribute;
    end;

  PLsmSvgFilterBlendClass = ^TLsmSvgFilterBlendClass;
  TLsmSvgFilterBlendClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_blend_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_blend_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:59:12 ===

function LSM_TYPE_SVG_FILTER_BLEND : TGType;
function LSM_SVG_FILTER_BLEND(obj : Pointer) : PLsmSvgFilterBlend;
function LSM_SVG_FILTER_BLEND_CLASS(klass : Pointer) : PLsmSvgFilterBlendClass;
function LSM_IS_SVG_FILTER_BLEND(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_BLEND_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_BLEND_GET_CLASS(obj : Pointer) : PLsmSvgFilterBlendClass;

implementation

function LSM_TYPE_SVG_FILTER_BLEND : TGType;
  begin
    LSM_TYPE_SVG_FILTER_BLEND:=lsm_svg_filter_blend_get_type;
  end;

function LSM_SVG_FILTER_BLEND(obj : Pointer) : PLsmSvgFilterBlend;
begin
  Result := PLsmSvgFilterBlend(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_BLEND));
end;

function LSM_SVG_FILTER_BLEND_CLASS(klass : Pointer) : PLsmSvgFilterBlendClass;
begin
  Result := PLsmSvgFilterBlendClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_BLEND));
end;

function LSM_IS_SVG_FILTER_BLEND(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_BLEND);
end;

function LSM_IS_SVG_FILTER_BLEND_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_BLEND);
end;

function LSM_SVG_FILTER_BLEND_GET_CLASS(obj : Pointer) : PLsmSvgFilterBlendClass;
begin
  Result := PLsmSvgFilterBlendClass(PGTypeInstance(obj)^.g_class);
end;



end.
