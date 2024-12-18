unit gtkmultifilter;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
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
{$include <gtk/gtkfilter.h>}
{$include <gtk/gtktypes.h>}

{GDK_DECLARE_INTERNAL_TYPE (GtkMultiFilter, gtk_multi_filter, GTK, MULTI_FILTER, GtkFilter) }
procedure gtk_multi_filter_append(self:PGtkMultiFilter; filter:PGtkFilter);cdecl;external libges;
procedure gtk_multi_filter_remove(self:PGtkMultiFilter; position:Tguint);cdecl;external libges;
{ was #define dname def_expr }
function GTK_TYPE_ANY_FILTER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkAnyFilter, gtk_any_filter, GTK, ANY_FILTER, GtkMultiFilter) }
function gtk_any_filter_new:PGtkAnyFilter;cdecl;external libges;
{ was #define dname def_expr }
function GTK_TYPE_EVERY_FILTER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkEveryFilter, gtk_every_filter, GTK, EVERY_FILTER, GtkMultiFilter) }
function gtk_every_filter_new:PGtkEveryFilter;cdecl;external libges;

// === Konventiert am: 18-12-24 17:12:55 ===

function GTK_TYPE_MULTI_FILTER: TGType;
function GTK_MULTI_FILTER(obj: Pointer): PGtkMultiFilter;
function GTK_IS_MULTI_FILTER(obj: Pointer): Tgboolean;
function gtk_multi_filter_MULTI_FILTER_CLASS(klass: Pointer): PGtkMultiFilterClass;
function GTK_IS_MULTI_FILTER_CLASS(klass: Pointer): Tgboolean;
function GTK_MULTI_FILTER_GET_CLASS(obj: Pointer): PGtkMultiFilterClass;

implementation

function GTK_TYPE_MULTI_FILTER: TGType;
begin
  Result := gtk_multi_filter_get_type;
end;

function GTK_MULTI_FILTER(obj: Pointer): PGtkMultiFilter;
begin
  Result := PGtkMultiFilter(g_type_check_instance_cast(obj, GTK_TYPE_MULTI_FILTER));
end;

function GTK_IS_MULTI_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MULTI_FILTER);
end;

function gtk_multi_filter_MULTI_FILTER_CLASS(klass: Pointer): PGtkMultiFilterClass;
begin
  Result := PGtkMultiFilterClass(g_type_check_class_cast(klass, GTK_TYPE_MULTI_FILTER));
end;

function GTK_IS_MULTI_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MULTI_FILTER);
end;

function GTK_MULTI_FILTER_GET_CLASS(obj: Pointer): PGtkMultiFilterClass;
begin
  Result := PGtkMultiFilterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGtkMultiFilter = record
  end;
  PGtkMultiFilter = ^TGtkMultiFilter;

  TGtkMultiFilterClass = record
  end;
  PGtkMultiFilterClass = ^TGtkMultiFilterClass;

function gtk_multi_filter_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_ANY_FILTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_ANY_FILTER:=gtk_any_filter_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_EVERY_FILTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_EVERY_FILTER:=gtk_every_filter_get_type;
  end;


end.
