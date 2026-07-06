unit gtkstringfilter;

interface

uses
  fp_glib2, fp_gtk4;

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
{$include <gtk/gtkexpression.h>}
{$include <gtk/gtkfilter.h>}
{*
 * GtkStringFilterMatchMode:
 * @GTK_STRING_FILTER_MATCH_MODE_EXACT: The search string and
 *   text must match exactly
 * @GTK_STRING_FILTER_MATCH_MODE_SUBSTRING: The search string
 *   must be contained as a substring inside the text
 * @GTK_STRING_FILTER_MATCH_MODE_PREFIX: The text must begin
 *   with the search string
 *
 * Specifies how search strings are matched inside text.
  }
type
  PGtkStringFilterMatchMode = ^TGtkStringFilterMatchMode;
  TGtkStringFilterMatchMode =  Longint;
  Const
    GTK_STRING_FILTER_MATCH_MODE_EXACT = 0;
    GTK_STRING_FILTER_MATCH_MODE_SUBSTRING = 1;
    GTK_STRING_FILTER_MATCH_MODE_PREFIX = 2;
;

{G_DECLARE_FINAL_TYPE (GtkStringFilter, gtk_string_filter, GTK, STRING_FILTER, GtkFilter) }
function gtk_string_filter_new(expression:PGtkExpression):PGtkStringFilter;cdecl;external libgtk4;
function gtk_string_filter_get_search(self:PGtkStringFilter):Pchar;cdecl;external libgtk4;
procedure gtk_string_filter_set_search(self:PGtkStringFilter; search:Pchar);cdecl;external libgtk4;
function gtk_string_filter_get_expression(self:PGtkStringFilter):PGtkExpression;cdecl;external libgtk4;
procedure gtk_string_filter_set_expression(self:PGtkStringFilter; expression:PGtkExpression);cdecl;external libgtk4;
function gtk_string_filter_get_ignore_case(self:PGtkStringFilter):Tgboolean;cdecl;external libgtk4;
procedure gtk_string_filter_set_ignore_case(self:PGtkStringFilter; ignore_case:Tgboolean);cdecl;external libgtk4;
function gtk_string_filter_get_match_mode(self:PGtkStringFilter):TGtkStringFilterMatchMode;cdecl;external libgtk4;
procedure gtk_string_filter_set_match_mode(self:PGtkStringFilter; mode:TGtkStringFilterMatchMode);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:36:30 ===

function GTK_TYPE_STRING_FILTER: TGType;
function GTK_STRING_FILTER(obj: Pointer): PGtkStringFilter;
function GTK_IS_STRING_FILTER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_STRING_FILTER: TGType;
begin
  Result := gtk_string_filter_get_type;
end;

function GTK_STRING_FILTER(obj: Pointer): PGtkStringFilter;
begin
  Result := PGtkStringFilter(g_type_check_instance_cast(obj, GTK_TYPE_STRING_FILTER));
end;

function GTK_IS_STRING_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_FILTER);
end;

type 
  PGtkStringFilter = type Pointer;

  TGtkStringFilterClass = record
    parent_class: TGtkFilterClass;
  end;
  PGtkStringFilterClass = ^TGtkStringFilterClass;

function gtk_string_filter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
