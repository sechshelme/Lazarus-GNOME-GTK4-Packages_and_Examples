
unit gtree;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtree.h
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
Pgpointer  = ^gpointer;
PGTree  = ^GTree;
PGTreeNode  = ^GTreeNode;
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
{$ifndef __G_TREE_H__}
{$define __G_TREE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gnode.h>}
{$undef G_TREE_DEBUG}
type
{*
 * GTreeNode:
 *
 * An opaque type which identifies a specific node in a #GTree.
 *
 * Since: 2.68
  }

  TGTraverseFunc = function (key:Tgpointer; value:Tgpointer; data:Tgpointer):Tgboolean;cdecl;
{*
 * GTraverseNodeFunc:
 * @node: a #GTreeNode
 * @data: user data passed to g_tree_foreach_node()
 *
 * Specifies the type of function passed to g_tree_foreach_node(). It is
 * passed each node, together with the @user_data parameter passed to
 * g_tree_foreach_node(). If the function returns %TRUE, the traversal is
 * stopped.
 *
 * Returns: %TRUE to stop the traversal
 * Since: 2.68
  }

  TGTraverseNodeFunc = function (node:PGTreeNode; data:Tgpointer):Tgboolean;cdecl;
{ Balanced binary trees
  }

function g_tree_new(key_compare_func:TGCompareFunc):PGTree;cdecl;external;
function g_tree_new_with_data(key_compare_func:TGCompareDataFunc; key_compare_data:Tgpointer):PGTree;cdecl;external;
function g_tree_new_full(key_compare_func:TGCompareDataFunc; key_compare_data:Tgpointer; key_destroy_func:TGDestroyNotify; value_destroy_func:TGDestroyNotify):PGTree;cdecl;external;
function g_tree_node_first(tree:PGTree):PGTreeNode;cdecl;external;
function g_tree_node_last(tree:PGTree):PGTreeNode;cdecl;external;
function g_tree_node_previous(node:PGTreeNode):PGTreeNode;cdecl;external;
function g_tree_node_next(node:PGTreeNode):PGTreeNode;cdecl;external;
function g_tree_ref(tree:PGTree):PGTree;cdecl;external;
procedure g_tree_unref(tree:PGTree);cdecl;external;
procedure g_tree_destroy(tree:PGTree);cdecl;external;
function g_tree_insert_node(tree:PGTree; key:Tgpointer; value:Tgpointer):PGTreeNode;cdecl;external;
procedure g_tree_insert(tree:PGTree; key:Tgpointer; value:Tgpointer);cdecl;external;
function g_tree_replace_node(tree:PGTree; key:Tgpointer; value:Tgpointer):PGTreeNode;cdecl;external;
procedure g_tree_replace(tree:PGTree; key:Tgpointer; value:Tgpointer);cdecl;external;
function g_tree_remove(tree:PGTree; key:Tgconstpointer):Tgboolean;cdecl;external;
procedure g_tree_remove_all(tree:PGTree);cdecl;external;
function g_tree_steal(tree:PGTree; key:Tgconstpointer):Tgboolean;cdecl;external;
function g_tree_node_key(node:PGTreeNode):Tgpointer;cdecl;external;
function g_tree_node_value(node:PGTreeNode):Tgpointer;cdecl;external;
function g_tree_lookup_node(tree:PGTree; key:Tgconstpointer):PGTreeNode;cdecl;external;
function g_tree_lookup(tree:PGTree; key:Tgconstpointer):Tgpointer;cdecl;external;
function g_tree_lookup_extended(tree:PGTree; lookup_key:Tgconstpointer; orig_key:Pgpointer; value:Pgpointer):Tgboolean;cdecl;external;
procedure g_tree_foreach(tree:PGTree; func:TGTraverseFunc; user_data:Tgpointer);cdecl;external;
procedure g_tree_foreach_node(tree:PGTree; func:TGTraverseNodeFunc; user_data:Tgpointer);cdecl;external;
procedure g_tree_traverse(tree:PGTree; traverse_func:TGTraverseFunc; traverse_type:TGTraverseType; user_data:Tgpointer);cdecl;external;
function g_tree_search_node(tree:PGTree; search_func:TGCompareFunc; user_data:Tgconstpointer):PGTreeNode;cdecl;external;
function g_tree_search(tree:PGTree; search_func:TGCompareFunc; user_data:Tgconstpointer):Tgpointer;cdecl;external;
function g_tree_lower_bound(tree:PGTree; key:Tgconstpointer):PGTreeNode;cdecl;external;
function g_tree_upper_bound(tree:PGTree; key:Tgconstpointer):PGTreeNode;cdecl;external;
function g_tree_height(tree:PGTree):Tgint;cdecl;external;
function g_tree_nnodes(tree:PGTree):Tgint;cdecl;external;
{$ifdef G_TREE_DEBUG}
{< private > }
{$ifndef __GTK_DOC_IGNORE__}

procedure g_tree_dump(tree:PGTree);cdecl;external;
{$endif}
{ !__GTK_DOC_IGNORE__  }
{$endif}
{ G_TREE_DEBUG  }
{$endif}
{ __G_TREE_H__  }

implementation


end.
