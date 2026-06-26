unit gliststore;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2015 Lars Uebernickel
 * Copyright 2015 Ryan Lortie
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *     Lars Uebernickel <lars@uebernic.de>
 *     Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_LIST_STORE_H__}
{$define __G_LIST_STORE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{G_DECLARE_FINAL_TYPE(GListStore, g_list_store, G, LIST_STORE, GObject) }
function g_list_store_new(item_type:TGType):PGListStore;cdecl;external libgio2;
procedure g_list_store_insert(store:PGListStore; position:Tguint; item:Tgpointer);cdecl;external libgio2;
function g_list_store_insert_sorted(store:PGListStore; item:Tgpointer; compare_func:TGCompareDataFunc; user_data:Tgpointer):Tguint;cdecl;external libgio2;
procedure g_list_store_sort(store:PGListStore; compare_func:TGCompareDataFunc; user_data:Tgpointer);cdecl;external libgio2;
procedure g_list_store_append(store:PGListStore; item:Tgpointer);cdecl;external libgio2;
procedure g_list_store_remove(store:PGListStore; position:Tguint);cdecl;external libgio2;
procedure g_list_store_remove_all(store:PGListStore);cdecl;external libgio2;
procedure g_list_store_splice(store:PGListStore; position:Tguint; n_removals:Tguint; additions:Pgpointer; n_additions:Tguint);cdecl;external libgio2;
function g_list_store_find(store:PGListStore; item:Tgpointer; position:Pguint):Tgboolean;cdecl;external libgio2;
function g_list_store_find_with_equal_func(store:PGListStore; item:Tgpointer; equal_func:TGEqualFunc; position:Pguint):Tgboolean;cdecl;external libgio2;
function g_list_store_find_with_equal_func_full(store:PGListStore; item:Tgpointer; equal_func:TGEqualFuncFull; user_data:Tgpointer; position:Pguint):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_LIST_STORE_H__  }

// === Konventiert am: 26-6-26 19:39:55 ===

function G_TYPE_LIST_STORE: TGType;
function G_LIST_STORE(obj: Pointer): PGListStore;
function G_IS_LIST_STORE(obj: Pointer): Tgboolean;

implementation

function G_TYPE_LIST_STORE: TGType;
begin
  Result := g_list_store_get_type;
end;

function G_LIST_STORE(obj: Pointer): PGListStore;
begin
  Result := PGListStore(g_type_check_instance_cast(obj, G_TYPE_LIST_STORE));
end;

function G_IS_LIST_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LIST_STORE);
end;

type 
  TGListStore = record
  end;
  PGListStore = ^TGListStore;

  TGListStoreClass = record
    parent_class: TGObjectClass;
  end;
  PGListStoreClass = ^TGListStoreClass;

function g_list_store_get_type: TGType; cdecl; external libgxxxxxxx;



end.
