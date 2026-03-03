unit lsmdomnamednodemap;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2010 Emmanuel Pacaud
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
{$ifndef LSM_DOM_NAMED_NODE_MAP_H}
{$define LSM_DOM_NAMED_NODE_MAP_H}
{$include <lsmdomtypes.h>}

type
  PLsmDomNamedNodeMap = ^TLsmDomNamedNodeMap;
  TLsmDomNamedNodeMap = record
      object : TGObject;
    end;

  PLsmDomNamedNodeMapClass = ^TLsmDomNamedNodeMapClass;
  TLsmDomNamedNodeMapClass = record
      parent_class : TGObjectClass;
      get : function (map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;
      set : function (map:PLsmDomNamedNodeMap; node:PLsmDomNode):PLsmDomNode;cdecl;
      remove : function (map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;
      get_item : function (map:PLsmDomNamedNodeMap; index:dword):PLsmDomNode;cdecl;
      get_length : function (map:PLsmDomNamedNodeMap):dword;cdecl;
    end;


function lsm_dom_named_node_map_get_type:TGType;cdecl;external liblasem;
function lsm_dom_named_node_map_get_named_item(map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_named_node_map_set_named_item(map:PLsmDomNamedNodeMap; node:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_named_node_map_remove_named_item(map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_named_node_map_get_item(map:PLsmDomNamedNodeMap; index:dword):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_named_node_map_get_length(map:PLsmDomNamedNodeMap):dword;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:37:35 ===

function LSM_TYPE_DOM_NAMED_NODE_MAP : TGType;
function LSM_DOM_NAMED_NODE_MAP(obj : Pointer) : PLsmDomNamedNodeMap;
function LSM_DOM_NAMED_NODE_MAP_CLASS(klass : Pointer) : PLsmDomNamedNodeMapClass;
function LSM_IS_DOM_NAMED_NODE_MAP(obj : Pointer) : Tgboolean;
function LSM_IS_DOM_NAMED_NODE_MAP_CLASS(klass : Pointer) : Tgboolean;
function LSM_DOM_NAMED_NODE_MAP_GET_CLASS(obj : Pointer) : PLsmDomNamedNodeMapClass;

implementation

function LSM_TYPE_DOM_NAMED_NODE_MAP : TGType;
  begin
    LSM_TYPE_DOM_NAMED_NODE_MAP:=lsm_dom_named_node_map_get_type;
  end;

function LSM_DOM_NAMED_NODE_MAP(obj : Pointer) : PLsmDomNamedNodeMap;
begin
  Result := PLsmDomNamedNodeMap(g_type_check_instance_cast(obj, LSM_TYPE_DOM_NAMED_NODE_MAP));
end;

function LSM_DOM_NAMED_NODE_MAP_CLASS(klass : Pointer) : PLsmDomNamedNodeMapClass;
begin
  Result := PLsmDomNamedNodeMapClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_NAMED_NODE_MAP));
end;

function LSM_IS_DOM_NAMED_NODE_MAP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_DOM_NAMED_NODE_MAP);
end;

function LSM_IS_DOM_NAMED_NODE_MAP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_DOM_NAMED_NODE_MAP);
end;

function LSM_DOM_NAMED_NODE_MAP_GET_CLASS(obj : Pointer) : PLsmDomNamedNodeMapClass;
begin
  Result := PLsmDomNamedNodeMapClass(PGTypeInstance(obj)^.g_class);
end;



end.
