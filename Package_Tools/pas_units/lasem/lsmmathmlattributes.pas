unit lsmmathmlattributes;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2009 Emmanuel Pacaud
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
{$ifndef LSM_MATHML_ATTRIBUTES_H}
{$define LSM_MATHML_ATTRIBUTES_H}
{$include <lsmattributes.h>}
{$include <lsmdom.h>}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlenums.h>}
{$include <lsmmathmltraits.h>}
type
  PLsmMathmlBooleanAttribute = ^TLsmMathmlBooleanAttribute;
  TLsmMathmlBooleanAttribute = record
      base : TLsmAttribute;
      value : Tgboolean;
    end;

  PLsmMathmlUnsignedAttribute = ^TLsmMathmlUnsignedAttribute;
  TLsmMathmlUnsignedAttribute = record
      base : TLsmAttribute;
      value : dword;
    end;

  PLsmMathmlEnumAttribute = ^TLsmMathmlEnumAttribute;
  TLsmMathmlEnumAttribute = record
      base : TLsmAttribute;
      value : dword;
    end;

  PLsmMathmlDoubleAttribute = ^TLsmMathmlDoubleAttribute;
  TLsmMathmlDoubleAttribute = record
      base : TLsmAttribute;
      value : Tdouble;
    end;

  PLsmMathmlScriptLevelAttribute = ^TLsmMathmlScriptLevelAttribute;
  TLsmMathmlScriptLevelAttribute = record
      base : TLsmAttribute;
      value : TLsmMathmlScriptLevel;
    end;

  PLsmMathmlColorAttribute = ^TLsmMathmlColorAttribute;
  TLsmMathmlColorAttribute = record
      base : TLsmAttribute;
      color : TLsmMathmlColor;
    end;

  PLsmMathmlStringAttribute = ^TLsmMathmlStringAttribute;
  TLsmMathmlStringAttribute = record
      base : TLsmAttribute;
      value : Pchar;
    end;

function lsm_mathml_boolean_attribute_inherit(attribute:PLsmMathmlBooleanAttribute; value:Tgboolean):Tgboolean;cdecl;external liblasem;
function lsm_mathml_double_attribute_inherit(attribute:PLsmMathmlDoubleAttribute; value:Tdouble):Tdouble;cdecl;external liblasem;
function lsm_mathml_color_attribute_inherit(attribute:PLsmMathmlColorAttribute; value:TLsmMathmlColor):TLsmMathmlColor;cdecl;external liblasem;
function lsm_mathml_string_attribute_inherit(attribute:PLsmMathmlStringAttribute; _string:Pchar):Pchar;cdecl;external liblasem;
function lsm_mathml_script_level_attribute_apply(attribute:PLsmMathmlScriptLevelAttribute; script_level:longint):longint;cdecl;external liblasem;
function lsm_mathml_enum_attribute_inherit(attribute:PLsmMathmlEnumAttribute; value:dword):dword;cdecl;external liblasem;
type
  PLsmMathmlEnumListAttribute = ^TLsmMathmlEnumListAttribute;
  TLsmMathmlEnumListAttribute = record
      base : TLsmAttribute;
      enum_list : TLsmMathmlEnumList;
    end;

  PLsmMathmlLengthAttribute = ^TLsmMathmlLengthAttribute;
  TLsmMathmlLengthAttribute = record
      base : TLsmAttribute;
      length : TLsmMathmlLength;
      value : Tdouble;
    end;

function lsm_mathml_length_attribute_normalize(attribute:PLsmMathmlLengthAttribute; base:Tdouble; default_value:PLsmMathmlLength; style:PLsmMathmlStyle):Tdouble;cdecl;external liblasem;
type
  PLsmMathmlSpaceAttribute = ^TLsmMathmlSpaceAttribute;
  TLsmMathmlSpaceAttribute = record
      base : TLsmAttribute;
      space : TLsmMathmlSpace;
      value : Tdouble;
    end;

function lsm_mathml_space_attribute_normalize(attribute:PLsmMathmlSpaceAttribute; base:Tdouble; default_value:PLsmMathmlSpace; style:PLsmMathmlStyle):Tdouble;cdecl;external liblasem;
type
  PLsmMathmlSpaceListAttribute = ^TLsmMathmlSpaceListAttribute;
  TLsmMathmlSpaceListAttribute = record
      base : TLsmAttribute;
      space_list : TLsmMathmlSpaceList;
      n_values : dword;
      values : Pdouble;
    end;

procedure lsm_mathml_space_list_attribute_normalize(attribute:PLsmMathmlSpaceListAttribute; base:Tdouble; default_value:PLsmMathmlSpaceList; style:PLsmMathmlStyle);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:39:34 ===


implementation



end.
