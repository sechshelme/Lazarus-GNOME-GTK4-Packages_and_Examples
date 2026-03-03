
unit lsmmathmlpresentationtoken;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlpresentationtoken.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlpresentationtoken.h
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
Pchar  = ^char;
PLsmDomNode  = ^LsmDomNode;
PLsmMathmlPresentationToken  = ^LsmMathmlPresentationToken;
PLsmMathmlPresentationTokenClass  = ^LsmMathmlPresentationTokenClass;
PLsmMathmlPresentationTokenType  = ^LsmMathmlPresentationTokenType;
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
{$ifndef LSM_MATHML_PRESENTATION_TOKEN_H}
{$define LSM_MATHML_PRESENTATION_TOKEN_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlelement.h>}
type
  PLsmMathmlPresentationTokenType = ^TLsmMathmlPresentationTokenType;
  TLsmMathmlPresentationTokenType =  Longint;
  Const
    LSM_MATHML_PRESENTATION_TOKEN_TYPE_NUMBER = 0;
    LSM_MATHML_PRESENTATION_TOKEN_TYPE_IDENTIFIER = 1;
    LSM_MATHML_PRESENTATION_TOKEN_TYPE_TEXT = 2;
;

{ was #define dname def_expr }
function LSM_TYPE_MATHML_PRESENTATION_TOKEN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_TOKEN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_TOKEN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_TOKEN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS(obj : longint) : longint;

type
{ Deprecated style attributes  }
  PLsmMathmlPresentationToken = ^TLsmMathmlPresentationToken;
  TLsmMathmlPresentationToken = record
      element : TLsmMathmlElement;
      _type : TLsmMathmlPresentationTokenType;
      math_family : TLsmMathmlStringAttribute;
      math_variant : TLsmMathmlEnumAttribute;
      math_size : TLsmMathmlLengthAttribute;
      math_color : TLsmMathmlColorAttribute;
      math_background : TLsmMathmlColorAttribute;
      font_weight : TLsmMathmlEnumAttribute;
      font_style : TLsmMathmlEnumAttribute;
    end;

  PLsmMathmlPresentationTokenClass = ^TLsmMathmlPresentationTokenClass;
  TLsmMathmlPresentationTokenClass = record
      parent_class : TLsmMathmlElementClass;
      get_text : function (self:PLsmMathmlPresentationToken):Pchar;cdecl;
    end;


function lsm_mathml_presentation_token_get_type:TGType;cdecl;external;
function lsm_mathml_number_element_new:PLsmDomNode;cdecl;external;
function lsm_mathml_identifier_element_new:PLsmDomNode;cdecl;external;
function lsm_mathml_text_element_new:PLsmDomNode;cdecl;external;
{ Extra functions  }
function lsm_mathml_presentation_token_get_text(self:PLsmMathmlPresentationToken):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_MATHML_PRESENTATION_TOKEN : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_PRESENTATION_TOKEN:=lsm_mathml_presentation_token_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_TOKEN(obj : longint) : longint;
begin
  LSM_MATHML_PRESENTATION_TOKEN:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_MATHML_PRESENTATION_TOKEN,LsmMathmlPresentationToken);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_TOKEN_CLASS(klass : longint) : longint;
begin
  LSM_MATHML_PRESENTATION_TOKEN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_MATHML_PRESENTATION_TOKEN,LsmMathmlPresentationTokenClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_TOKEN(obj : longint) : longint;
begin
  LSM_IS_MATHML_PRESENTATION_TOKEN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_MATHML_PRESENTATION_TOKEN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS(klass : longint) : longint;
begin
  LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_MATHML_PRESENTATION_TOKEN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS(obj : longint) : longint;
begin
  LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_MATHML_PRESENTATION_TOKEN,LsmMathmlPresentationTokenClass);
end;


end.
