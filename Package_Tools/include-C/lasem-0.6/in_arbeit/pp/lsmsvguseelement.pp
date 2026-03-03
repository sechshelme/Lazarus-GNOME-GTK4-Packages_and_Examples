
unit lsmsvguseelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvguseelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvguseelement.h
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
PLsmSvgUseElement  = ^LsmSvgUseElement;
PLsmSvgUseElementClass  = ^LsmSvgUseElementClass;
PLsmSvgUseElementFlags  = ^LsmSvgUseElementFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009-2012 Emmanuel Pacaud
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
{$ifndef LSM_SVG_USE_ELEMENT_H}
{$define LSM_SVG_USE_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgtransformable.h>}
type
  PLsmSvgUseElementFlags = ^TLsmSvgUseElementFlags;
  TLsmSvgUseElementFlags =  Longint;
  Const
    LSM_SVG_USE_ELEMENT_FLAGS_IN_USE_FOR_RENDER = 1 shl 0;
    LSM_SVG_USE_ELEMENT_FLAGS_IN_USE_FOR_GET_EXTENTS = 1 shl 1;
;

{ was #define dname def_expr }
function LSM_TYPE_SVG_USE_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_USE_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_USE_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_USE_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_USE_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_USE_ELEMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgUseElement = ^TLsmSvgUseElement;
  TLsmSvgUseElement = record
      base : TLsmSvgTransformable;
      x : TLsmSvgLengthAttribute;
      y : TLsmSvgLengthAttribute;
      width : TLsmSvgLengthAttribute;
      height : TLsmSvgLengthAttribute;
      href : TLsmAttribute;
      flags : TLsmSvgUseElementFlags;
    end;

  PLsmSvgUseElementClass = ^TLsmSvgUseElementClass;
  TLsmSvgUseElementClass = record
      base_class : TLsmSvgTransformableClass;
    end;


function lsm_svg_use_element_get_type:TGType;cdecl;external;
function lsm_svg_use_element_new:PLsmDomNode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_USE_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_USE_ELEMENT:=lsm_svg_use_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_USE_ELEMENT(obj : longint) : longint;
begin
  LSM_SVG_USE_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_USE_ELEMENT,LsmSvgUseElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_USE_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_SVG_USE_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_USE_ELEMENT,LsmSvgUseElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_USE_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_SVG_USE_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_USE_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_USE_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_USE_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_USE_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_USE_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_USE_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_USE_ELEMENT,LsmSvgUseElementClass);
end;


end.
