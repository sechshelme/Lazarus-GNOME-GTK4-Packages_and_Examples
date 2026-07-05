unit gtkboolfilter;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkexpression.h>}
{$include <gtk/gtkfilter.h>}

{G_DECLARE_FINAL_TYPE (GtkBoolFilter, gtk_bool_filter, GTK, BOOL_FILTER, GtkFilter) }
function gtk_bool_filter_new(expression:PGtkExpression):PGtkBoolFilter;cdecl;external libgtk4;
function gtk_bool_filter_get_expression(self:PGtkBoolFilter):PGtkExpression;cdecl;external libgtk4;
procedure gtk_bool_filter_set_expression(self:PGtkBoolFilter; expression:PGtkExpression);cdecl;external libgtk4;
function gtk_bool_filter_get_invert(self:PGtkBoolFilter):Tgboolean;cdecl;external libgtk4;
procedure gtk_bool_filter_set_invert(self:PGtkBoolFilter; invert:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 5-7-26 19:15:37 ===

function GTK_TYPE_BOOL_FILTER: TGType;
function GTK_BOOL_FILTER(obj: Pointer): PGtkBoolFilter;
function GTK_IS_BOOL_FILTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_BOOL_FILTER: TGType;
begin
  Result := gtk_bool_filter_get_type;
end;

function GTK_BOOL_FILTER(obj: Pointer): PGtkBoolFilter;
begin
  Result := PGtkBoolFilter(g_type_check_instance_cast(obj, GTK_TYPE_BOOL_FILTER));
end;

function GTK_IS_BOOL_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BOOL_FILTER);
end;

type 
  PGtkBoolFilter = type Pointer;

  TGtkBoolFilterClass = record
    parent_class: TGtkFilterClass;
  end;
  PGtkBoolFilterClass = ^TGtkBoolFilterClass;

function gtk_bool_filter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
