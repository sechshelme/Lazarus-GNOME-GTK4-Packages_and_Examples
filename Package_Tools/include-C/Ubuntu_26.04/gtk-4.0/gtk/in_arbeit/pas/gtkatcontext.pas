unit gtkatcontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkatcontext.h: Assistive technology context
 *
 * Copyright 2020  GNOME Foundation
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtkaccessible.h>}

{GDK_DECLARE_INTERNAL_TYPE (GtkATContext, gtk_at_context, GTK, AT_CONTEXT, GObject) }
function gtk_at_context_get_accessible(self:PGtkATContext):PGtkAccessible;cdecl;external libgtk4;
function gtk_at_context_get_accessible_role(self:PGtkATContext):TGtkAccessibleRole;cdecl;external libgtk4;
function gtk_at_context_create(accessible_role:TGtkAccessibleRole; accessible:PGtkAccessible; display:PGdkDisplay):PGtkATContext;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 19:15:58 ===

function GTK_TYPE_AT_CONTEXT: TGType;
function GTK_AT_CONTEXT(obj: Pointer): PGtkATContext;
function GTK_IS_AT_CONTEXT(obj: Pointer): Tgboolean;
function GTK_AT_CONTEXT_CLASS(klass: Pointer): PGtkATContextClass;
function GTK_IS_AT_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GTK_AT_CONTEXT_GET_CLASS(obj: Pointer): PGtkATContextClass;

implementation

function GTK_TYPE_AT_CONTEXT: TGType;
begin
  Result := gtk_at_context_get_type;
end;

function GTK_AT_CONTEXT(obj: Pointer): PGtkATContext;
begin
  Result := PGtkATContext(g_type_check_instance_cast(obj, GTK_TYPE_AT_CONTEXT));
end;

function GTK_IS_AT_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_AT_CONTEXT);
end;

function GTK_AT_CONTEXT_CLASS(klass: Pointer): PGtkATContextClass;
begin
  Result := PGtkATContextClass(g_type_check_class_cast(klass, GTK_TYPE_AT_CONTEXT));
end;

function GTK_IS_AT_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_AT_CONTEXT);
end;

function GTK_AT_CONTEXT_GET_CLASS(obj: Pointer): PGtkATContextClass;
begin
  Result := PGtkATContextClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGtkATContext = type Pointer;

  TGtkATContextClass = record
  end;
  PGtkATContextClass = ^TGtkATContextClass;

function gtk_at_context_get_type: TGType; cdecl; external libgxxxxxxx;



end.
