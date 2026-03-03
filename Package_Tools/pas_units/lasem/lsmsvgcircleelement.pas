unit lsmsvgcircleelement;

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
{$ifndef LSM_SVG_CIRCLE_ELEMENT_H}
{$define LSM_SVG_CIRCLE_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgtransformable.h>}

type
  PLsmSvgCircleElement = ^TLsmSvgCircleElement;
  TLsmSvgCircleElement = record
      base : TLsmSvgTransformable;
      cx : TLsmSvgLengthAttribute;
      cy : TLsmSvgLengthAttribute;
      r : TLsmSvgLengthAttribute;
    end;

  PLsmSvgCircleElementClass = ^TLsmSvgCircleElementClass;
  TLsmSvgCircleElementClass = record
      base_class : TLsmSvgTransformableClass;
    end;


function lsm_svg_circle_element_get_type:TGType;cdecl;external liblasem;
function lsm_svg_circle_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:56:49 ===

function LSM_TYPE_SVG_CIRCLE_ELEMENT : TGType;
function LSM_SVG_CIRCLE_ELEMENT(obj : Pointer) : PLsmSvgCircleElement;
function LSM_SVG_CIRCLE_ELEMENT_CLASS(klass : Pointer) : PLsmSvgCircleElementClass;
function LSM_IS_SVG_CIRCLE_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_CIRCLE_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_CIRCLE_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgCircleElementClass;

implementation

function LSM_TYPE_SVG_CIRCLE_ELEMENT : TGType;
  begin
    LSM_TYPE_SVG_CIRCLE_ELEMENT:=lsm_svg_circle_element_get_type;
  end;

function LSM_SVG_CIRCLE_ELEMENT(obj : Pointer) : PLsmSvgCircleElement;
begin
  Result := PLsmSvgCircleElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_CIRCLE_ELEMENT));
end;

function LSM_SVG_CIRCLE_ELEMENT_CLASS(klass : Pointer) : PLsmSvgCircleElementClass;
begin
  Result := PLsmSvgCircleElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_CIRCLE_ELEMENT));
end;

function LSM_IS_SVG_CIRCLE_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_CIRCLE_ELEMENT);
end;

function LSM_IS_SVG_CIRCLE_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_CIRCLE_ELEMENT);
end;

function LSM_SVG_CIRCLE_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgCircleElementClass;
begin
  Result := PLsmSvgCircleElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
