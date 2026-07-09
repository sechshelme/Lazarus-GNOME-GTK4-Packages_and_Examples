
unit gtkcellrenderertext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcellrenderertext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcellrenderertext.h
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
Pchar  = ^char;
PGtkCellRenderer  = ^GtkCellRenderer;
PGtkCellRendererText  = ^GtkCellRendererText;
PGtkCellRendererTextClass  = ^GtkCellRendererTextClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcellrenderertext.h
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
function GTK_TYPE_CELL_RENDERER_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_RENDERER_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_RENDERER_TEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TEXT_GET_CLASS(obj : longint) : longint;

type
  PGtkCellRendererText = ^TGtkCellRendererText;
  TGtkCellRendererText = record
      parent : TGtkCellRenderer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
  PGtkCellRendererTextClass = ^TGtkCellRendererTextClass;
  TGtkCellRendererTextClass = record
      parent_class : TGtkCellRendererClass;
      edited : procedure (cell_renderer_text:PGtkCellRendererText; path:Pchar; new_text:Pchar);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_cell_renderer_text_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_cell_renderer_text_new:PGtkCellRenderer;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_cell_renderer_text_set_fixed_height_from_font(renderer:PGtkCellRendererText; number_of_rows:longint);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCellRendererText, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_CELL_RENDERER_TEXT : longint; { return type might be wrong }
  begin
    GTK_TYPE_CELL_RENDERER_TEXT:=gtk_cell_renderer_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TEXT(obj : longint) : longint;
begin
  GTK_CELL_RENDERER_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_CELL_RENDERER_TEXT,GtkCellRendererText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TEXT_CLASS(klass : longint) : longint;
begin
  GTK_CELL_RENDERER_TEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_CELL_RENDERER_TEXT,GtkCellRendererTextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_RENDERER_TEXT(obj : longint) : longint;
begin
  GTK_IS_CELL_RENDERER_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_CELL_RENDERER_TEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CELL_RENDERER_TEXT_CLASS(klass : longint) : longint;
begin
  GTK_IS_CELL_RENDERER_TEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_CELL_RENDERER_TEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CELL_RENDERER_TEXT_GET_CLASS(obj : longint) : longint;
begin
  GTK_CELL_RENDERER_TEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_CELL_RENDERER_TEXT,GtkCellRendererTextClass);
end;


end.
