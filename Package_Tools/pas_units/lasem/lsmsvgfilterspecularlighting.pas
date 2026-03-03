unit lsmsvgfilterspecularlighting;

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
{$ifndef LSM_SVG_FILTER_SPECULAR_LIGHTING_H}
{$define LSM_SVG_FILTER_SPECULAR_LIGHTING_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterSpecularLighting = ^TLsmSvgFilterSpecularLighting;
  TLsmSvgFilterSpecularLighting = record
      base : TLsmSvgFilterPrimitive;
      surface_scale : TLsmSvgDoubleAttribute;
      specular_constant : TLsmSvgDoubleAttribute;
      specular_exponent : TLsmSvgDoubleAttribute;
      kernel_unit_length : TLsmSvgOneOrTwoDoubleAttribute;
    end;

  PLsmSvgFilterSpecularLightingClass = ^TLsmSvgFilterSpecularLightingClass;
  TLsmSvgFilterSpecularLightingClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_specular_lighting_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_specular_lighting_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:01:16 ===

function LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING : TGType;
function LSM_SVG_FILTER_SPECULAR_LIGHTING(obj : Pointer) : PLsmSvgFilterSpecularLighting;
function LSM_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass : Pointer) : PLsmSvgFilterSpecularLightingClass;
function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_SPECULAR_LIGHTING_GET_CLASS(obj : Pointer) : PLsmSvgFilterSpecularLightingClass;

implementation

function LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING : TGType;
  begin
    LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING:=lsm_svg_filter_specular_lighting_get_type;
  end;

function LSM_SVG_FILTER_SPECULAR_LIGHTING(obj : Pointer) : PLsmSvgFilterSpecularLighting;
begin
  Result := PLsmSvgFilterSpecularLighting(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING));
end;

function LSM_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass : Pointer) : PLsmSvgFilterSpecularLightingClass;
begin
  Result := PLsmSvgFilterSpecularLightingClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING));
end;

function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING);
end;

function LSM_IS_SVG_FILTER_SPECULAR_LIGHTING_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_SPECULAR_LIGHTING);
end;

function LSM_SVG_FILTER_SPECULAR_LIGHTING_GET_CLASS(obj : Pointer) : PLsmSvgFilterSpecularLightingClass;
begin
  Result := PLsmSvgFilterSpecularLightingClass(PGTypeInstance(obj)^.g_class);
end;



end.
