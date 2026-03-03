unit lsmmathmlradicalelement;

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
{$ifndef LSM_MATHML_RADICAL_ELEMENT_H}
{$define LSM_MATHML_RADICAL_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}
type
  PLsmMathmlRadicalElementType = ^TLsmMathmlRadicalElementType;
  TLsmMathmlRadicalElementType =  Longint;
  Const
    LSM_MATHML_RADICAL_ELEMENT_TYPE_SQRT = 0;
    LSM_MATHML_RADICAL_ELEMENT_TYPE_ROOT = 1;
;

type
{ View properties  }
  PLsmMathmlRadicalElement = ^TLsmMathmlRadicalElement;
  TLsmMathmlRadicalElement = record
      element : TLsmMathmlElement;
      _type : TLsmMathmlRadicalElementType;
      bbox : TLsmMathmlBbox;
      width : Tdouble;
      radical_x_offset : Tdouble;
      order_y_offset : Tdouble;
    end;

  PLsmMathmlRadicalElementClass = ^TLsmMathmlRadicalElementClass;
  TLsmMathmlRadicalElementClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_radical_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_root_element_new:PLsmDomNode;cdecl;external liblasem;
function lsm_mathml_sqrt_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:46:22 ===

function LSM_TYPE_MATHML_RADICAL_ELEMENT : TGType;
function LSM_MATHML_RADICAL_ELEMENT(obj : Pointer) : PLsmMathmlRadicalElement;
function LSM_MATHML_RADICAL_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlRadicalElementClass;
function LSM_IS_MATHML_RADICAL_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_RADICAL_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_RADICAL_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlRadicalElementClass;

implementation

function LSM_TYPE_MATHML_RADICAL_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_RADICAL_ELEMENT:=lsm_mathml_radical_element_get_type;
  end;

function LSM_MATHML_RADICAL_ELEMENT(obj : Pointer) : PLsmMathmlRadicalElement;
begin
  Result := PLsmMathmlRadicalElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_RADICAL_ELEMENT));
end;

function LSM_MATHML_RADICAL_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlRadicalElementClass;
begin
  Result := PLsmMathmlRadicalElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_RADICAL_ELEMENT));
end;

function LSM_IS_MATHML_RADICAL_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_RADICAL_ELEMENT);
end;

function LSM_IS_MATHML_RADICAL_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_RADICAL_ELEMENT);
end;

function LSM_MATHML_RADICAL_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlRadicalElementClass;
begin
  Result := PLsmMathmlRadicalElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
