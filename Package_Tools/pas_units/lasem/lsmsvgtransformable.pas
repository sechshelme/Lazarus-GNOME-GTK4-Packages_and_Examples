unit lsmsvgtransformable;

interface

uses
  fp_glib2, fp_lasem;

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


function lsm_svg_transformable_get_type:TGType;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:11:59 ===

function LSM_TYPE_SVG_TRANSFORMABLE : TGType;
function LSM_SVG_TRANSFORMABLE(obj : Pointer) : PLsmSvgTransformable;
function LSM_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : PLsmSvgTransformableClass;
function LSM_IS_SVG_TRANSFORMABLE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_TRANSFORMABLE_GET_CLASS(obj : Pointer) : PLsmSvgTransformableClass;

implementation

function LSM_TYPE_SVG_TRANSFORMABLE : TGType;
  begin
    LSM_TYPE_SVG_TRANSFORMABLE:=lsm_svg_transformable_get_type;
  end;

function LSM_SVG_TRANSFORMABLE(obj : Pointer) : PLsmSvgTransformable;
begin
  Result := PLsmSvgTransformable(g_type_check_instance_cast(obj, LSM_TYPE_SVG_TRANSFORMABLE));
end;

function LSM_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : PLsmSvgTransformableClass;
begin
  Result := PLsmSvgTransformableClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_TRANSFORMABLE));
end;

function LSM_IS_SVG_TRANSFORMABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_TRANSFORMABLE);
end;

function LSM_IS_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_TRANSFORMABLE);
end;

function LSM_SVG_TRANSFORMABLE_GET_CLASS(obj : Pointer) : PLsmSvgTransformableClass;
begin
  Result := PLsmSvgTransformableClass(PGTypeInstance(obj)^.g_class);
end;



end.
