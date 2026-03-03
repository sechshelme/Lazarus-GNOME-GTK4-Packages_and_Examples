
unit lsmdomnodelist;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomnodelist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomnodelist.h
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
PLsmDomNodeList  = ^LsmDomNodeList;
PLsmDomNodeListClass  = ^LsmDomNodeListClass;
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

{ was #define dname def_expr }
function LSM_TYPE_DOM_NODE_LIST : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NODE_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NODE_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NODE_LIST(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NODE_LIST_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NODE_LIST_GET_CLASS(obj : longint) : longint;

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


function lsm_dom_node_list_get_type:TGType;cdecl;external;
function lsm_dom_node_list_get_item(list:PLsmDomNodeList; index:dword):PLsmDomNode;cdecl;external;
function lsm_dom_node_list_get_length(list:PLsmDomNodeList):dword;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_DOM_NODE_LIST : longint; { return type might be wrong }
  begin
    LSM_TYPE_DOM_NODE_LIST:=lsm_dom_node_list_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NODE_LIST(obj : longint) : longint;
begin
  LSM_DOM_NODE_LIST:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_DOM_NODE_LIST,LsmDomNodeList);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NODE_LIST_CLASS(klass : longint) : longint;
begin
  LSM_DOM_NODE_LIST_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_DOM_NODE_LIST,LsmDomNodeListClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NODE_LIST(obj : longint) : longint;
begin
  LSM_IS_DOM_NODE_LIST:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_DOM_NODE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_NODE_LIST_CLASS(klass : longint) : longint;
begin
  LSM_IS_DOM_NODE_LIST_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_DOM_NODE_LIST);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_NODE_LIST_GET_CLASS(obj : longint) : longint;
begin
  LSM_DOM_NODE_LIST_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_DOM_NODE_LIST,LsmDomNodeListClass);
end;


end.
