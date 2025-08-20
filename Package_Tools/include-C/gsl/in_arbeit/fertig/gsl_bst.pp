
unit gsl_bst;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_bst.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_bst.h
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
Pgsl_bst_allocator  = ^gsl_bst_allocator;
Pgsl_bst_cmp_function  = ^gsl_bst_cmp_function;
Pgsl_bst_trav  = ^gsl_bst_trav;
Pgsl_bst_type  = ^gsl_bst_type;
Pgsl_bst_workspace  = ^gsl_bst_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ bst/gsl_bst.h
 * 
 * Copyright (C) 2018, 2019 Patrick Alken
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_BST_H__}
{$define __GSL_BST_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst_avl.h>}
{$include <gsl/gsl_bst_rb.h>}
{$include <gsl/gsl_bst_types.h>}
{ type of binary search tree  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_bst_type = ^Tgsl_bst_type;
  Tgsl_bst_type = record
      name : Pchar;
      node_size : Tsize_t;
      init : function (allocator:Pgsl_bst_allocator; compare:Pgsl_bst_cmp_function; params:pointer; vtable:pointer):longint;cdecl;
      nodes : function (vtable:pointer):Tsize_t;cdecl;
      insert : function (item:pointer; vtable:pointer):pointer;cdecl;
      find : function (item:pointer; vtable:pointer):pointer;cdecl;
      remove : function (item:pointer; vtable:pointer):pointer;cdecl;
      empty : function (vtable:pointer):longint;cdecl;
      trav_init : function (vtrav:pointer; vtable:pointer):longint;cdecl;
      trav_first : function (vtrav:pointer; vtable:pointer):pointer;cdecl;
      trav_last : function (vtrav:pointer; vtable:pointer):pointer;cdecl;
      trav_find : function (item:pointer; vtrav:pointer; vtable:pointer):pointer;cdecl;
      trav_insert : function (item:pointer; vtrav:pointer; vtable:pointer):pointer;cdecl;
      trav_copy : function (vtrav:pointer; vsrc:pointer):pointer;cdecl;
      trav_next : function (vtrav:pointer):pointer;cdecl;
      trav_prev : function (vtrav:pointer):pointer;cdecl;
      trav_cur : function (vtrav:pointer):pointer;cdecl;
      trav_replace : function (vtrav:pointer; new_item:pointer):pointer;cdecl;
    end;
(* Const before type ignored *)
{ binary search tree type  }

  Pgsl_bst_workspace = ^Tgsl_bst_workspace;
  Tgsl_bst_workspace = record
      _type : Pgsl_bst_type;
      table : record
          case longint of
            0 : ( avl_table : Tgsl_bst_avl_table );
            1 : ( rb_table : Tgsl_bst_rb_table );
          end;
    end;
(* Const before type ignored *)
{ binary search tree type  }

  Pgsl_bst_trav = ^Tgsl_bst_trav;
  Tgsl_bst_trav = record
      _type : Pgsl_bst_type;
      trav_data : record
          case longint of
            0 : ( avl_trav : Tgsl_bst_avl_traverser );
            1 : ( rb_trav : Tgsl_bst_rb_traverser );
          end;
    end;
{ tree types  }
(* Const before type ignored *)
  var
    gsl_bst_avl : Pgsl_bst_type;cvar;external;
(* Const before type ignored *)
    gsl_bst_rb : Pgsl_bst_type;cvar;external;
{
 * Prototypes
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_bst_alloc(T:Pgsl_bst_type; allocator:Pgsl_bst_allocator; compare:Pgsl_bst_cmp_function; params:pointer):Pgsl_bst_workspace;cdecl;external;
procedure gsl_bst_free(w:Pgsl_bst_workspace);cdecl;external;
function gsl_bst_empty(w:Pgsl_bst_workspace):longint;cdecl;external;
function gsl_bst_insert(item:pointer; w:Pgsl_bst_workspace):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_bst_find(item:pointer; w:Pgsl_bst_workspace):pointer;cdecl;external;
(* Const before type ignored *)
function gsl_bst_remove(item:pointer; w:Pgsl_bst_workspace):pointer;cdecl;external;
(* Const before type ignored *)
function gsl_bst_nodes(w:Pgsl_bst_workspace):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_bst_node_size(w:Pgsl_bst_workspace):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_bst_name(w:Pgsl_bst_workspace):Pchar;cdecl;external;
(* Const before type ignored *)
function gsl_bst_trav_init(trav:Pgsl_bst_trav; w:Pgsl_bst_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_bst_trav_first(trav:Pgsl_bst_trav; w:Pgsl_bst_workspace):pointer;cdecl;external;
(* Const before type ignored *)
function gsl_bst_trav_last(trav:Pgsl_bst_trav; w:Pgsl_bst_workspace):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_bst_trav_find(item:pointer; trav:Pgsl_bst_trav; w:Pgsl_bst_workspace):pointer;cdecl;external;
function gsl_bst_trav_insert(item:pointer; trav:Pgsl_bst_trav; w:Pgsl_bst_workspace):pointer;cdecl;external;
(* Const before type ignored *)
function gsl_bst_trav_copy(dest:Pgsl_bst_trav; src:Pgsl_bst_trav):pointer;cdecl;external;
function gsl_bst_trav_next(trav:Pgsl_bst_trav):pointer;cdecl;external;
function gsl_bst_trav_prev(trav:Pgsl_bst_trav):pointer;cdecl;external;
(* Const before type ignored *)
function gsl_bst_trav_cur(trav:Pgsl_bst_trav):pointer;cdecl;external;
function gsl_bst_trav_replace(trav:Pgsl_bst_trav; new_item:pointer):pointer;cdecl;external;
{$endif}
{ __GSL_BST_H__  }

implementation


end.
