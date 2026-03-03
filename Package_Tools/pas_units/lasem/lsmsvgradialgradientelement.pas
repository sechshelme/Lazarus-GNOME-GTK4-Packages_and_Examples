unit lsmsvgradialgradientelement;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009 Emmanuel Pacaud
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
{$ifndef LSM_SVG_RADIAL_GRADIENT_ELEMENT_H}
{$define LSM_SVG_RADIAL_GRADIENT_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvggradientelement.h>}

type
  PLsmSvgRadialGradientElement = ^TLsmSvgRadialGradientElement;
  TLsmSvgRadialGradientElement = record
      base : TLsmSvgGradientElement;
      cx : TLsmSvgLengthAttribute;
      cy : TLsmSvgLengthAttribute;
      r : TLsmSvgLengthAttribute;
      fx : TLsmSvgLengthAttribute;
      fy : TLsmSvgLengthAttribute;
    end;

  PLsmSvgRadialGradientElementClass = ^TLsmSvgRadialGradientElementClass;
  TLsmSvgRadialGradientElementClass = record
      parent_class : TLsmSvgGradientElementClass;
    end;


function lsm_svg_radial_gradient_element_get_type:TGType;cdecl;external liblasem;
function lsm_svg_radial_gradient_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:05:45 ===

function LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT : TGType;
function LSM_SVG_RADIAL_GRADIENT_ELEMENT(obj : Pointer) : PLsmSvgRadialGradientElement;
function LSM_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass : Pointer) : PLsmSvgRadialGradientElementClass;
function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_RADIAL_GRADIENT_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgRadialGradientElementClass;

implementation

function LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT : TGType;
  begin
    LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT:=lsm_svg_radial_gradient_element_get_type;
  end;

function LSM_SVG_RADIAL_GRADIENT_ELEMENT(obj : Pointer) : PLsmSvgRadialGradientElement;
begin
  Result := PLsmSvgRadialGradientElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT));
end;

function LSM_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass : Pointer) : PLsmSvgRadialGradientElementClass;
begin
  Result := PLsmSvgRadialGradientElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT));
end;

function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT);
end;

function LSM_IS_SVG_RADIAL_GRADIENT_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_RADIAL_GRADIENT_ELEMENT);
end;

function LSM_SVG_RADIAL_GRADIENT_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgRadialGradientElementClass;
begin
  Result := PLsmSvgRadialGradientElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
