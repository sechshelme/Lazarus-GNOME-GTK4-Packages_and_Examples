
unit lsmmathmlstyleelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlstyleelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlstyleelement.h
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
PLsmDomNode  = ^LsmDomNode;
PLsmMathmlStyleElement  = ^LsmMathmlStyleElement;
PLsmMathmlStyleElementClass  = ^LsmMathmlStyleElementClass;
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
{$ifndef LSM_MATHML_STYLE_ELEMENT_H}
{$define LSM_MATHML_STYLE_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlpresentationcontainer.h>}

{ was #define dname def_expr }
function LSM_TYPE_MATHML_STYLE_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_STYLE_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_STYLE_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_STYLE_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_STYLE_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_STYLE_ELEMENT_GET_CLASS(obj : longint) : longint;

type
{ Style attributes  }
{ Deprecated style attributes  }
{ Presentation token attribute  }
{ Fraction attributes  }
  PLsmMathmlStyleElement = ^TLsmMathmlStyleElement;
  TLsmMathmlStyleElement = record
      presentation_container : TLsmMathmlPresentationContainer;
      display_style : TLsmMathmlBooleanAttribute;
      script_level : TLsmMathmlScriptLevelAttribute;
      script_size_multiplier : TLsmMathmlDoubleAttribute;
      script_min_size : TLsmMathmlLengthAttribute;
      negative_very_very_thin_math_space : TLsmMathmlLengthAttribute;
      negative_very_thin_math_space : TLsmMathmlLengthAttribute;
      negative_thin_math_space : TLsmMathmlLengthAttribute;
      negative_medium_math_space : TLsmMathmlLengthAttribute;
      negative_thick_math_space : TLsmMathmlLengthAttribute;
      negative_very_thick_math_space : TLsmMathmlLengthAttribute;
      negative_very_very_thick_math_space : TLsmMathmlLengthAttribute;
      very_very_thin_math_space : TLsmMathmlLengthAttribute;
      very_thin_math_space : TLsmMathmlLengthAttribute;
      thin_math_space : TLsmMathmlLengthAttribute;
      medium_math_space : TLsmMathmlLengthAttribute;
      thick_math_space : TLsmMathmlLengthAttribute;
      very_thick_math_space : TLsmMathmlLengthAttribute;
      very_very_thick_math_space : TLsmMathmlLengthAttribute;
      font_weight : TLsmMathmlEnumAttribute;
      font_style : TLsmMathmlEnumAttribute;
      math_family : TLsmMathmlStringAttribute;
      math_variant : TLsmMathmlEnumAttribute;
      math_size : TLsmMathmlLengthAttribute;
      math_color : TLsmMathmlColorAttribute;
      math_background : TLsmMathmlColorAttribute;
      line_thickness : TLsmMathmlLengthAttribute;
    end;

  PLsmMathmlStyleElementClass = ^TLsmMathmlStyleElementClass;
  TLsmMathmlStyleElementClass = record
      parent_class : TLsmMathmlPresentationContainerClass;
    end;


function lsm_mathml_style_element_get_type:TGType;cdecl;external;
function lsm_mathml_style_element_new:PLsmDomNode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_MATHML_STYLE_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_STYLE_ELEMENT:=lsm_mathml_style_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_STYLE_ELEMENT(obj : longint) : longint;
begin
  LSM_MATHML_STYLE_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_MATHML_STYLE_ELEMENT,LsmMathmlStyleElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_STYLE_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_MATHML_STYLE_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_MATHML_STYLE_ELEMENT,LsmMathmlStyleElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_STYLE_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_MATHML_STYLE_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_MATHML_STYLE_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_STYLE_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_MATHML_STYLE_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_MATHML_STYLE_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_STYLE_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_MATHML_STYLE_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_MATHML_STYLE_ELEMENT,LsmMathmlStyleElementClass);
end;


end.
