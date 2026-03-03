
unit lsmmathmltraits;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmltraits.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmltraits.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Plongint  = ^longint;
PLsmMathmlColor  = ^LsmMathmlColor;
PLsmMathmlEnumList  = ^LsmMathmlEnumList;
PLsmMathmlLength  = ^LsmMathmlLength;
PLsmMathmlScriptLevel  = ^LsmMathmlScriptLevel;
PLsmMathmlSpace  = ^LsmMathmlSpace;
PLsmMathmlSpaceList  = ^LsmMathmlSpaceList;
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
{$ifndef LSM_MATHML_TRAITS_H}
{$define LSM_MATHML_TRAITS_H}
{$include <lsmmathmlenums.h>}
{$include <lsmtraits.h>}

const
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_VERY_THIN = -(0.055556);  
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_THIN = -(0.111111);  
  LSM_MATHML_SPACE_EM_NEGATIVE_THIN = -(0.166667);  
  LSM_MATHML_SPACE_EM_NEGATIVE_MEDIUM = -(0.222222);  
  LSM_MATHML_SPACE_EM_NEGATIVE_THICK = -(0.277778);  
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_THICK = -(0.333333);  
  LSM_MATHML_SPACE_EM_NEGATIVE_VERY_VERY_THICK = -(0.388889);  
  LSM_MATHML_SPACE_EM_VERY_VERY_THIN = 0.055556;  
  LSM_MATHML_SPACE_EM_VERY_THIN = 0.111111;  
  LSM_MATHML_SPACE_EM_THIN = 0.166667;  
  LSM_MATHML_SPACE_EM_MEDIUM = 0.222222;  
  LSM_MATHML_SPACE_EM_THICK = 0.277778;  
  LSM_MATHML_SPACE_EM_VERY_THICK = 0.333333;  
  LSM_MATHML_SPACE_EM_VERY_VERY_THICK = 0.388889;  

{ was #define dname def_expr }
function LSM_TYPE_MATHML_COLOR : longint; { return type might be wrong }

type
  PLsmMathmlColor = ^TLsmMathmlColor;
  TLsmMathmlColor = record
      red : Tdouble;
      green : Tdouble;
      blue : Tdouble;
      alpha : Tdouble;
    end;

function lsm_mathml_color_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function LSM_TYPE_MATHML_LENGTH : longint; { return type might be wrong }

type
  PLsmMathmlLength = ^TLsmMathmlLength;
  TLsmMathmlLength = record
      value : Tdouble;
      unit : TLsmMathmlUnit;
    end;

function lsm_mathml_length_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_length_normalize(length:PLsmMathmlLength; base:Tdouble; font_size:Tdouble):Tdouble;cdecl;external;
type
  PLsmMathmlScriptLevel = ^TLsmMathmlScriptLevel;
  TLsmMathmlScriptLevel = record
      sign : TLsmMathmlScriptLevelSign;
      level : longint;
    end;

  PLsmMathmlEnumList = ^TLsmMathmlEnumList;
  TLsmMathmlEnumList = record
      n_values : dword;
      values : Plongint;
    end;

{ was #define dname def_expr }
function LSM_TYPE_MATHML_SPACE : longint; { return type might be wrong }

type
  PLsmMathmlSpace = ^TLsmMathmlSpace;
  TLsmMathmlSpace = record
      name : TLsmMathmlSpaceName;
      length : TLsmMathmlLength;
    end;

function lsm_mathml_space_get_type:TGType;cdecl;external;
type
  PLsmMathmlSpaceList = ^TLsmMathmlSpaceList;
  TLsmMathmlSpaceList = record
      n_spaces : dword;
      spaces : PLsmMathmlSpace;
    end;
(* Const before type ignored *)

procedure lsm_mathml_enum_list_init(enum_list:PLsmMathmlEnumList; enum_list_default:PLsmMathmlEnumList);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_space_list_init(space_list:PLsmMathmlSpaceList; space_list_default:PLsmMathmlSpaceList);cdecl;external;
(* Const before type ignored *)
  var
    lsm_mathml_boolean_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_unsigned_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_display_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_mode_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_line_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_font_style_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_font_weight_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_variant_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_form_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_notation_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_linebreak_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_row_align_list_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_column_align_list_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_line_list_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_script_level_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_double_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_string_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_length_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_space_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_space_list_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_mathml_color_trait_class : TLsmTraitClass;cvar;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_MATHML_COLOR : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_COLOR:=lsm_mathml_color_get_type;
  end;

{ was #define dname def_expr }
function LSM_TYPE_MATHML_LENGTH : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_LENGTH:=lsm_mathml_length_get_type;
  end;

{ was #define dname def_expr }
function LSM_TYPE_MATHML_SPACE : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_SPACE:=lsm_mathml_space_get_type;
  end;


end.
