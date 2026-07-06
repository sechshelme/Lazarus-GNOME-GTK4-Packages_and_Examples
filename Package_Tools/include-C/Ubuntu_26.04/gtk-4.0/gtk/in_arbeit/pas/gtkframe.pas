unit gtkframe;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
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
  PGtkFrame = ^TGtkFrame;
  TGtkFrame = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkFrameClass:
 * @parent_class: The parent class.
 * @compute_child_allocation:
  }
{< public > }
{< private > }
  PGtkFrameClass = ^TGtkFrameClass;
  TGtkFrameClass = record
      parent_class : TGtkWidgetClass;
      compute_child_allocation : procedure (frame:PGtkFrame; allocation:PGtkAllocation);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_frame_get_type:TGType;cdecl;external libgtk4;
function gtk_frame_new(_label:Pchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_frame_set_label(frame:PGtkFrame; _label:Pchar);cdecl;external libgtk4;
function gtk_frame_get_label(frame:PGtkFrame):Pchar;cdecl;external libgtk4;
procedure gtk_frame_set_label_widget(frame:PGtkFrame; label_widget:PGtkWidget);cdecl;external libgtk4;
function gtk_frame_get_label_widget(frame:PGtkFrame):PGtkWidget;cdecl;external libgtk4;
procedure gtk_frame_set_label_align(frame:PGtkFrame; xalign:single);cdecl;external libgtk4;
function gtk_frame_get_label_align(frame:PGtkFrame):single;cdecl;external libgtk4;
procedure gtk_frame_set_child(frame:PGtkFrame; child:PGtkWidget);cdecl;external libgtk4;
function gtk_frame_get_child(frame:PGtkFrame):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFrame, g_object_unref) }

// === Konventiert am: 6-7-26 16:33:19 ===

function GTK_TYPE_FRAME : TGType;
function GTK_FRAME(obj : Pointer) : PGtkFrame;
function GTK_FRAME_CLASS(klass : Pointer) : PGtkFrameClass;
function GTK_IS_FRAME(obj : Pointer) : Tgboolean;
function GTK_IS_FRAME_CLASS(klass : Pointer) : Tgboolean;
function GTK_FRAME_GET_CLASS(obj : Pointer) : PGtkFrameClass;

implementation

function GTK_TYPE_FRAME : TGType;
  begin
    GTK_TYPE_FRAME:=gtk_frame_get_type;
  end;

function GTK_FRAME(obj : Pointer) : PGtkFrame;
begin
  Result := PGtkFrame(g_type_check_instance_cast(obj, GTK_TYPE_FRAME));
end;

function GTK_FRAME_CLASS(klass : Pointer) : PGtkFrameClass;
begin
  Result := PGtkFrameClass(g_type_check_class_cast(klass, GTK_TYPE_FRAME));
end;

function GTK_IS_FRAME(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_FRAME);
end;

function GTK_IS_FRAME_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_FRAME);
end;

function GTK_FRAME_GET_CLASS(obj : Pointer) : PGtkFrameClass;
begin
  Result := PGtkFrameClass(PGTypeInstance(obj)^.g_class);
end;



end.
