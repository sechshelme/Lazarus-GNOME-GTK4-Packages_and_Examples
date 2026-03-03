unit lsmmathmlpaddedelement;

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
{$ifndef LSM_MATHML_PADDED_ELEMENT_H}
{$define LSM_MATHML_PADDED_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlpresentationcontainer.h>}

type
  PLsmMathmlPaddedElement = ^TLsmMathmlPaddedElement;
  TLsmMathmlPaddedElement = record
      presentation_container : TLsmMathmlPresentationContainer;
      height : TLsmMathmlLengthAttribute;
      depth : TLsmMathmlLengthAttribute;
      width : TLsmMathmlLengthAttribute;
      left_space : TLsmMathmlLengthAttribute;
    end;

  PLsmMathmlPaddedElementClass = ^TLsmMathmlPaddedElementClass;
  TLsmMathmlPaddedElementClass = record
      parent_class : TLsmMathmlPresentationContainerClass;
    end;


function lsm_mathml_padded_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_padded_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:46:02 ===

function LSM_TYPE_MATHML_PADDED_ELEMENT : TGType;
function LSM_MATHML_PADDED_ELEMENT(obj : Pointer) : PLsmMathmlPaddedElement;
function LSM_MATHML_PADDED_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlPaddedElementClass;
function LSM_IS_MATHML_PADDED_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_PADDED_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_PADDED_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlPaddedElementClass;

implementation

function LSM_TYPE_MATHML_PADDED_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_PADDED_ELEMENT:=lsm_mathml_padded_element_get_type;
  end;

function LSM_MATHML_PADDED_ELEMENT(obj : Pointer) : PLsmMathmlPaddedElement;
begin
  Result := PLsmMathmlPaddedElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PADDED_ELEMENT));
end;

function LSM_MATHML_PADDED_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlPaddedElementClass;
begin
  Result := PLsmMathmlPaddedElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PADDED_ELEMENT));
end;

function LSM_IS_MATHML_PADDED_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_PADDED_ELEMENT);
end;

function LSM_IS_MATHML_PADDED_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_PADDED_ELEMENT);
end;

function LSM_MATHML_PADDED_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlPaddedElementClass;
begin
  Result := PLsmMathmlPaddedElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
