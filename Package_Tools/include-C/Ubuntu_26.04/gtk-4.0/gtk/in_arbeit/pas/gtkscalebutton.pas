unit gtkscalebutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2005 Ronald S. Bultje
 * Copyright (C) 2006, 2007 Christian Persch
 * Copyright (C) 2006 Jan Arne Petersen
 * Copyright (C) 2007 Red Hat, Inc.
 *
 * Authors:
 * - Ronald S. Bultje <rbultje@ronald.bitfreak.net>
 * - Bastien Nocera <bnocera@redhat.com>
 * - Jan Arne Petersen <jpetersen@jpetersen.org>
 * - Christian Persch <chpe@svn.gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 2007.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type
  PGtkScaleButton = ^TGtkScaleButton;
  TGtkScaleButton = record
      parent_instance : TGtkWidget;
    end;

{ signals  }
{< private > }
  PGtkScaleButtonClass = ^TGtkScaleButtonClass;
  TGtkScaleButtonClass = record
      parent_class : TGtkWidgetClass;
      value_changed : procedure (button:PGtkScaleButton; value:Tdouble);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_scale_button_get_type:TGType;cdecl;external libgtk4;
function gtk_scale_button_new(min:Tdouble; max:Tdouble; step:Tdouble; icons:PPchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_scale_button_set_icons(button:PGtkScaleButton; icons:PPchar);cdecl;external libgtk4;
function gtk_scale_button_get_value(button:PGtkScaleButton):Tdouble;cdecl;external libgtk4;
procedure gtk_scale_button_set_value(button:PGtkScaleButton; value:Tdouble);cdecl;external libgtk4;
function gtk_scale_button_get_adjustment(button:PGtkScaleButton):PGtkAdjustment;cdecl;external libgtk4;
procedure gtk_scale_button_set_adjustment(button:PGtkScaleButton; adjustment:PGtkAdjustment);cdecl;external libgtk4;
function gtk_scale_button_get_plus_button(button:PGtkScaleButton):PGtkWidget;cdecl;external libgtk4;
function gtk_scale_button_get_minus_button(button:PGtkScaleButton):PGtkWidget;cdecl;external libgtk4;
function gtk_scale_button_get_popup(button:PGtkScaleButton):PGtkWidget;cdecl;external libgtk4;
function gtk_scale_button_get_active(button:PGtkScaleButton):Tgboolean;cdecl;external libgtk4;
function gtk_scale_button_get_has_frame(button:PGtkScaleButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_scale_button_set_has_frame(button:PGtkScaleButton; has_frame:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkScaleButton, g_object_unref) }

// === Konventiert am: 6-7-26 16:28:40 ===

function GTK_TYPE_SCALE_BUTTON : TGType;
function GTK_SCALE_BUTTON(obj : Pointer) : PGtkScaleButton;
function GTK_SCALE_BUTTON_CLASS(klass : Pointer) : PGtkScaleButtonClass;
function GTK_IS_SCALE_BUTTON(obj : Pointer) : Tgboolean;
function GTK_IS_SCALE_BUTTON_CLASS(klass : Pointer) : Tgboolean;
function GTK_SCALE_BUTTON_GET_CLASS(obj : Pointer) : PGtkScaleButtonClass;

implementation

function GTK_TYPE_SCALE_BUTTON : TGType;
  begin
    GTK_TYPE_SCALE_BUTTON:=gtk_scale_button_get_type;
  end;

function GTK_SCALE_BUTTON(obj : Pointer) : PGtkScaleButton;
begin
  Result := PGtkScaleButton(g_type_check_instance_cast(obj, GTK_TYPE_SCALE_BUTTON));
end;

function GTK_SCALE_BUTTON_CLASS(klass : Pointer) : PGtkScaleButtonClass;
begin
  Result := PGtkScaleButtonClass(g_type_check_class_cast(klass, GTK_TYPE_SCALE_BUTTON));
end;

function GTK_IS_SCALE_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SCALE_BUTTON);
end;

function GTK_IS_SCALE_BUTTON_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_SCALE_BUTTON);
end;

function GTK_SCALE_BUTTON_GET_CLASS(obj : Pointer) : PGtkScaleButtonClass;
begin
  Result := PGtkScaleButtonClass(PGTypeInstance(obj)^.g_class);
end;



end.
