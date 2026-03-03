
unit lsmmathmlelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlelement.h
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
PLsmAttributeManager  = ^LsmAttributeManager;
PLsmMathmlBbox  = ^LsmMathmlBbox;
PLsmMathmlElement  = ^LsmMathmlElement;
PLsmMathmlElementClass  = ^LsmMathmlElementClass;
PLsmMathmlElementStyle  = ^LsmMathmlElementStyle;
PLsmMathmlOperatorElement  = ^LsmMathmlOperatorElement;
PLsmMathmlStyle  = ^LsmMathmlStyle;
PLsmMathmlView  = ^LsmMathmlView;
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
{$ifndef LSM_MATHML_ELEMENT_H}
{$define LSM_MATHML_ELEMENT_H}
{$include <lsmdomelement.h>}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlutils.h>}
{$include <lsmmathmlstyle.h>}
{$include <lsmmathmlattributes.h>}
{$include <cairo.h>}
type
  PLsmMathmlElementStyle = ^TLsmMathmlElementStyle;
  TLsmMathmlElementStyle = record
      math_family : Pchar;
      math_variant : TLsmMathmlVariant;
      math_size : Tdouble;
      math_color : TLsmMathmlColor;
      math_background : TLsmMathmlColor;
    end;

{ was #define dname def_expr }
function LSM_TYPE_MATHML_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_ELEMENT_GET_CLASS(obj : longint) : longint;

type
{ View  }
  PLsmMathmlElement = ^TLsmMathmlElement;
  TLsmMathmlElement = record
      element : TLsmDomElement;
      class_name : TLsmAttribute;
      id : TLsmAttribute;
      href : TLsmAttribute;
      style : TLsmMathmlElementStyle;
      need_update : Tgboolean;
      need_children_update : Tgboolean;
      need_measure : Tgboolean;
      need_layout : Tgboolean;
      x : Tdouble;
      y : Tdouble;
      bbox : TLsmMathmlBbox;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PLsmMathmlElementClass = ^TLsmMathmlElementClass;
  TLsmMathmlElementClass = record
      parent_class : TLsmDomElementClass;
      attribute_manager : PLsmAttributeManager;
      update : procedure (element:PLsmMathmlElement; style:PLsmMathmlStyle);cdecl;
      update_children : function (element:PLsmMathmlElement; style:PLsmMathmlStyle):Tgboolean;cdecl;
      measure : function (element:PLsmMathmlElement; view:PLsmMathmlView; bbox:PLsmMathmlBbox):PLsmMathmlBbox;cdecl;
      layout : procedure (element:PLsmMathmlElement; view:PLsmMathmlView; x:Tdouble; y:Tdouble; bbox:PLsmMathmlBbox);cdecl;
      render : procedure (element:PLsmMathmlElement; view:PLsmMathmlView);cdecl;
      get_embellished_core : function (self:PLsmMathmlElement):PLsmMathmlOperatorElement;cdecl;
      is_inferred_row : function (self:PLsmMathmlElement):Tgboolean;cdecl;
    end;


function lsm_mathml_element_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_element_update(element:PLsmMathmlElement; style:PLsmMathmlStyle):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_mathml_element_measure(element:PLsmMathmlElement; view:PLsmMathmlView; stretch_bbox:PLsmMathmlBbox):PLsmMathmlBbox;cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_element_layout(element:PLsmMathmlElement; view:PLsmMathmlView; x:Tdouble; y:Tdouble; bbox:PLsmMathmlBbox);cdecl;external;
procedure lsm_mathml_element_render(element:PLsmMathmlElement; view:PLsmMathmlView);cdecl;external;
(* Const before type ignored *)
function lsm_mathml_element_get_embellished_core(self:PLsmMathmlElement):PLsmMathmlOperatorElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_mathml_element_get_bbox(self:PLsmMathmlElement):PLsmMathmlBbox;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_element_is_inferred_row(self:PLsmMathmlElement):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_MATHML_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_MATHML_ELEMENT:=lsm_mathml_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_ELEMENT(obj : longint) : longint;
begin
  LSM_MATHML_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_MATHML_ELEMENT,LsmMathmlElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_MATHML_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_MATHML_ELEMENT,LsmMathmlElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_MATHML_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_MATHML_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_MATHML_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_MATHML_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_MATHML_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_MATHML_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_MATHML_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_MATHML_ELEMENT,LsmMathmlElementClass);
end;


end.
