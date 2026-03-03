unit lsmmathmlelement;

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
{$ifndef LSM_MATHML_ELEMENT_H}
{$define LSM_MATHML_ELEMENT_H}
{$include <lsmdomelement.h>}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlutils.h>}
{$include <lsmmathmlstyle.h>}
{$include <lsmmathmlattributes.h>}
{$include <cairo.h>}
type
  PLsmMathmlElementStyle = ^TLsmMathmlElementStyle;
  TLsmMathmlElementStyle = record
      math_family : Pchar;
      math_variant : TLsmMathmlVariant;
      math_size : Tdouble;
      math_color : TLsmMathmlColor;
      math_background : TLsmMathmlColor;
    end;

type
{ View  }
  PLsmMathmlElement = ^TLsmMathmlElement;
  TLsmMathmlElement = record
      element : TLsmDomElement;
      class_name : TLsmAttribute;
      id : TLsmAttribute;
      href : TLsmAttribute;
      style : TLsmMathmlElementStyle;
      need_update : Tgboolean;
      need_children_update : Tgboolean;
      need_measure : Tgboolean;
      need_layout : Tgboolean;
      x : Tdouble;
      y : Tdouble;
      bbox : TLsmMathmlBbox;
    end;

  PLsmMathmlElementClass = ^TLsmMathmlElementClass;
  TLsmMathmlElementClass = record
      parent_class : TLsmDomElementClass;
      attribute_manager : PLsmAttributeManager;
      update : procedure (element:PLsmMathmlElement; style:PLsmMathmlStyle);cdecl;
      update_children : function (element:PLsmMathmlElement; style:PLsmMathmlStyle):Tgboolean;cdecl;
      measure : function (element:PLsmMathmlElement; view:PLsmMathmlView; bbox:PLsmMathmlBbox):PLsmMathmlBbox;cdecl;
      layout : procedure (element:PLsmMathmlElement; view:PLsmMathmlView; x:Tdouble; y:Tdouble; bbox:PLsmMathmlBbox);cdecl;
      render : procedure (element:PLsmMathmlElement; view:PLsmMathmlView);cdecl;
      get_embellished_core : function (self:PLsmMathmlElement):PLsmMathmlOperatorElement;cdecl;
      is_inferred_row : function (self:PLsmMathmlElement):Tgboolean;cdecl;
    end;


function lsm_mathml_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_element_update(element:PLsmMathmlElement; style:PLsmMathmlStyle):Tgboolean;cdecl;external liblasem;
function lsm_mathml_element_measure(element:PLsmMathmlElement; view:PLsmMathmlView; stretch_bbox:PLsmMathmlBbox):PLsmMathmlBbox;cdecl;external liblasem;
procedure lsm_mathml_element_layout(element:PLsmMathmlElement; view:PLsmMathmlView; x:Tdouble; y:Tdouble; bbox:PLsmMathmlBbox);cdecl;external liblasem;
procedure lsm_mathml_element_render(element:PLsmMathmlElement; view:PLsmMathmlView);cdecl;external liblasem;
function lsm_mathml_element_get_embellished_core(self:PLsmMathmlElement):PLsmMathmlOperatorElement;cdecl;external liblasem;
function lsm_mathml_element_get_bbox(self:PLsmMathmlElement):PLsmMathmlBbox;cdecl;external liblasem;
function lsm_mathml_element_is_inferred_row(self:PLsmMathmlElement):Tgboolean;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:39:47 ===

function LSM_TYPE_MATHML_ELEMENT : TGType;
function LSM_MATHML_ELEMENT(obj : Pointer) : PLsmMathmlElement;
function LSM_MATHML_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlElementClass;
function LSM_IS_MATHML_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlElementClass;

implementation

function LSM_TYPE_MATHML_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_ELEMENT:=lsm_mathml_element_get_type;
  end;

function LSM_MATHML_ELEMENT(obj : Pointer) : PLsmMathmlElement;
begin
  Result := PLsmMathmlElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ELEMENT));
end;

function LSM_MATHML_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlElementClass;
begin
  Result := PLsmMathmlElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ELEMENT));
end;

function LSM_IS_MATHML_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_ELEMENT);
end;

function LSM_IS_MATHML_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_ELEMENT);
end;

function LSM_MATHML_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlElementClass;
begin
  Result := PLsmMathmlElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
