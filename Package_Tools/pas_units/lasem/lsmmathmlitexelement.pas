unit lsmmathmlitexelement;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2010  Emmanuel Pacaud
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
{$ifndef LSM_MATHML_ITEX_ELEMENT_H}
{$define LSM_MATHML_ITEX_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}
{$include <lsmmathmldocument.h>}

type
  PLsmMathmlItexElement = ^TLsmMathmlItexElement;
  TLsmMathmlItexElement = record
      element : TLsmMathmlElement;
      itex : Pchar;
      math : PLsmMathmlElement;
    end;

  PLsmMathmlItexElementClass = ^TLsmMathmlItexElementClass;
  TLsmMathmlItexElementClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_itex_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_itex_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:45:33 ===

function LSM_TYPE_MATHML_ITEX_ELEMENT : TGType;
function LSM_MATHML_ITEX_ELEMENT(obj : Pointer) : PLsmMathmlItexElement;
function LSM_MATHML_ITEX_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlItexElementClass;
function LSM_IS_MATHML_ITEX_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_ITEX_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_ITEX_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlItexElementClass;

implementation

function LSM_TYPE_MATHML_ITEX_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_ITEX_ELEMENT:=lsm_mathml_itex_element_get_type;
  end;

function LSM_MATHML_ITEX_ELEMENT(obj : Pointer) : PLsmMathmlItexElement;
begin
  Result := PLsmMathmlItexElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_ITEX_ELEMENT));
end;

function LSM_MATHML_ITEX_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlItexElementClass;
begin
  Result := PLsmMathmlItexElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_ITEX_ELEMENT));
end;

function LSM_IS_MATHML_ITEX_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_ITEX_ELEMENT);
end;

function LSM_IS_MATHML_ITEX_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_ITEX_ELEMENT);
end;

function LSM_MATHML_ITEX_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlItexElementClass;
begin
  Result := PLsmMathmlItexElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
