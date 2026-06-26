unit gemblem;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Clemens N. Buss <cebuzz@gmail.com>
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
  }
{$ifndef __G_EMBLEM_H__}
{$define __G_EMBLEM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gioenums.h>}

type

function g_emblem_get_type:TGType;cdecl;external libgio2;
function g_emblem_new(icon:PGIcon):PGEmblem;cdecl;external libgio2;
function g_emblem_new_with_origin(icon:PGIcon; origin:TGEmblemOrigin):PGEmblem;cdecl;external libgio2;
function g_emblem_get_icon(emblem:PGEmblem):PGIcon;cdecl;external libgio2;
function g_emblem_get_origin(emblem:PGEmblem):TGEmblemOrigin;cdecl;external libgio2;
{$endif}
{ __G_EMBLEM_H__  }

// === Konventiert am: 26-6-26 19:23:10 ===

function G_TYPE_EMBLEM : TGType;
function G_EMBLEM(obj : Pointer) : PGEmblem;
function G_EMBLEM_CLASS(klass : Pointer) : PGEmblemClass;
function G_IS_EMBLEM(obj : Pointer) : Tgboolean;
function G_IS_EMBLEM_CLASS(klass : Pointer) : Tgboolean;
function G_EMBLEM_GET_CLASS(obj : Pointer) : PGEmblemClass;

implementation

function G_TYPE_EMBLEM : TGType;
  begin
    G_TYPE_EMBLEM:=g_emblem_get_type;
  end;

function G_EMBLEM(obj : Pointer) : PGEmblem;
begin
  Result := PGEmblem(g_type_check_instance_cast(obj, G_TYPE_EMBLEM));
end;

function G_EMBLEM_CLASS(klass : Pointer) : PGEmblemClass;
begin
  Result := PGEmblemClass(g_type_check_class_cast(klass, G_TYPE_EMBLEM));
end;

function G_IS_EMBLEM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_EMBLEM);
end;

function G_IS_EMBLEM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_EMBLEM);
end;

function G_EMBLEM_GET_CLASS(obj : Pointer) : PGEmblemClass;
begin
  Result := PGEmblemClass(PGTypeInstance(obj)^.g_class);
end;



end.
