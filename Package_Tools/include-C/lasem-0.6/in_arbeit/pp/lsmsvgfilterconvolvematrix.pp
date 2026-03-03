
unit lsmsvgfilterconvolvematrix;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmsvgfilterconvolvematrix.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmsvgfilterconvolvematrix.h
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
PLsmSvgFilterConvolveMatrix  = ^LsmSvgFilterConvolveMatrix;
PLsmSvgFilterConvolveMatrixClass  = ^LsmSvgFilterConvolveMatrixClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2015 Emmanuel Pacaud
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
{$ifndef LSM_SVG_FILTER_CONVOLVE_MATRIX_H}
{$define LSM_SVG_FILTER_CONVOLVE_MATRIX_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

{ was #define dname def_expr }
function LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_FILTER_CONVOLVE_MATRIX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_FILTER_CONVOLVE_MATRIX_GET_CLASS(obj : longint) : longint;

type
  PLsmSvgFilterConvolveMatrix = ^TLsmSvgFilterConvolveMatrix;
  TLsmSvgFilterConvolveMatrix = record
      base : TLsmSvgFilterPrimitive;
      order : TLsmSvgOneOrTwoIntegerAttribute;
      kernel : TLsmSvgVectorAttribute;
      divisor : TLsmSvgDoubleAttribute;
      bias : TLsmSvgDoubleAttribute;
      target_x : TLsmSvgIntegerAttribute;
      target_y : TLsmSvgIntegerAttribute;
      edge_mode : TLsmSvgEdgeModeAttribute;
      preserve_alpha : TLsmSvgBooleanAttribute;
    end;

  PLsmSvgFilterConvolveMatrixClass = ^TLsmSvgFilterConvolveMatrixClass;
  TLsmSvgFilterConvolveMatrixClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_convolve_matrix_get_type:TGType;cdecl;external;
function lsm_svg_filter_convolve_matrix_new:PLsmDomNode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX : longint; { return type might be wrong }
  begin
    LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX:=lsm_svg_filter_convolve_matrix_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_FILTER_CONVOLVE_MATRIX(obj : longint) : longint;
begin
  LSM_SVG_FILTER_CONVOLVE_MATRIX:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX,LsmSvgFilterConvolveMatrix);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass : longint) : longint;
begin
  LSM_SVG_FILTER_CONVOLVE_MATRIX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX,LsmSvgFilterConvolveMatrixClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX(obj : longint) : longint;
begin
  LSM_IS_SVG_FILTER_CONVOLVE_MATRIX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass : longint) : longint;
begin
  LSM_IS_SVG_FILTER_CONVOLVE_MATRIX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_SVG_FILTER_CONVOLVE_MATRIX_GET_CLASS(obj : longint) : longint;
begin
  LSM_SVG_FILTER_CONVOLVE_MATRIX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX,LsmSvgFilterConvolveMatrixClass);
end;


end.
