
unit lsmsvgtransformable;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgtransformable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgtransformable.h
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
PLsmSvgTransformable  = ^LsmSvgTransformable;
PLsmSvgTransformableClass  = ^LsmSvgTransformableClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2012 Emmanuel Pacaud
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
{$ifndef LSM_SVG_TRANSFORMABLE_H}
{$define LSM_SVG_TRANSFORMABLE_H}
{$include <lsmsvgelement.h>}

{ was #define dname def_expr }
function LSM_TYPE_SVG_TRANSFORMABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_TRANSFORMABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_TRANSFORMABLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_TRANSFORMABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_TRANSFORMABLE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_TRANSFORMABLE_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgTransformable = ^TLsmSvgTransformable;
  TLsmSvgTransformable = record
      element : TLsmSvgElement;
      transform : TLsmSvgTransformAttribute;
    end;

  PLsmSvgTransformableClass = ^TLsmSvgTransformableClass;
  TLsmSvgTransformableClass = record
      parent_class : TLsmSvgElementClass;
    end;


function lsm_svg_transformable_get_type:TGType;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_TRANSFORMABLE : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_TRANSFORMABLE:=lsm_svg_transformable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_TRANSFORMABLE(obj : longint) : longint;
begin
  LSM_SVG_TRANSFORMABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_TRANSFORMABLE,LsmSvgTransformable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_TRANSFORMABLE_CLASS(klass : longint) : longint;
begin
  LSM_SVG_TRANSFORMABLE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_TRANSFORMABLE,LsmSvgTransformableClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_TRANSFORMABLE(obj : longint) : longint;
begin
  LSM_IS_SVG_TRANSFORMABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_TRANSFORMABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_TRANSFORMABLE_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_TRANSFORMABLE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_TRANSFORMABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_TRANSFORMABLE_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_TRANSFORMABLE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_TRANSFORMABLE,LsmSvgTransformableClass);
end;


end.
