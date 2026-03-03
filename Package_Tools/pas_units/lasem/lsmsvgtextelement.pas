unit lsmsvgtextelement;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009-2012 Emmanuel Pacaud
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
{$ifndef LSM_SVG_TEXT_ELEMENT_H}
{$define LSM_SVG_TEXT_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgtransformable.h>}

type
  PLsmSvgTextElement = ^TLsmSvgTextElement;
  TLsmSvgTextElement = record
      base : TLsmSvgTransformable;
      x : TLsmSvgLengthListAttribute;
      y : TLsmSvgLengthListAttribute;
      dx : TLsmSvgLengthListAttribute;
      dy : TLsmSvgLengthListAttribute;
    end;

  PLsmSvgTextElementClass = ^TLsmSvgTextElementClass;
  TLsmSvgTextElementClass = record
      base_class : TLsmSvgTransformableClass;
    end;


function lsm_svg_text_element_get_type:TGType;cdecl;external liblasem;
function lsm_svg_text_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:11:38 ===

function LSM_TYPE_SVG_TEXT_ELEMENT : TGType;
function LSM_SVG_TEXT_ELEMENT(obj : Pointer) : PLsmSvgTextElement;
function LSM_SVG_TEXT_ELEMENT_CLASS(klass : Pointer) : PLsmSvgTextElementClass;
function LSM_IS_SVG_TEXT_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_TEXT_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_TEXT_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgTextElementClass;

implementation

function LSM_TYPE_SVG_TEXT_ELEMENT : TGType;
  begin
    LSM_TYPE_SVG_TEXT_ELEMENT:=lsm_svg_text_element_get_type;
  end;

function LSM_SVG_TEXT_ELEMENT(obj : Pointer) : PLsmSvgTextElement;
begin
  Result := PLsmSvgTextElement(g_type_check_instance_cast(obj, LSM_TYPE_SVG_TEXT_ELEMENT));
end;

function LSM_SVG_TEXT_ELEMENT_CLASS(klass : Pointer) : PLsmSvgTextElementClass;
begin
  Result := PLsmSvgTextElementClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_TEXT_ELEMENT));
end;

function LSM_IS_SVG_TEXT_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_TEXT_ELEMENT);
end;

function LSM_IS_SVG_TEXT_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_TEXT_ELEMENT);
end;

function LSM_SVG_TEXT_ELEMENT_GET_CLASS(obj : Pointer) : PLsmSvgTextElementClass;
begin
  Result := PLsmSvgTextElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
