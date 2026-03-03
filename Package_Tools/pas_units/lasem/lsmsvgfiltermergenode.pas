unit lsmsvgfiltermergenode;

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
{$ifndef LSM_SVG_FILTER_MERGE_NODE_H}
{$define LSM_SVG_FILTER_MERGE_NODE_H}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgfilterprimitive.h>}

type
  PLsmSvgFilterMergeNode = ^TLsmSvgFilterMergeNode;
  TLsmSvgFilterMergeNode = record
      base : TLsmSvgFilterPrimitive;
      std_deviation : TLsmSvgOneOrTwoDoubleAttribute;
    end;

  PLsmSvgFilterMergeNodeClass = ^TLsmSvgFilterMergeNodeClass;
  TLsmSvgFilterMergeNodeClass = record
      element_class : TLsmSvgFilterPrimitiveClass;
    end;


function lsm_svg_filter_merge_node_get_type:TGType;cdecl;external liblasem;
function lsm_svg_filter_merge_node_new:PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 17:01:03 ===

function LSM_TYPE_SVG_FILTER_MERGE_NODE : TGType;
function LSM_SVG_FILTER_MERGE_NODE(obj : Pointer) : PLsmSvgFilterMergeNode;
function LSM_SVG_FILTER_MERGE_NODE_CLASS(klass : Pointer) : PLsmSvgFilterMergeNodeClass;
function LSM_IS_SVG_FILTER_MERGE_NODE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_FILTER_MERGE_NODE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_FILTER_MERGE_NODE_GET_CLASS(obj : Pointer) : PLsmSvgFilterMergeNodeClass;

implementation

function LSM_TYPE_SVG_FILTER_MERGE_NODE : TGType;
  begin
    LSM_TYPE_SVG_FILTER_MERGE_NODE:=lsm_svg_filter_merge_node_get_type;
  end;

function LSM_SVG_FILTER_MERGE_NODE(obj : Pointer) : PLsmSvgFilterMergeNode;
begin
  Result := PLsmSvgFilterMergeNode(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_MERGE_NODE));
end;

function LSM_SVG_FILTER_MERGE_NODE_CLASS(klass : Pointer) : PLsmSvgFilterMergeNodeClass;
begin
  Result := PLsmSvgFilterMergeNodeClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_MERGE_NODE));
end;

function LSM_IS_SVG_FILTER_MERGE_NODE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_FILTER_MERGE_NODE);
end;

function LSM_IS_SVG_FILTER_MERGE_NODE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_FILTER_MERGE_NODE);
end;

function LSM_SVG_FILTER_MERGE_NODE_GET_CLASS(obj : Pointer) : PLsmSvgFilterMergeNodeClass;
begin
  Result := PLsmSvgFilterMergeNodeClass(PGTypeInstance(obj)^.g_class);
end;



end.
