unit lsmmathmlstringelement;

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
{$ifndef LSM_MATHML_STRING_ELEMENT_H}
{$define LSM_MATHML_STRING_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlpresentationtoken.h>}

type
  PLsmMathmlStringElement = ^TLsmMathmlStringElement;
  TLsmMathmlStringElement = record
      presentation_token : TLsmMathmlPresentationToken;
      left_quote : TLsmMathmlStringAttribute;
      right_quote : TLsmMathmlStringAttribute;
    end;

  PLsmMathmlStringElementClass = ^TLsmMathmlStringElementClass;
  TLsmMathmlStringElementClass = record
      parent_class : TLsmMathmlPresentationTokenClass;
    end;


function lsm_mathml_string_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_string_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:49:32 ===

function LSM_TYPE_MATHML_STRING_ELEMENT : TGType;
function LSM_MATHML_STRING_ELEMENT(obj : Pointer) : PLsmMathmlStringElement;
function LSM_MATHML_STRING_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlStringElementClass;
function LSM_IS_MATHML_STRING_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_STRING_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_STRING_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlStringElementClass;

implementation

function LSM_TYPE_MATHML_STRING_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_STRING_ELEMENT:=lsm_mathml_string_element_get_type;
  end;

function LSM_MATHML_STRING_ELEMENT(obj : Pointer) : PLsmMathmlStringElement;
begin
  Result := PLsmMathmlStringElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_STRING_ELEMENT));
end;

function LSM_MATHML_STRING_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlStringElementClass;
begin
  Result := PLsmMathmlStringElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_STRING_ELEMENT));
end;

function LSM_IS_MATHML_STRING_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_STRING_ELEMENT);
end;

function LSM_IS_MATHML_STRING_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_STRING_ELEMENT);
end;

function LSM_MATHML_STRING_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlStringElementClass;
begin
  Result := PLsmMathmlStringElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
