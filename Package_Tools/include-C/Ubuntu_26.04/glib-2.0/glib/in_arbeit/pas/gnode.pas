unit gnode;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_NODE_H__}
{$define __G_NODE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmem.h>}
type
{ Tree traverse flags  }

  PGTraverseFlags = ^TGTraverseFlags;
  TGTraverseFlags =  Longint;
  Const
    G_TRAVERSE_LEAVES = 1 shl 0;
    G_TRAVERSE_NON_LEAVES = 1 shl 1;
    G_TRAVERSE_ALL = G_TRAVERSE_LEAVES or G_TRAVERSE_NON_LEAVES;
    G_TRAVERSE_MASK = $03;
    G_TRAVERSE_LEAFS = G_TRAVERSE_LEAVES;
    G_TRAVERSE_NON_LEAFS = G_TRAVERSE_NON_LEAVES;
;
{ Tree traverse orders  }
type
  PGTraverseType = ^TGTraverseType;
  TGTraverseType =  Longint;
  Const
    G_IN_ORDER = 0;
    G_PRE_ORDER = 1;
    G_POST_ORDER = 2;
    G_LEVEL_ORDER = 3;
;
type

  TGNodeTraverseFunc = function (node:PGNode; data:Tgpointer):Tgboolean;cdecl;

  TGNodeForeachFunc = procedure (node:PGNode; data:Tgpointer);cdecl;
{ N-way tree implementation
  }
  PGNode = ^TGNode;
  TGNode = record
      data : Tgpointer;cdecl;
      next : PGNode;
      prev : PGNode;
      parent : PGNode;
      children : PGNode;
    end;

