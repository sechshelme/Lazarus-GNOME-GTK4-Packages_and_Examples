unit lsmmathmlpresentationtoken;

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


function lsm_mathml_presentation_token_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_number_element_new:PLsmDomNode;cdecl;external liblasem;
function lsm_mathml_identifier_element_new:PLsmDomNode;cdecl;external liblasem;
function lsm_mathml_text_element_new:PLsmDomNode;cdecl;external liblasem;
{ Extra functions  }
function lsm_mathml_presentation_token_get_text(self:PLsmMathmlPresentationToken):Pchar;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:46:17 ===

function LSM_TYPE_MATHML_PRESENTATION_TOKEN : TGType;
function LSM_MATHML_PRESENTATION_TOKEN(obj : Pointer) : PLsmMathmlPresentationToken;
function LSM_MATHML_PRESENTATION_TOKEN_CLASS(klass : Pointer) : PLsmMathmlPresentationTokenClass;
function LSM_IS_MATHML_PRESENTATION_TOKEN(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS(obj : Pointer) : PLsmMathmlPresentationTokenClass;

implementation

function LSM_TYPE_MATHML_PRESENTATION_TOKEN : TGType;
  begin
    LSM_TYPE_MATHML_PRESENTATION_TOKEN:=lsm_mathml_presentation_token_get_type;
  end;

function LSM_MATHML_PRESENTATION_TOKEN(obj : Pointer) : PLsmMathmlPresentationToken;
begin
  Result := PLsmMathmlPresentationToken(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_PRESENTATION_TOKEN));
end;

function LSM_MATHML_PRESENTATION_TOKEN_CLASS(klass : Pointer) : PLsmMathmlPresentationTokenClass;
begin
  Result := PLsmMathmlPresentationTokenClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_PRESENTATION_TOKEN));
end;

function LSM_IS_MATHML_PRESENTATION_TOKEN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_PRESENTATION_TOKEN);
end;

function LSM_IS_MATHML_PRESENTATION_TOKEN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_PRESENTATION_TOKEN);
end;

function LSM_MATHML_PRESENTATION_TOKEN_GET_CLASS(obj : Pointer) : PLsmMathmlPresentationTokenClass;
begin
  Result := PLsmMathmlPresentationTokenClass(PGTypeInstance(obj)^.g_class);
end;



end.
