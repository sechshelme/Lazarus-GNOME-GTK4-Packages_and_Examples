
unit lsmsvgmarkerelement;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgmarkerelement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgmarkerelement.h
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
PLsmSvgMarkerElement  = ^LsmSvgMarkerElement;
PLsmSvgMarkerElementClass  = ^LsmSvgMarkerElementClass;
PLsmSvgStyle  = ^LsmSvgStyle;
PLsmSvgView  = ^LsmSvgView;
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
{$ifndef LSM_SVG_MARKER_ELEMENT_H}
{$define LSM_SVG_MARKER_ELEMENT_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgelement.h>}

{ was #define dname def_expr }
function LSM_TYPE_SVG_MARKER_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_MARKER_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_MARKER_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_MARKER_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_MARKER_ELEMENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_MARKER_ELEMENT_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgMarkerElement = ^TLsmSvgMarkerElement;
  TLsmSvgMarkerElement = record
      element : TLsmSvgElement;
      units : TLsmSvgMarkerUnitsAttribute;
      ref_x : TLsmSvgLengthAttribute;
      ref_y : TLsmSvgLengthAttribute;
      width : TLsmSvgLengthAttribute;
      height : TLsmSvgLengthAttribute;
      orientation : TLsmSvgAngleAttribute;
      viewbox : TLsmSvgViewboxAttribute;
      preserve_aspect_ratio : TLsmSvgPreserveAspectRatioAttribute;
      enable_rendering : Tgboolean;
      stroke_width : Tdouble;
      vertex_angle : Tdouble;
      style : PLsmSvgStyle;
    end;

  PLsmSvgMarkerElementClass = ^TLsmSvgMarkerElementClass;
  TLsmSvgMarkerElementClass = record
      element_class : TLsmSvgElementClass;
    end;


function lsm_svg_marker_element_get_type:TGType;cdecl;external;
function lsm_svg_marker_element_new:PLsmDomNode;cdecl;external;
procedure lsm_svg_marker_element_render(marker:PLsmSvgMarkerElement; view:PLsmSvgView; stroke_width:Tdouble; vertex_angle:Tdouble);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_MARKER_ELEMENT : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_MARKER_ELEMENT:=lsm_svg_marker_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_MARKER_ELEMENT(obj : longint) : longint;
begin
  LSM_SVG_MARKER_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_MARKER_ELEMENT,LsmSvgMarkerElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_MARKER_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_SVG_MARKER_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_MARKER_ELEMENT,LsmSvgMarkerElementClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_MARKER_ELEMENT(obj : longint) : longint;
begin
  LSM_IS_SVG_MARKER_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_MARKER_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_MARKER_ELEMENT_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_MARKER_ELEMENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_MARKER_ELEMENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_MARKER_ELEMENT_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_MARKER_ELEMENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_MARKER_ELEMENT,LsmSvgMarkerElementClass);
end;


end.
