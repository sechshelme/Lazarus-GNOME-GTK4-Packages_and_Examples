
unit lsmsvgelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgelement.h
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
PLsmAttributeManager  = ^LsmAttributeManager;
PLsmExtents  = ^LsmExtents;
PLsmSvgElement  = ^LsmSvgElement;
PLsmSvgElementClass  = ^LsmSvgElementClass;
PLsmSvgView  = ^LsmSvgView;
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
{$ifndef LSM_SVG_ELEMENT_H}
{$define LSM_SVG_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgattributes.h>}
{$include <lsmsvgstyle.h>}
{$include <lsmdom.h>}
{$include <cairo.h>}

{ was #define dname def_expr }
function LSM_TYPE_SVG_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_ELEMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgElement = ^TLsmSvgElement;
  TLsmSvgElement = record
      element : TLsmDomElement;
      property_bag : TLsmPropertyBag;
      id : TLsmAttribute;
      class_name : TLsmAttribute;
    end;

  PLsmSvgElementClass = ^TLsmSvgElementClass;
  TLsmSvgElementClass = record
      parent_class : TLsmDomElementClass;
      attribute_manager : PLsmAttributeManager;
      category : TLsmSvgElementCategory;
      enable_rendering : procedure (element:PLsmSvgElement);cdecl;
      render : procedure (element:PLsmSvgElement; view:PLsmSvgView);cdecl;
      get_extents : procedure (element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;
      transformed_render : procedure (element:PLsmSvgElement; view:PLsmSvgView);cdecl;
      transformed_get_extents : procedure (element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;
      is_shape_element : Tgboolean;
    end;


function lsm_svg_element_get_type:TGType;cdecl;external;
function lsm_svg_element_get_category(element:PLsmSvgElement):TLsmSvgElementCategory;cdecl;external;
procedure lsm_svg_element_render(element:PLsmSvgElement; view:PLsmSvgView);cdecl;external;
procedure lsm_svg_element_force_render(element:PLsmSvgElement; view:PLsmSvgView);cdecl;external;
procedure lsm_svg_element_get_extents(element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;external;
procedure lsm_svg_element_transformed_get_extents(element:PLsmSvgElement; view:PLsmSvgView; extents:PLsmExtents);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_ELEMENT:=lsm_svg_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_ELEMENT(obj : longint) : longint;
begin
  LSM_SVG_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_ELEMENT,LsmSvgElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_SVG_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_ELEMENT,LsmSvgElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_SVG_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_ELEMENT,LsmSvgElementClass);
end;


end.
