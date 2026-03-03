unit lsmmathmlscriptelement;

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
{$ifndef LSM_MATHML_SCRIPT_ELEMENT_H}
{$define LSM_MATHML_SCRIPT_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}
type
  PLsmMathmlScriptElementType = ^TLsmMathmlScriptElementType;
  TLsmMathmlScriptElementType =  Longint;
  Const
    LSM_MATHML_SCRIPT_ELEMENT_TYPE_SUB = 0;
    LSM_MATHML_SCRIPT_ELEMENT_TYPE_SUP = 1;
    LSM_MATHML_SCRIPT_ELEMENT_TYPE_SUB_SUP = 2;
;

type
  PLsmMathmlScriptElement = ^TLsmMathmlScriptElement;
  TLsmMathmlScriptElement = record
      element : TLsmMathmlElement;
      base : PLsmMathmlElement;
      subscript : PLsmMathmlElement;
      superscript : PLsmMathmlElement;
      subscript_offset : Tdouble;
      superscript_offset : Tdouble;
      _type : TLsmMathmlScriptElementType;
      subscript_shift : TLsmMathmlLengthAttribute;
      superscript_shift : TLsmMathmlLengthAttribute;
      display : TLsmMathmlDisplay;
    end;

  PLsmMathmlScriptElementClass = ^TLsmMathmlScriptElementClass;
  TLsmMathmlScriptElementClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_script_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_sub_element_new:PLsmDomNode;cdecl;external liblasem;
function lsm_mathml_sup_element_new:PLsmDomNode;cdecl;external liblasem;
function lsm_mathml_sub_sup_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:49:23 ===

function LSM_TYPE_MATHML_SCRIPT_ELEMENT : TGType;
function LSM_MATHML_SCRIPT_ELEMENT(obj : Pointer) : PLsmMathmlScriptElement;
function LSM_MATHML_SCRIPT_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlScriptElementClass;
function LSM_IS_MATHML_SCRIPT_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_SCRIPT_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_SCRIPT_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlScriptElementClass;

implementation

function LSM_TYPE_MATHML_SCRIPT_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_SCRIPT_ELEMENT:=lsm_mathml_script_element_get_type;
  end;

function LSM_MATHML_SCRIPT_ELEMENT(obj : Pointer) : PLsmMathmlScriptElement;
begin
  Result := PLsmMathmlScriptElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_SCRIPT_ELEMENT));
end;

function LSM_MATHML_SCRIPT_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlScriptElementClass;
begin
  Result := PLsmMathmlScriptElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_SCRIPT_ELEMENT));
end;

function LSM_IS_MATHML_SCRIPT_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_SCRIPT_ELEMENT);
end;

function LSM_IS_MATHML_SCRIPT_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_SCRIPT_ELEMENT);
end;

function LSM_MATHML_SCRIPT_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlScriptElementClass;
begin
  Result := PLsmMathmlScriptElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
