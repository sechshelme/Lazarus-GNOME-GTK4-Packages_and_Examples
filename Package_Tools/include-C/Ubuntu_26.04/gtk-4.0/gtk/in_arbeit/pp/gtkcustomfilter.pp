
unit gtkcustomfilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcustomfilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcustomfilter.h
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
PGtkCustomFilter  = ^GtkCustomFilter;
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
{*
 * GtkCustomFilterFunc:
 * @item: (type GObject): the item to be matched
 * @user_data: user data
 *
 * User function that is called to determine if the @item should be matched.
 *
 * If the filter matches the item, this function must return true.
 * If the item should be filtered out, false must be returned.
 *
 * Returns: true to keep the item around
  }
type

  TGtkCustomFilterFunc = function (item:Tgpointer; user_data:Tgpointer):Tgboolean;cdecl;

{ was #define dname def_expr }
function GTK_TYPE_CUSTOM_FILTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkCustomFilter, gtk_custom_filter, GTK, CUSTOM_FILTER, GtkFilter) }
function gtk_custom_filter_new(match_func:TGtkCustomFilterFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify):PGtkCustomFilter;cdecl;external;
procedure gtk_custom_filter_set_filter_func(self:PGtkCustomFilter; match_func:TGtkCustomFilterFunc; user_data:Tgpointer; user_destroy:TGDestroyNotify);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_CUSTOM_FILTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_CUSTOM_FILTER:=gtk_custom_filter_get_type;
  end;


end.
