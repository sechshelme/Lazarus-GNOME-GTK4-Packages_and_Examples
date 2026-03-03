unit lsmdomnodelist;

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
{$ifndef LSM_DOM_NODE_LIST_H}
{$define LSM_DOM_NODE_LIST_H}
{$include <lsmdomtypes.h>}

type
  PLsmDomNodeList = ^TLsmDomNodeList;
  TLsmDomNodeList = record
      object : TGObject;
    end;

  PLsmDomNodeListClass = ^TLsmDomNodeListClass;
  TLsmDomNodeListClass = record
      parent_class : TGObjectClass;
      get_item : function (list:PLsmDomNodeList; index:dword):PLsmDomNode;cdecl;
      get_length : function (list:PLsmDomNodeList):dword;cdecl;
    end;


function lsm_dom_node_list_get_type:TGType;cdecl;external liblasem;
function lsm_dom_node_list_get_item(list:PLsmDomNodeList; index:dword):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_list_get_length(list:PLsmDomNodeList):dword;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:37:48 ===

function LSM_TYPE_DOM_NODE_LIST : TGType;
function LSM_DOM_NODE_LIST(obj : Pointer) : PLsmDomNodeList;
function LSM_DOM_NODE_LIST_CLASS(klass : Pointer) : PLsmDomNodeListClass;
function LSM_IS_DOM_NODE_LIST(obj : Pointer) : Tgboolean;
function LSM_IS_DOM_NODE_LIST_CLASS(klass : Pointer) : Tgboolean;
function LSM_DOM_NODE_LIST_GET_CLASS(obj : Pointer) : PLsmDomNodeListClass;

implementation

function LSM_TYPE_DOM_NODE_LIST : TGType;
  begin
    LSM_TYPE_DOM_NODE_LIST:=lsm_dom_node_list_get_type;
  end;

function LSM_DOM_NODE_LIST(obj : Pointer) : PLsmDomNodeList;
begin
  Result := PLsmDomNodeList(g_type_check_instance_cast(obj, LSM_TYPE_DOM_NODE_LIST));
end;

function LSM_DOM_NODE_LIST_CLASS(klass : Pointer) : PLsmDomNodeListClass;
begin
  Result := PLsmDomNodeListClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_NODE_LIST));
end;

function LSM_IS_DOM_NODE_LIST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_DOM_NODE_LIST);
end;

function LSM_IS_DOM_NODE_LIST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_DOM_NODE_LIST);
end;

function LSM_DOM_NODE_LIST_GET_CLASS(obj : Pointer) : PLsmDomNodeListClass;
begin
  Result := PLsmDomNodeListClass(PGTypeInstance(obj)^.g_class);
end;



end.
