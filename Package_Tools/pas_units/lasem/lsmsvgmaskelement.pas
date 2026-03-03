unit lsmsvgmaskelement;

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
{$ifndef LSM_SVG_MASK_ELEMENT_H}
{$define LSM_SVG_MASK_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgelement.h>}

type
  PLsmSvgMaskElement = ^TLsmSvgMaskElement;
  TLsmSvgMaskElement = record
      element : TLsmSvgElement;
      x : TLsmSvgLengthAttribute;
      y : TLsmSvgLengthAttribute;
      width : TLsmSvgLengthAttribute;
      height : TLsmSvgLengthAttribute;
      units : TLsmSvgPatternUnitsAttribute;
      content_units : TLsmSvgPatternUnitsAttribute;
      enable_rendering : Tgboolean;
    end;

  PLsmSvgMaskElementClass = ^TLsmSvgMaskElementClass;
  TLsmSvgMaskElementClass = record
      element_class : TLsmSvgElementClass;
    end;


function lsm_svg_mask_element_get_type:TGType;cdecl;external liblasem;
function lsm_svg_mask_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:05:21 ===

function LSM_TYPE_SVG_MASK_ELEMENT : TGType;
function LSM_SVG_MASK_ELEMENT(obj : Pointer) : PLsmSvgMaskElement;
function LSM_SVG_MASK_ELEMENT_CLASS(klass : Pointer) : PLsmSvgMaskElementClass;
function LSM_IS_SVG_MASK_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_MASK_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_MASK_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgMaskElementClass;

implementation

function LSM_TYPE_SVG_MASK_ELEMENT : TGType;
  begin
    LSM_TYPE_SVG_MASK_ELEMENT:=lsm_svg_mask_element_get_type;
  end;

function LSM_SVG_MASK_ELEMENT(obj : Pointer) : PLsmSvgMaskElement;
begin
  Result := PLsmSvgMaskElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_MASK_ELEMENT));
end;

function LSM_SVG_MASK_ELEMENT_CLASS(klass : Pointer) : PLsmSvgMaskElementClass;
begin
  Result := PLsmSvgMaskElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_MASK_ELEMENT));
end;

function LSM_IS_SVG_MASK_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_MASK_ELEMENT);
end;

function LSM_IS_SVG_MASK_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_MASK_ELEMENT);
end;

function LSM_SVG_MASK_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgMaskElementClass;
begin
  Result := PLsmSvgMaskElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
