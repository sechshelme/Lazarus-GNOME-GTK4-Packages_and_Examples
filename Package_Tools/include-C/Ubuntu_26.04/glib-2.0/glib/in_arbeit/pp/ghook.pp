
unit ghook;
interface

{
  Automatically converted by H2Pas 1.0.0 from ghook.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ghook.h
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
PGHook  = ^GHook;
PGHookFlagMask  = ^GHookFlagMask;
PGHookList  = ^GHookList;
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
{$ifndef __G_HOOK_H__}
{$define __G_HOOK_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmem.h>}
{ --- typedefs ---  }
type

  TGHookCompareFunc = function (new_hook:PGHook; sibling:PGHook):Tgint;cdecl;

  TGHookFindFunc = function (hook:PGHook; data:Tgpointer):Tgboolean;cdecl;

  TGHookMarshaller = procedure (hook:PGHook; marshal_data:Tgpointer);cdecl;

  TGHookCheckMarshaller = function (hook:PGHook; marshal_data:Tgpointer):Tgboolean;cdecl;

  TGHookFunc = procedure (data:Tgpointer);cdecl;

  TGHookCheckFunc = function (data:Tgpointer):Tgboolean;cdecl;

  TGHookFinalizeFunc = procedure (hook_list:PGHookList; hook:PGHook);cdecl;
{< private > }
{< private > }

