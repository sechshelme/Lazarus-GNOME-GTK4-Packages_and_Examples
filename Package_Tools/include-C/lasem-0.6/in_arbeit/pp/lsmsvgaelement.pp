
unit lsmsvgaelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgaelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgaelement.h
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
PLsmSvgAElement  = ^LsmSvgAElement;
PLsmSvgAElementClass  = ^LsmSvgAElementClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2012 Emmanuel Pacaud
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
{$ifndef LSM_SVG_A_ELEMENT_H}
{$define LSM_SVG_A_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgtransformable.h>}

{ was #define dname def_expr }
function LSM_TYPE_SVG_A_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_A_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_A_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_A_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_A_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_A_ELEMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgAElement = ^TLsmSvgAElement;
  TLsmSvgAElement = record
      base : TLsmSvgTransformable;
    end;

  PLsmSvgAElementClass = ^TLsmSvgAElementClass;
  TLsmSvgAElementClass = record
      base_class : TLsmSvgTransformableClass;
    end;


function lsm_svg_a_element_get_type:TGType;cdecl;external;
function lsm_svg_a_element_new:PLsmDomNode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_A_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_A_ELEMENT:=lsm_svg_a_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_A_ELEMENT(obj : longint) : longint;
begin
  LSM_SVG_A_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_A_ELEMENT,LsmSvgAElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_A_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_SVG_A_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_A_ELEMENT,LsmSvgAElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_A_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_SVG_A_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_A_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_A_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_A_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_A_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_A_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_A_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_A_ELEMENT,LsmSvgAElementClass);
end;


end.
