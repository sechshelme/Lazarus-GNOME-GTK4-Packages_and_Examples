
unit lsmdomnamednodemap;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomnamednodemap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomnamednodemap.h
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
Pchar  = ^char;
PLsmDomNamedNodeMap  = ^LsmDomNamedNodeMap;
PLsmDomNamedNodeMapClass  = ^LsmDomNamedNodeMapClass;
PLsmDomNode  = ^LsmDomNode;
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

{ was #define dname def_expr }
function LSM_TYPE_DOM_NAMED_NODE_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NAMED_NODE_MAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NAMED_NODE_MAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NAMED_NODE_MAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NAMED_NODE_MAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NAMED_NODE_MAP_GET_CLASS(obj : longint) : longint;

type
  PLsmDomNamedNodeMap = ^TLsmDomNamedNodeMap;
  TLsmDomNamedNodeMap = record
      object : TGObject;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
  PLsmDomNamedNodeMapClass = ^TLsmDomNamedNodeMapClass;
  TLsmDomNamedNodeMapClass = record
      parent_class : TGObjectClass;
      get : function (map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;
      set : function (map:PLsmDomNamedNodeMap; node:PLsmDomNode):PLsmDomNode;cdecl;
      remove : function (map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;
      get_item : function (map:PLsmDomNamedNodeMap; index:dword):PLsmDomNode;cdecl;
      get_length : function (map:PLsmDomNamedNodeMap):dword;cdecl;
    end;


function lsm_dom_named_node_map_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_dom_named_node_map_get_named_item(map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;external;
function lsm_dom_named_node_map_set_named_item(map:PLsmDomNamedNodeMap; node:PLsmDomNode):PLsmDomNode;cdecl;external;
(* Const before type ignored *)
function lsm_dom_named_node_map_remove_named_item(map:PLsmDomNamedNodeMap; name:Pchar):PLsmDomNode;cdecl;external;
function lsm_dom_named_node_map_get_item(map:PLsmDomNamedNodeMap; index:dword):PLsmDomNode;cdecl;external;
function lsm_dom_named_node_map_get_length(map:PLsmDomNamedNodeMap):dword;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_DOM_NAMED_NODE_MAP : longint; { return type might be wrong }
  begin
    LSM_TYPE_DOM_NAMED_NODE_MAP:=lsm_dom_named_node_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NAMED_NODE_MAP(obj : longint) : longint;
begin
  LSM_DOM_NAMED_NODE_MAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_DOM_NAMED_NODE_MAP,LsmDomNamedNodeMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NAMED_NODE_MAP_CLASS(klass : longint) : longint;
begin
  LSM_DOM_NAMED_NODE_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_DOM_NAMED_NODE_MAP,LsmDomNamedNodeMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NAMED_NODE_MAP(obj : longint) : longint;
begin
  LSM_IS_DOM_NAMED_NODE_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_DOM_NAMED_NODE_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NAMED_NODE_MAP_CLASS(klass : longint) : longint;
begin
  LSM_IS_DOM_NAMED_NODE_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_DOM_NAMED_NODE_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NAMED_NODE_MAP_GET_CLASS(obj : longint) : longint;
begin
  LSM_DOM_NAMED_NODE_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_DOM_NAMED_NODE_MAP,LsmDomNamedNodeMapClass);
end;


end.