  PGHookFlagMask = ^TGHookFlagMask;
  TGHookFlagMask =  Longint;
  Const
    G_HOOK_FLAG_ACTIVE = 1 shl 0;
    G_HOOK_FLAG_IN_CALL = 1 shl 1;
    G_HOOK_FLAG_RESERVED1 = 1 shl 2;
    G_HOOK_FLAG_RESERVED2 = 1 shl 3;
    G_HOOK_FLAG_MASK = $0f;
;
  G_HOOK_FLAG_USER_SHIFT = 4;  
{ --- structures ---  }
type
  PGHookList = ^TGHookList;
  TGHookList = record
      seq_id : Tgulong;
      flag0 : longint;
      hooks : PGHook;
      dummy3 : Tgpointer;
      finalize_hook : TGHookFinalizeFunc;
      dummy : array[0..1] of Tgpointer;
    end;


const
  bm_TGHookList_hook_size = $FFFF;
  bp_TGHookList_hook_size = 0;
  bm_TGHookList_is_setup = $10000;
  bp_TGHookList_is_setup = 16;

function hook_size(var a : TGHookList) : Tguint;
procedure set_hook_size(var a : TGHookList; __hook_size : Tguint);
function is_setup(var a : TGHookList) : Tguint;
procedure set_is_setup(var a : TGHookList; __is_setup : Tguint);
type
  PGHook = ^TGHook;
  TGHook = record
      data : Tgpointer;
      next : PGHook;
      prev : PGHook;
      ref_count : Tguint;
      hook_id : Tgulong;
      flags : Tguint;
      func : Tgpointer;
      destroy : TGDestroyNotify;
    end;

{ --- macros ---  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function G_HOOK(hook : longint) : PGHook;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_FLAGS(hook : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_ACTIVE(hook : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_IN_CALL(hook : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_IS_VALID(hook : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_IS_UNLINKED(hook : longint) : longint;

{ --- prototypes ---  }
{ callback maintenance functions  }
procedure g_hook_list_init(hook_list:PGHookList; hook_size:Tguint);cdecl;external;
procedure g_hook_list_clear(hook_list:PGHookList);cdecl;external;
function g_hook_alloc(hook_list:PGHookList):PGHook;cdecl;external;
procedure g_hook_free(hook_list:PGHookList; hook:PGHook);cdecl;external;
function g_hook_ref(hook_list:PGHookList; hook:PGHook):PGHook;cdecl;external;
procedure g_hook_unref(hook_list:PGHookList; hook:PGHook);cdecl;external;
function g_hook_destroy(hook_list:PGHookList; hook_id:Tgulong):Tgboolean;cdecl;external;
procedure g_hook_destroy_link(hook_list:PGHookList; hook:PGHook);cdecl;external;
procedure g_hook_prepend(hook_list:PGHookList; hook:PGHook);cdecl;external;
procedure g_hook_insert_before(hook_list:PGHookList; sibling:PGHook; hook:PGHook);cdecl;external;
procedure g_hook_insert_sorted(hook_list:PGHookList; hook:PGHook; func:TGHookCompareFunc);cdecl;external;
function g_hook_get(hook_list:PGHookList; hook_id:Tgulong):PGHook;cdecl;external;
function g_hook_find(hook_list:PGHookList; need_valids:Tgboolean; func:TGHookFindFunc; data:Tgpointer):PGHook;cdecl;external;
function g_hook_find_data(hook_list:PGHookList; need_valids:Tgboolean; data:Tgpointer):PGHook;cdecl;external;
function g_hook_find_func(hook_list:PGHookList; need_valids:Tgboolean; func:Tgpointer):PGHook;cdecl;external;
function g_hook_find_func_data(hook_list:PGHookList; need_valids:Tgboolean; func:Tgpointer; data:Tgpointer):PGHook;cdecl;external;
{ return the first valid hook, and increment its reference count  }
function g_hook_first_valid(hook_list:PGHookList; may_be_in_call:Tgboolean):PGHook;cdecl;external;
{ return the next valid hook with incremented reference count, and
 * decrement the reference count of the original hook
  }
function g_hook_next_valid(hook_list:PGHookList; hook:PGHook; may_be_in_call:Tgboolean):PGHook;cdecl;external;
{ GHookCompareFunc implementation to insert hooks sorted by their id  }
function g_hook_compare_ids(new_hook:PGHook; sibling:PGHook):Tgint;cdecl;external;
{ convenience macros  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_hook_append(hook_list,hook : longint) : longint;

{ invoke all valid hooks with the (*GHookFunc) signature.
  }
procedure g_hook_list_invoke(hook_list:PGHookList; may_recurse:Tgboolean);cdecl;external;
{ invoke all valid hooks with the (*GHookCheckFunc) signature,
 * and destroy the hook if FALSE is returned.
  }
procedure g_hook_list_invoke_check(hook_list:PGHookList; may_recurse:Tgboolean);cdecl;external;
{ invoke a marshaller on all valid hooks.
  }
procedure g_hook_list_marshal(hook_list:PGHookList; may_recurse:Tgboolean; marshaller:TGHookMarshaller; marshal_data:Tgpointer);cdecl;external;
procedure g_hook_list_marshal_check(hook_list:PGHookList; may_recurse:Tgboolean; marshaller:TGHookCheckMarshaller; marshal_data:Tgpointer);cdecl;external;
{$endif}
{ __G_HOOK_H__  }

implementation

function hook_size(var a : TGHookList) : Tguint;
begin
  hook_size:=(a.flag0 and bm_TGHookList_hook_size) shr bp_TGHookList_hook_size;
end;

procedure set_hook_size(var a : TGHookList; __hook_size : Tguint);
begin
  a.flag0:=a.flag0 or ((__hook_size shl bp_TGHookList_hook_size) and bm_TGHookList_hook_size);
end;

function is_setup(var a : TGHookList) : Tguint;
begin
  is_setup:=(a.flag0 and bm_TGHookList_is_setup) shr bp_TGHookList_is_setup;
end;

procedure set_is_setup(var a : TGHookList; __is_setup : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_setup shl bp_TGHookList_is_setup) and bm_TGHookList_is_setup);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function G_HOOK(hook : longint) : PGHook;
begin
  G_HOOK:=PGHook(hook);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_FLAGS(hook : longint) : longint;
begin
  G_HOOK_FLAGS:=(G_HOOK(hook))^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_ACTIVE(hook : longint) : longint;
begin
  G_HOOK_ACTIVE:=((G_HOOK_FLAGS(hook)) and G_HOOK_FLAG_ACTIVE)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_IN_CALL(hook : longint) : longint;
begin
  G_HOOK_IN_CALL:=((G_HOOK_FLAGS(hook)) and G_HOOK_FLAG_IN_CALL)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_IS_VALID(hook : longint) : longint;
begin
  G_HOOK_IS_VALID:=((G_HOOK(hook))^.hook_id)<>(0 and (@((G_HOOK_FLAGS(hook)) and G_HOOK_FLAG_ACTIVE)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_HOOK_IS_UNLINKED(hook : longint) : longint;
begin
  G_HOOK_IS_UNLINKED:=(((((G_HOOK(hook))^.next)=(NULL and (@((G_HOOK(hook))^.prev))))=(NULL and (@((G_HOOK(hook))^.hook_id))))=(0 and (@((G_HOOK(hook))^.ref_count))))=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_hook_append(hook_list,hook : longint) : longint;
begin
  g_hook_append:=g_hook_insert_before(hook_list,NULL,hook);
end;


end.
