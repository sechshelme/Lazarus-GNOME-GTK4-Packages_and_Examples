unit lsmdomnode;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
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
{$ifndef LSM_DOM_NODE_H}
{$define LSM_DOM_NODE_H}
{$include <lsmdomtypes.h>}
{$include <gio/gio.h>}
type
  PLsmDomNodeType = ^TLsmDomNodeType;
  TLsmDomNodeType =  Longint;
  Const
    LSM_DOM_NODE_TYPE_ELEMENT_NODE = 1;
    LSM_DOM_NODE_TYPE_ATTRIBUTE_NODE = 2;
    LSM_DOM_NODE_TYPE_TEXT_NODE = 3;
    LSM_DOM_NODE_TYPE_CDATA_SECTION_NODE = 4;
    LSM_DOM_NODE_TYPE_ENTITY_REFERENCE_NODE = 5;
    LSM_DOM_NODE_TYPE_ENTITY_NODE = 6;
    LSM_DOM_NODE_TYPE_PROCESSING_INSTRUCTION_NODE = 7;
    LSM_DOM_NODE_TYPE_COMMENT_NODE = 8;
    LSM_DOM_NODE_TYPE_DOCUMENT_NODE = 9;
    LSM_DOM_NODE_TYPE_DOCUMENT_TYPE_NODE = 10;
    LSM_DOM_NODE_TYPE_DOCUMENT_FRAGMENT_NODE = 11;
    LSM_DOM_NODE_TYPE_NOTATION_NODE = 12;
;

type
  PLsmDomNode = ^TLsmDomNode;
  TLsmDomNode = record
      object : TGObject;
      owner_document : PLsmDomDocument;
      next_sibling : PLsmDomNode;
      previous_sibling : PLsmDomNode;
      parent_node : PLsmDomNode;
      first_child : PLsmDomNode;
      last_child : PLsmDomNode;
    end;

{ DOM node virtuals  }
{ Validation virtuals  }
{ Implementation virtuals  }
  PLsmDomNodeClass = ^TLsmDomNodeClass;
  TLsmDomNodeClass = record
      parent_class : TGObjectClass;
      get_node_name : function (self:PLsmDomNode):Pchar;cdecl;
      get_node_value : function (self:PLsmDomNode):Pchar;cdecl;
      set_node_value : procedure (self:PLsmDomNode; new_value:Pchar);cdecl;
      get_node_type : function (self:PLsmDomNode):TLsmDomNodeType;cdecl;
      can_append_child : function (self:PLsmDomNode; new_child:PLsmDomNode):Tgboolean;cdecl;
      post_new_child : procedure (parent:PLsmDomNode; child:PLsmDomNode);cdecl;
      pre_remove_child : procedure (parent:PLsmDomNode; child:PLsmDomNode);cdecl;
      changed : procedure (self:PLsmDomNode);cdecl;
      child_changed : function (self:PLsmDomNode; child:PLsmDomNode):Tgboolean;cdecl;
      write_to_stream : procedure (self:PLsmDomNode; stream:PGOutputStream; error:PPGError);cdecl;
    end;


function lsm_dom_node_get_type:TGType;cdecl;external liblasem;
function lsm_dom_node_get_node_name(self:PLsmDomNode):Pchar;cdecl;external liblasem;
function lsm_dom_node_get_node_value(self:PLsmDomNode):Pchar;cdecl;external liblasem;
procedure lsm_dom_node_set_node_value(self:PLsmDomNode; new_value:Pchar);cdecl;external liblasem;
function lsm_dom_node_get_node_type(self:PLsmDomNode):TLsmDomNodeType;cdecl;external liblasem;
function lsm_dom_node_get_parent_node(self:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_get_child_nodes(self:PLsmDomNode):PLsmDomNodeList;cdecl;external liblasem;
function lsm_dom_node_get_first_child(self:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_get_last_child(self:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_get_previous_sibling(self:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_get_next_sibling(self:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
{$if 0}

function lsm_dom_node_get_attributes(self:PLsmDomNode):PLsmDomNamedNodeMap;cdecl;external liblasem;
{$endif}

function lsm_dom_node_insert_before(self:PLsmDomNode; new_child:PLsmDomNode; ref_child:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_replace_child(self:PLsmDomNode; new_child:PLsmDomNode; old_child:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_append_child(self:PLsmDomNode; new_child:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_remove_child(self:PLsmDomNode; old_child:PLsmDomNode):PLsmDomNode;cdecl;external liblasem;
function lsm_dom_node_has_child_nodes(self:PLsmDomNode):Tgboolean;cdecl;external liblasem;
procedure lsm_dom_node_changed(self:PLsmDomNode);cdecl;external liblasem;
function lsm_dom_node_get_owner_document(self:PLsmDomNode):PLsmDomDocument;cdecl;external liblasem;
procedure lsm_dom_node_write_to_stream(self:PLsmDomNode; stream:PGOutputStream; error:PPGError);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:37:41 ===

function LSM_TYPE_DOM_NODE : TGType;
function LSM_DOM_NODE(obj : Pointer) : PLsmDomNode;
function LSM_DOM_NODE_CLASS(klass : Pointer) : PLsmDomNodeClass;
function LSM_IS_DOM_NODE(obj : Pointer) : Tgboolean;
function LSM_IS_DOM_NODE_CLASS(klass : Pointer) : Tgboolean;
function LSM_DOM_NODE_GET_CLASS(obj : Pointer) : PLsmDomNodeClass;

implementation

function LSM_TYPE_DOM_NODE : TGType;
  begin
    LSM_TYPE_DOM_NODE:=lsm_dom_node_get_type;
  end;

function LSM_DOM_NODE(obj : Pointer) : PLsmDomNode;
begin
  Result := PLsmDomNode(g_type_check_instance_cast(obj, LSM_TYPE_DOM_NODE));
end;

function LSM_DOM_NODE_CLASS(klass : Pointer) : PLsmDomNodeClass;
begin
  Result := PLsmDomNodeClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_NODE));
end;

function LSM_IS_DOM_NODE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_DOM_NODE);
end;

function LSM_IS_DOM_NODE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_DOM_NODE);
end;

function LSM_DOM_NODE_GET_CLASS(obj : Pointer) : PLsmDomNodeClass;
begin
  Result := PLsmDomNodeClass(PGTypeInstance(obj)^.g_class);
end;



end.
