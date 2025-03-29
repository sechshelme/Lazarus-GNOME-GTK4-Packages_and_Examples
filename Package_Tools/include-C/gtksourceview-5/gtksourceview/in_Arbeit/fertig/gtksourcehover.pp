
unit gtksourcehover;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcehover.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcehover.h
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
PGtkSourceHover  = ^GtkSourceHover;
PGtkSourceHoverProvider  = ^GtkSourceHoverProvider;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2021 Christian Hergert <chergert@redhat.com>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
{$include <glib-object.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_HOVER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkSourceHover, gtk_source_hover, GTK_SOURCE, HOVER, GObject) }
procedure gtk_source_hover_add_provider(self:PGtkSourceHover; provider:PGtkSourceHoverProvider);cdecl;external;
procedure gtk_source_hover_remove_provider(self:PGtkSourceHover; provider:PGtkSourceHoverProvider);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_HOVER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_HOVER:=gtk_source_hover_get_type;
  end;


end.
