unit lsmsvgfilteroffset;

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
{$ifndef LSM_SVG_FILTER_OFFSET_H}
{$define LSM_SVG_FILTER_OFFSET_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterOffset = ^TLsmSvgFilterOffset;
  TLsmSvgFilterOffset = record
      base : TLsmSvgFilterPrimitive;
      dx : TLsmSvgDoubleAttribute;
      dy : TLsmSvgDoubleAttribute;
    end;

  PLsmSvgFilterOffsetClass = ^TLsmSvgFilterOffsetClass;
  TLsmSvgFilterOffsetClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_offset_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_offset_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:01:10 ===

function LSM_TYPE_SVG_FILTER_OFFSET : TGType;
function LSM_SVG_FILTER_OFFSET(obj : Pointer) : PLsmSvgFilterOffset;
function LSM_SVG_FILTER_OFFSET_CLASS(klass : Pointer) : PLsmSvgFilterOffsetClass;
function LSM_IS_SVG_FILTER_OFFSET(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_OFFSET_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_OFFSET_GET_CLASS(obj : Pointer) : PLsmSvgFilterOffsetClass;

implementation

function LSM_TYPE_SVG_FILTER_OFFSET : TGType;
  begin
    LSM_TYPE_SVG_FILTER_OFFSET:=lsm_svg_filter_offset_get_type;
  end;

function LSM_SVG_FILTER_OFFSET(obj : Pointer) : PLsmSvgFilterOffset;
begin
  Result := PLsmSvgFilterOffset(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_OFFSET));
end;

function LSM_SVG_FILTER_OFFSET_CLASS(klass : Pointer) : PLsmSvgFilterOffsetClass;
begin
  Result := PLsmSvgFilterOffsetClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_OFFSET));
end;

function LSM_IS_SVG_FILTER_OFFSET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_OFFSET);
end;

function LSM_IS_SVG_FILTER_OFFSET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_OFFSET);
end;

function LSM_SVG_FILTER_OFFSET_GET_CLASS(obj : Pointer) : PLsmSvgFilterOffsetClass;
begin
  Result := PLsmSvgFilterOffsetClass(PGTypeInstance(obj)^.g_class);
end;



end.
