unit lsmsvgfilterimage;

interface

uses
  fp_glib2, fp_lasem;

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
{$ifndef LSM_SVG_FILTER_IMAGE_H}
{$define LSM_SVG_FILTER_IMAGE_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterImage = ^TLsmSvgFilterImage;
  TLsmSvgFilterImage = record
      base : TLsmSvgFilterPrimitive;
      href : TLsmAttribute;
      preserve_aspect_ratio : TLsmSvgPreserveAspectRatioAttribute;
      pixbuf : PGdkPixbuf;
    end;

  PLsmSvgFilterImageClass = ^TLsmSvgFilterImageClass;
  TLsmSvgFilterImageClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_image_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_image_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:00:54 ===

function LSM_TYPE_SVG_FILTER_IMAGE : TGType;
function LSM_SVG_FILTER_IMAGE(obj : Pointer) : PLsmSvgFilterImage;
function LSM_SVG_FILTER_IMAGE_CLASS(klass : Pointer) : PLsmSvgFilterImageClass;
function LSM_IS_SVG_FILTER_IMAGE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_IMAGE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_IMAGE_GET_CLASS(obj : Pointer) : PLsmSvgFilterImageClass;

implementation

function LSM_TYPE_SVG_FILTER_IMAGE : TGType;
  begin
    LSM_TYPE_SVG_FILTER_IMAGE:=lsm_svg_filter_image_get_type;
  end;

function LSM_SVG_FILTER_IMAGE(obj : Pointer) : PLsmSvgFilterImage;
begin
  Result := PLsmSvgFilterImage(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_IMAGE));
end;

function LSM_SVG_FILTER_IMAGE_CLASS(klass : Pointer) : PLsmSvgFilterImageClass;
begin
  Result := PLsmSvgFilterImageClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_IMAGE));
end;

function LSM_IS_SVG_FILTER_IMAGE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_IMAGE);
end;

function LSM_IS_SVG_FILTER_IMAGE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_IMAGE);
end;

function LSM_SVG_FILTER_IMAGE_GET_CLASS(obj : Pointer) : PLsmSvgFilterImageClass;
begin
  Result := PLsmSvgFilterImageClass(PGTypeInstance(obj)^.g_class);
end;



end.
