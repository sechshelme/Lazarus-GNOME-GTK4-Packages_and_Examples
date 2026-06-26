
unit glistmodel;
interface

{
  Automatically converted by H2Pas 1.0.0 from glistmodel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glistmodel.h
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
PGListModel  = ^GListModel;
PGListModelInterface  = ^GListModelInterface;
PGObject  = ^GObject;
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

{ was #define dname def_expr }
function G_TYPE_LIST_MODEL : longint; { return type might be wrong }

{G_DECLARE_INTERFACE(GListModel, g_list_model, G, LIST_MODEL, GObject) }
type
  PGListModelInterface = ^TGListModelInterface;
  TGListModelInterface = record
      g_iface : TGTypeInterface;
      get_item_type : function (list:PGListModel):TGType;cdecl;
      get_n_items : function (list:PGListModel):Tguint;cdecl;
      get_item : function (list:PGListModel; position:Tguint):Tgpointer;cdecl;
    end;


function g_list_model_get_item_type(list:PGListModel):TGType;cdecl;external;
function g_list_model_get_n_items(list:PGListModel):Tguint;cdecl;external;
function g_list_model_get_item(list:PGListModel; position:Tguint):Tgpointer;cdecl;external;
function g_list_model_get_object(list:PGListModel; position:Tguint):PGObject;cdecl;external;
procedure g_list_model_items_changed(list:PGListModel; position:Tguint; removed:Tguint; added:Tguint);cdecl;external;
{$endif}
{ __G_LIST_MODEL_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_LIST_MODEL : longint; { return type might be wrong }
  begin
    G_TYPE_LIST_MODEL:=g_list_model_get_type;
  end;


end.
