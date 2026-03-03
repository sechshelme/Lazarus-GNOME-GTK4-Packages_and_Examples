
unit lsmmathmlunderoverelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlunderoverelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlunderoverelement.h
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
PLsmMathmlElement  = ^LsmMathmlElement;
PLsmMathmlUnderOverElement  = ^LsmMathmlUnderOverElement;
PLsmMathmlUnderOverElementClass  = ^LsmMathmlUnderOverElementClass;
PLsmMathmlUnderOverElementType  = ^LsmMathmlUnderOverElementType;
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
{$ifndef LSM_MATHML_UNDER_OVER_ELEMENT_H}
{$define LSM_MATHML_UNDER_OVER_ELEMENT_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}
type
  PLsmMathmlUnderOverElementType = ^TLsmMathmlUnderOverElementType;
  TLsmMathmlUnderOverElementType =  Longint;
  Const
    LSM_MATHML_UNDER_OVER_ELEMENT_TYPE_UNDER = 0;
    LSM_MATHML_UNDER_OVER_ELEMENT_TYPE_OVER = 1;
    LSM_MATHML_UNDER_OVER_ELEMENT_TYPE_UNDER_OVER = 2;
;

{ was #define dname def_expr }
function LSM_TYPE_MATHML_UNDER_OVER_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_UNDER_OVER_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_UNDER_OVER_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_UNDER_OVER_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_UNDER_OVER_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_UNDER_OVER_ELEMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmMathmlUnderOverElement = ^TLsmMathmlUnderOverElement;
  TLsmMathmlUnderOverElement = record
      element : TLsmMathmlElement;
      accent : TLsmMathmlBooleanAttribute;
      accent_under : TLsmMathmlBooleanAttribute;
      _type : TLsmMathmlUnderOverElementType;
      base : PLsmMathmlElement;
      underscript : PLsmMathmlElement;
      overscript : PLsmMathmlElement;
      display : TLsmMathmlDisplay;
      under_space : Tdouble;
      over_space : Tdouble;
      as_script : Tgboolean;
      underscript_offset : Tdouble;
      overscript_offset : Tdouble;
    end;

  PLsmMathmlUnderOverElementClass = ^TLsmMathmlUnderOverElementClass;
  TLsmMathmlUnderOverElementClass = record
      parent_class : TLsmMathmlElementClass;
    end;


function lsm_mathml_under_over_element_get_type:TGType;cdecl;external;
function lsm_mathml_under_element_new:PLsmDomNode;cdecl;external;
function lsm_mathml_over_element_new:PLsmDomNode;cdecl;external;
function lsm_mathml_under_over_element_new:PLsmDomNode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_MATHML_UNDER_OVER_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_UNDER_OVER_ELEMENT:=lsm_mathml_under_over_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_UNDER_OVER_ELEMENT(obj : longint) : longint;
begin
  LSM_MATHML_UNDER_OVER_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_MATHML_UNDER_OVER_ELEMENT,LsmMathmlUnderOverElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_UNDER_OVER_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_MATHML_UNDER_OVER_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_MATHML_UNDER_OVER_ELEMENT,LsmMathmlUnderOverElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_UNDER_OVER_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_MATHML_UNDER_OVER_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_MATHML_UNDER_OVER_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_UNDER_OVER_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_MATHML_UNDER_OVER_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_MATHML_UNDER_OVER_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_UNDER_OVER_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_MATHML_UNDER_OVER_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_MATHML_UNDER_OVER_ELEMENT,LsmMathmlUnderOverElementClass);
end;


end.
