unit lsmsvgelement;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
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
{$ifndef LSM_SVG_ELEMENT_H}
{$define LSM_SVG_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgattributes.h>}
{$include <lsmsvgstyle.h>}
{$include <lsmdom.h>}
{$include <cairo.h>}

type
  PLsmSvgElement = ^TLsmSvgElement;
  TLsmSvgElement = record
      element : TLsmDomElement;
      property_bag : TLsmPropertyBag;
      id : TLsmAttribute;
      class_name : TLsmAttribute;
    end;

  PLsmSvgElementClass = ^TLsmSvgElementClass;
  TLsmSvgElementClass = record
      parent_class : TLsmDomElementClass;
      attribute_manager : PLsmAttributeManager;
      category : TLsmSvgElementCategory;
      enable_rendering : procedure (element:PLsmSvgElement);cdecl;
      render : procedure (element:PLsmSvgElement; view:PLsmSvgView);cdecl;
      get_extents : procedure (element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;
      transformed_render : procedure (element:PLsmSvgElement; view:PLsmSvgView);cdecl;
      transformed_get_extents : procedure (element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;
      is_shape_element : Tgboolean;
    end;


function lsm_svg_element_get_type:TGType;cdecl;external liblasem;
function lsm_svg_element_get_category(element:PLsmSvgElement):TLsmSvgElementCategory;cdecl;external liblasem;
procedure lsm_svg_element_render(element:PLsmSvgElement; view:PLsmSvgView);cdecl;external liblasem;
procedure lsm_svg_element_force_render(element:PLsmSvgElement; view:PLsmSvgView);cdecl;external liblasem;
procedure lsm_svg_element_get_extents(element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;external liblasem;
procedure lsm_svg_element_transformed_get_extents(element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:58:54 ===

function LSM_TYPE_SVG_ELEMENT : TGType;
function LSM_SVG_ELEMENT(obj : Pointer) : PLsmSvgElement;
function LSM_SVG_ELEMENT_CLASS(klass : Pointer) : PLsmSvgElementClass;
function LSM_IS_SVG_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgElementClass;

implementation

function LSM_TYPE_SVG_ELEMENT : TGType;
  begin
    LSM_TYPE_SVG_ELEMENT:=lsm_svg_element_get_type;
  end;

function LSM_SVG_ELEMENT(obj : Pointer) : PLsmSvgElement;
begin
  Result := PLsmSvgElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_ELEMENT));
end;

function LSM_SVG_ELEMENT_CLASS(klass : Pointer) : PLsmSvgElementClass;
begin
  Result := PLsmSvgElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_ELEMENT));
end;

function LSM_IS_SVG_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_ELEMENT);
end;

function LSM_IS_SVG_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_ELEMENT);
end;

function LSM_SVG_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgElementClass;
begin
  Result := PLsmSvgElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