{*
 * G_NODE_IS_ROOT:
 * @node: a #GNode
 *
 * Returns %TRUE if a #GNode is the root of a tree.
 *
 * Returns: %TRUE if the #GNode is the root of a tree 
 *     (i.e. it has no parent or siblings)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_NODE_IS_ROOT(node : longint) : longint;

{*
 * G_NODE_IS_LEAF:
 * @node: a #GNode
 *
 * Returns %TRUE if a #GNode is a leaf node.
 *
 * Returns: %TRUE if the #GNode is a leaf node 
 *     (i.e. it has no children)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NODE_IS_LEAF(node : longint) : longint;

function g_node_new(data:Tgpointer):PGNode;cdecl;external libglib2;
procedure g_node_destroy(root:PGNode);cdecl;external libglib2;
procedure g_node_unlink(node:PGNode);cdecl;external libglib2;
function g_node_copy_deep(node:PGNode; copy_func:TGCopyFunc; data:Tgpointer):PGNode;cdecl;external libglib2;
function g_node_copy(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_insert(parent:PGNode; position:Tgint; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_insert_before(parent:PGNode; sibling:PGNode; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_insert_after(parent:PGNode; sibling:PGNode; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_prepend(parent:PGNode; node:PGNode):PGNode;cdecl;external libglib2;
function g_node_n_nodes(root:PGNode; flags:TGTraverseFlags):Tguint;cdecl;external libglib2;
function g_node_get_root(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_is_ancestor(node:PGNode; descendant:PGNode):Tgboolean;cdecl;external libglib2;
function g_node_depth(node:PGNode):Tguint;cdecl;external libglib2;
function g_node_find(root:PGNode; order:TGTraverseType; flags:TGTraverseFlags; data:Tgpointer):PGNode;cdecl;external libglib2;
{ convenience macros  }
{*
 * g_node_append:
 * @parent: the #GNode to place the new #GNode under
 * @node: the #GNode to insert
 *
 * Inserts a #GNode as the last child of the given parent.
 *
 * Returns: the inserted #GNode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_append(parent,node : longint) : longint;

{*
 * g_node_insert_data:
 * @parent: the #GNode to place the new #GNode under
 * @position: the position to place the new #GNode at. If position is -1, 
 *     the new #GNode is inserted as the last child of @parent
 * @data: the data for the new #GNode
 *
 * Inserts a new #GNode at the given position.
 *
 * Returns: the new #GNode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_insert_data(parent,position,data : longint) : longint;

{*
 * g_node_insert_data_after:
 * @parent: the #GNode to place the new #GNode under
 * @sibling: the sibling #GNode to place the new #GNode after
 * @data: the data for the new #GNode
 *
 * Inserts a new #GNode after the given sibling.
 *
 * Returns: the new #GNode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_insert_data_after(parent,sibling,data : longint) : longint;

{*
 * g_node_insert_data_before:
 * @parent: the #GNode to place the new #GNode under
 * @sibling: the sibling #GNode to place the new #GNode before
 * @data: the data for the new #GNode
 *
 * Inserts a new #GNode before the given sibling.
 *
 * Returns: the new #GNode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_insert_data_before(parent,sibling,data : longint) : longint;

{*
 * g_node_prepend_data:
 * @parent: the #GNode to place the new #GNode under
 * @data: the data for the new #GNode
 *
 * Inserts a new #GNode as the first child of the given parent.
 *
 * Returns: the new #GNode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_prepend_data(parent,data : longint) : longint;

{*
 * g_node_append_data:
 * @parent: the #GNode to place the new #GNode under
 * @data: the data for the new #GNode
 *
 * Inserts a new #GNode as the last child of the given parent.
 *
 * Returns: the new #GNode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_append_data(parent,data : longint) : longint;

{ traversal function, assumes that 'node' is root
 * (only traverses 'node' and its subtree).
 * this function is just a high level interface to
 * low level traversal functions, optimized for speed.
  }
procedure g_node_traverse(root:PGNode; order:TGTraverseType; flags:TGTraverseFlags; max_depth:Tgint; func:TGNodeTraverseFunc; 
            data:Tgpointer);cdecl;external libglib2;
{ return the maximum tree height starting with 'node', this is an expensive
 * operation, since we need to visit all nodes. this could be shortened by
 * adding 'guint height' to struct _GNode, but then again, this is not very
 * often needed, and would make g_node_insert() more time consuming.
  }
function g_node_max_height(root:PGNode):Tguint;cdecl;external libglib2;
procedure g_node_children_foreach(node:PGNode; flags:TGTraverseFlags; func:TGNodeForeachFunc; data:Tgpointer);cdecl;external libglib2;
procedure g_node_reverse_children(node:PGNode);cdecl;external libglib2;
function g_node_n_children(node:PGNode):Tguint;cdecl;external libglib2;
function g_node_nth_child(node:PGNode; n:Tguint):PGNode;cdecl;external libglib2;
function g_node_last_child(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_find_child(node:PGNode; flags:TGTraverseFlags; data:Tgpointer):PGNode;cdecl;external libglib2;
function g_node_child_position(node:PGNode; child:PGNode):Tgint;cdecl;external libglib2;
function g_node_child_index(node:PGNode; data:Tgpointer):Tgint;cdecl;external libglib2;
function g_node_first_sibling(node:PGNode):PGNode;cdecl;external libglib2;
function g_node_last_sibling(node:PGNode):PGNode;cdecl;external libglib2;
{*
 * g_node_prev_sibling:
 * @node: a #GNode
 *
 * Gets the previous sibling of a #GNode.
 *
 * Returns: the previous sibling of @node, or %NULL if @node is the first
 *     node or %NULL
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_prev_sibling(node : longint) : longint;

{*
 * g_node_next_sibling:
 * @node: a #GNode
 *
 * Gets the next sibling of a #GNode.
 *
 * Returns: the next sibling of @node, or %NULL if @node is the last node
 *     or %NULL
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_next_sibling(node : longint) : longint;

{*
 * g_node_first_child:
 * @node: a #GNode
 *
 * Gets the first child of a #GNode.
 *
 * Returns: the first child of @node, or %NULL if @node is %NULL 
 *     or has no children
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_first_child(node : longint) : longint;

{$endif}
{ __G_NODE_H__  }

// === Konventiert am: 22-6-26 17:11:17 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NODE_IS_ROOT(node : longint) : longint;
begin
  G_NODE_IS_ROOT:=((((PGNode(node))^.parent)=(NULL and (@((PGNode(node))^.prev))))=(NULL and (@((PGNode(node))^.next))))=NULL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_NODE_IS_LEAF(node : longint) : longint;
begin
  G_NODE_IS_LEAF:=((PGNode(node))^.children)=NULL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_append(parent,node : longint) : longint;
begin
  g_node_append:=g_node_insert_before(parent,NULL,node);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_insert_data(parent,position,data : longint) : longint;
begin
  g_node_insert_data:=g_node_insert(parent,position,g_node_new(data));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_insert_data_after(parent,sibling,data : longint) : longint;
begin
  g_node_insert_data_after:=g_node_insert_after(parent,sibling,g_node_new(data));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_insert_data_before(parent,sibling,data : longint) : longint;
begin
  g_node_insert_data_before:=g_node_insert_before(parent,sibling,g_node_new(data));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_prepend_data(parent,data : longint) : longint;
begin
  g_node_prepend_data:=g_node_prepend(parent,g_node_new(data));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_append_data(parent,data : longint) : longint;
begin
  g_node_append_data:=g_node_insert_before(parent,NULL,g_node_new(data));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_prev_sibling(node : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if node then
    if_local1:=(PGNode(node))^.prev
  else
    if_local1:=NULL;
  g_node_prev_sibling:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_next_sibling(node : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if node then
    if_local1:=(PGNode(node))^.next
  else
    if_local1:=NULL;
  g_node_next_sibling:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_node_first_child(node : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if node then
    if_local1:=(PGNode(node))^.children
  else
    if_local1:=NULL;
  g_node_first_child:=if_local1;
end;


end.
