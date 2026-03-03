unit lsmsvgfilterprimitive;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2010 Emmanuel Pacaud
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
{$ifndef LSM_SVG_FILTER_PRIMITIVE_H}
{$define LSM_SVG_FILTER_PRIMITIVE_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgelement.h>}

type
  PLsmSvgFilterPrimitive = ^TLsmSvgFilterPrimitive;
  TLsmSvgFilterPrimitive = record
      element : TLsmSvgElement;
      x : TLsmSvgLengthAttribute;
      y : TLsmSvgLengthAttribute;
      width : TLsmSvgLengthAttribute;
      height : TLsmSvgLengthAttribute;
      in : TLsmAttribute;
      result : TLsmAttribute;
    end;

  PLsmSvgFilterPrimitiveClass = ^TLsmSvgFilterPrimitiveClass;
  TLsmSvgFilterPrimitiveClass = record
      element_class : TLsmSvgElementClass;
      apply : procedure (self:PLsmSvgFilterPrimitive; view:PLsmSvgView; input:Pchar; output:Pchar; subregion:PLsmBox);cdecl;
    end;


function lsm_svg_filter_primitive_get_type:TGType;cdecl;external liblasem;
procedure lsm_svg_filter_primitive_apply(self:PLsmSvgFilterPrimitive; view:PLsmSvgView);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:01:13 ===

function LSM_TYPE_SVG_FILTER_PRIMITIVE : TGType;
function LSM_SVG_FILTER_PRIMITIVE(obj : Pointer) : PLsmSvgFilterPrimitive;
function LSM_SVG_FILTER_PRIMITIVE_CLASS(klass : Pointer) : PLsmSvgFilterPrimitiveClass;
function LSM_IS_SVG_FILTER_PRIMITIVE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_PRIMITIVE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_PRIMITIVE_GET_CLASS(obj : Pointer) : PLsmSvgFilterPrimitiveClass;

implementation

function LSM_TYPE_SVG_FILTER_PRIMITIVE : TGType;
  begin
    LSM_TYPE_SVG_FILTER_PRIMITIVE:=lsm_svg_filter_primitive_get_type;
  end;

function LSM_SVG_FILTER_PRIMITIVE(obj : Pointer) : PLsmSvgFilterPrimitive;
begin
  Result := PLsmSvgFilterPrimitive(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_PRIMITIVE));
end;

function LSM_SVG_FILTER_PRIMITIVE_CLASS(klass : Pointer) : PLsmSvgFilterPrimitiveClass;
begin
  Result := PLsmSvgFilterPrimitiveClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_PRIMITIVE));
end;

function LSM_IS_SVG_FILTER_PRIMITIVE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_PRIMITIVE);
end;

function LSM_IS_SVG_FILTER_PRIMITIVE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_PRIMITIVE);
end;

function LSM_SVG_FILTER_PRIMITIVE_GET_CLASS(obj : Pointer) : PLsmSvgFilterPrimitiveClass;
begin
  Result := PLsmSvgFilterPrimitiveClass(PGTypeInstance(obj)^.g_class);
end;



end.
