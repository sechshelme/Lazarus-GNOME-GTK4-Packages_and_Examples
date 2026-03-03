unit lsmmathmlfractionelement;

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
{$ifndef LSM_MATHML_FRACTION_ELEMENT_H}
{$define LSM_MATHML_FRACTION_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlpresentationcontainer.h>}

type
  PLsmMathmlFractionElement = ^TLsmMathmlFractionElement;
  TLsmMathmlFractionElement = record
      presentation_container : TLsmMathmlElement;
      line_thickness : TLsmMathmlLengthAttribute;
      bevelled : TLsmMathmlBooleanAttribute;
      display : TLsmMathmlDisplay;
      axis_offset : Tdouble;
    end;

  PLsmMathmlFractionElementClass = ^TLsmMathmlFractionElementClass;
  TLsmMathmlFractionElementClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_fraction_element_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_fraction_element_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:45:19 ===

function LSM_TYPE_MATHML_FRACTION_ELEMENT : TGType;
function LSM_MATHML_FRACTION_ELEMENT(obj : Pointer) : PLsmMathmlFractionElement;
function LSM_MATHML_FRACTION_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlFractionElementClass;
function LSM_IS_MATHML_FRACTION_ELEMENT(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_FRACTION_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_FRACTION_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlFractionElementClass;

implementation

function LSM_TYPE_MATHML_FRACTION_ELEMENT : TGType;
  begin
    LSM_TYPE_MATHML_FRACTION_ELEMENT:=lsm_mathml_fraction_element_get_type;
  end;

function LSM_MATHML_FRACTION_ELEMENT(obj : Pointer) : PLsmMathmlFractionElement;
begin
  Result := PLsmMathmlFractionElement(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_FRACTION_ELEMENT));
end;

function LSM_MATHML_FRACTION_ELEMENT_CLASS(klass : Pointer) : PLsmMathmlFractionElementClass;
begin
  Result := PLsmMathmlFractionElementClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_FRACTION_ELEMENT));
end;

function LSM_IS_MATHML_FRACTION_ELEMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_FRACTION_ELEMENT);
end;

function LSM_IS_MATHML_FRACTION_ELEMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_FRACTION_ELEMENT);
end;

function LSM_MATHML_FRACTION_ELEMENT_GET_CLASS(obj : Pointer) : PLsmMathmlFractionElementClass;
begin
  Result := PLsmMathmlFractionElementClass(PGTypeInstance(obj)^.g_class);
end;



end.
