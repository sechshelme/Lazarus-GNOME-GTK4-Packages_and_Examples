
unit gtkmultifilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkmultifilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkmultifilter.h
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
PGtkAnyFilter  = ^GtkAnyFilter;
PGtkEveryFilter  = ^GtkEveryFilter;
PGtkFilter  = ^GtkFilter;
PGtkMultiFilter  = ^GtkMultiFilter;
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

{ was #define dname def_expr }
function GTK_TYPE_MULTI_FILTER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkMultiFilter, gtk_multi_filter, GTK, MULTI_FILTER, GtkFilter) }
procedure gtk_multi_filter_append(self:PGtkMultiFilter; filter:PGtkFilter);cdecl;external;
procedure gtk_multi_filter_remove(self:PGtkMultiFilter; position:Tguint);cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_ANY_FILTER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkAnyFilter, gtk_any_filter, GTK, ANY_FILTER, GtkMultiFilter) }
function gtk_any_filter_new:PGtkAnyFilter;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_EVERY_FILTER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GtkEveryFilter, gtk_every_filter, GTK, EVERY_FILTER, GtkMultiFilter) }
function gtk_every_filter_new:PGtkEveryFilter;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_MULTI_FILTER : longint; { return type might be wrong }
  begin
    GTK_TYPE_MULTI_FILTER:=gtk_multi_filter_get_type;
  end;

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
