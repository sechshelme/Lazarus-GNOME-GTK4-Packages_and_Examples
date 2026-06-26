unit glistmodel;

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
{$ifndef __G_LIST_MODEL_H__}
{$define __G_LIST_MODEL_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{G_DECLARE_INTERFACE(GListModel, g_list_model, G, LIST_MODEL, GObject) }
type
  PGListModelInterface = ^TGListModelInterface;
  TGListModelInterface = record
      g_iface : TGTypeInterface;
      get_item_type : function (list:PGListModel):TGType;cdecl;
      get_n_items : function (list:PGListModel):Tguint;cdecl;
      get_item : function (list:PGListModel; position:Tguint):Tgpointer;cdecl;
    end;


function g_list_model_get_item_type(list:PGListModel):TGType;cdecl;external libgio2;
function g_list_model_get_n_items(list:PGListModel):Tguint;cdecl;external libgio2;
function g_list_model_get_item(list:PGListModel; position:Tguint):Tgpointer;cdecl;external libgio2;
function g_list_model_get_object(list:PGListModel; position:Tguint):PGObject;cdecl;external libgio2;
procedure g_list_model_items_changed(list:PGListModel; position:Tguint; removed:Tguint; added:Tguint);cdecl;external libgio2;
{$endif}
{ __G_LIST_MODEL_H__  }

// === Konventiert am: 26-6-26 19:39:59 ===

function G_TYPE_LIST_MODEL: TGType;
function G_LIST_MODEL(obj: Pointer): PGListModel;
function G_IS_LIST_MODEL(obj: Pointer): Tgboolean;
function G_LIST_MODEL_GET_IFACE(obj: Pointer): PGListModelInterface;

implementation

function G_TYPE_LIST_MODEL: TGType;
begin
  Result := g_list_model_get_type;
end;

function G_LIST_MODEL(obj: Pointer): PGListModel;
begin
  Result := PGListModel(g_type_check_instance_cast(obj, G_TYPE_LIST_MODEL));
end;

function G_IS_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LIST_MODEL);
end;

function G_LIST_MODEL_GET_IFACE(obj: Pointer): PGListModelInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_LIST_MODEL);
end;

type 
  TGListModel = record
  end;
  PGListModel = ^TGListModel;

  TGListModelInterface = record
  end;
  PGListModelInterface = ^TGListModelInterface;

function g_list_model_get_type: TGType; cdecl; external libgxxxxxxx;



end.
