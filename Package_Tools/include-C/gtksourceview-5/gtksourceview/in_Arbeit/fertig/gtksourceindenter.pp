
unit gtksourceindenter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourceindenter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourceindenter.h
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
PGtkSourceIndenter  = ^GtkSourceIndenter;
PGtkSourceIndenterInterface  = ^GtkSourceIndenterInterface;
PGtkSourceView  = ^GtkSourceView;
PGtkTextIter  = ^GtkTextIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2015-2021 Christian Hergert <chergert@redhat.com>
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
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_INDENTER : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkSourceIndenter, gtk_source_indenter, GTK_SOURCE, INDENTER, GObject) }
(* Const before type ignored *)
type
  PGtkSourceIndenterInterface = ^TGtkSourceIndenterInterface;
  TGtkSourceIndenterInterface = record
      parent_iface : TGTypeInterface;
      is_trigger : function (self:PGtkSourceIndenter; view:PGtkSourceView; location:PGtkTextIter; state:TGdkModifierType; keyval:Tguint):Tgboolean;cdecl;
      indent : procedure (self:PGtkSourceIndenter; view:PGtkSourceView; iter:PGtkTextIter);cdecl;
    end;

(* Const before type ignored *)

function gtk_source_indenter_is_trigger(self:PGtkSourceIndenter; view:PGtkSourceView; location:PGtkTextIter; state:TGdkModifierType; keyval:Tguint):Tgboolean;cdecl;external;
procedure gtk_source_indenter_indent(self:PGtkSourceIndenter; view:PGtkSourceView; iter:PGtkTextIter);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_INDENTER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_INDENTER:=gtk_source_indenter_get_type;
  end;


end.
