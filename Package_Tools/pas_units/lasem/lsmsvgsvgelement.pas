unit lsmsvgsvgelement;

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
{$ifndef LSM_SVG_SVG_ELEMENT_H}
{$define LSM_SVG_SVG_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgelement.h>}

type
{        LsmSvgStyle *default_style; }
  PLsmSvgSvgElement = ^TLsmSvgSvgElement;
  TLsmSvgSvgElement = record
      element : TLsmSvgElement;
      x : TLsmSvgLengthAttribute;
      y : TLsmSvgLengthAttribute;
      width : TLsmSvgLengthAttribute;
      height : TLsmSvgLengthAttribute;
      viewbox : TLsmSvgViewboxAttribute;
      preserve_aspect_ratio : TLsmSvgPreserveAspectRatioAttribute;
      svg_box : TLsmBox;
    end;

  PLsmSvgSvgElementClass = ^TLsmSvgSvgElementClass;
  TLsmSvgSvgElementClass = record
      element_class : TLsmSvgElementClass;
    end;


function lsm_svg_svg_element_get_type:TGType;cdecl;external liblasem;
function lsm_svg_svg_element_new:PLsmDomNode;cdecl;external liblasem;
procedure lsm_svg_svg_element_measure(self:PLsmSvgSvgElement; view:PLsmSvgView; width:Pdouble; height:Pdouble);cdecl;external liblasem;
procedure lsm_svg_svg_element_render(svg_element:PLsmSvgSvgElement; view:PLsmSvgView);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:11:27 ===

function LSM_TYPE_SVG_SVG_ELEMENT : TGType;
function LSM_SVG_SVG_ELEMENT(obj : Pointer) : PLsmSvgSvgElement;
function LSM_SVG_SVG_ELEMENT_CLASS(klass : Pointer) : PLsmSvgSvgElementClass;
function LSM_IS_SVG_SVG_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_SVG_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_SVG_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgSvgElementClass;

implementation

function LSM_TYPE_SVG_SVG_ELEMENT : TGType;
  begin
    LSM_TYPE_SVG_SVG_ELEMENT:=lsm_svg_svg_element_get_type;
  end;

function LSM_SVG_SVG_ELEMENT(obj : Pointer) : PLsmSvgSvgElement;
begin
  Result := PLsmSvgSvgElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_SVG_ELEMENT));
end;

function LSM_SVG_SVG_ELEMENT_CLASS(klass : Pointer) : PLsmSvgSvgElementClass;
begin
  Result := PLsmSvgSvgElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_SVG_ELEMENT));
end;

function LSM_IS_SVG_SVG_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_SVG_ELEMENT);
end;

function LSM_IS_SVG_SVG_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_SVG_ELEMENT);
end;

function LSM_SVG_SVG_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgSvgElementClass;
begin
  Result := PLsmSvgSvgElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
