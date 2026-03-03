unit lsmsvgfiltercomposite;

interface

uses
  fp_glib2, fp_lasem;

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
{$ifndef LSM_SVG_FILTER_COMPOSITE_H}
{$define LSM_SVG_FILTER_COMPOSITE_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterComposite = ^TLsmSvgFilterComposite;
  TLsmSvgFilterComposite = record
      base : TLsmSvgFilterPrimitive;
      in2 : TLsmAttribute;
      op : TLsmSvgBlendingModeAttribute;
    end;

  PLsmSvgFilterCompositeClass = ^TLsmSvgFilterCompositeClass;
  TLsmSvgFilterCompositeClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_composite_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_composite_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:00:33 ===

function LSM_TYPE_SVG_FILTER_COMPOSITE : TGType;
function LSM_SVG_FILTER_COMPOSITE(obj : Pointer) : PLsmSvgFilterComposite;
function LSM_SVG_FILTER_COMPOSITE_CLASS(klass : Pointer) : PLsmSvgFilterCompositeClass;
function LSM_IS_SVG_FILTER_COMPOSITE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_COMPOSITE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_COMPOSITE_GET_CLASS(obj : Pointer) : PLsmSvgFilterCompositeClass;

implementation

function LSM_TYPE_SVG_FILTER_COMPOSITE : TGType;
  begin
    LSM_TYPE_SVG_FILTER_COMPOSITE:=lsm_svg_filter_composite_get_type;
  end;

function LSM_SVG_FILTER_COMPOSITE(obj : Pointer) : PLsmSvgFilterComposite;
begin
  Result := PLsmSvgFilterComposite(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_COMPOSITE));
end;

function LSM_SVG_FILTER_COMPOSITE_CLASS(klass : Pointer) : PLsmSvgFilterCompositeClass;
begin
  Result := PLsmSvgFilterCompositeClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_COMPOSITE));
end;

function LSM_IS_SVG_FILTER_COMPOSITE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_COMPOSITE);
end;

function LSM_IS_SVG_FILTER_COMPOSITE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_COMPOSITE);
end;

function LSM_SVG_FILTER_COMPOSITE_GET_CLASS(obj : Pointer) : PLsmSvgFilterCompositeClass;
begin
  Result := PLsmSvgFilterCompositeClass(PGTypeInstance(obj)^.g_class);
end;



end.
