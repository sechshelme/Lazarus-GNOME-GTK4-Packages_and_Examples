
unit gtkcellrenderertoggle;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcellrenderertoggle.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcellrenderertoggle.h
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
PGtkCellRenderer  = ^GtkCellRenderer;
PGtkCellRendererToggle  = ^GtkCellRendererToggle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrenderertoggle.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtkcellrenderer.h>}

{ was #define dname def_expr }
function GTK_TYPE_CELL_RENDERER_TOGGLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TOGGLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_RENDERER_TOGGLE(obj : longint) : longint;

type

function gtk_cell_renderer_toggle_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_new:PGtkCellRenderer;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_get_radio(toggle:PGtkCellRendererToggle):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_toggle_set_radio(toggle:PGtkCellRendererToggle; radio:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_get_active(toggle:PGtkCellRendererToggle):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_toggle_set_active(toggle:PGtkCellRendererToggle; setting:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_toggle_get_activatable(toggle:PGtkCellRendererToggle):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_toggle_set_activatable(toggle:PGtkCellRendererToggle; setting:Tgboolean);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererToggle, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_CELL_RENDERER_TOGGLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_CELL_RENDERER_TOGGLE:=gtk_cell_renderer_toggle_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TOGGLE(obj : longint) : longint;
begin
  GTK_CELL_RENDERER_TOGGLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_CELL_RENDERER_TOGGLE,GtkCellRendererToggle);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_RENDERER_TOGGLE(obj : longint) : longint;
begin
  GTK_IS_CELL_RENDERER_TOGGLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_CELL_RENDERER_TOGGLE);
end;


end.
