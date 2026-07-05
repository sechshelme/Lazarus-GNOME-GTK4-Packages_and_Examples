unit gtkaspectframe;

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
 * Modified by the GTK+ Team and others 1997-2001.  See the AUTHORS
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

function gtk_aspect_frame_get_type:TGType;cdecl;external libgtk4;
function gtk_aspect_frame_new(xalign:single; yalign:single; ratio:single; obey_child:Tgboolean):PGtkWidget;cdecl;external libgtk4;
procedure gtk_aspect_frame_set_xalign(self:PGtkAspectFrame; xalign:single);cdecl;external libgtk4;
function gtk_aspect_frame_get_xalign(self:PGtkAspectFrame):single;cdecl;external libgtk4;
procedure gtk_aspect_frame_set_yalign(self:PGtkAspectFrame; yalign:single);cdecl;external libgtk4;
function gtk_aspect_frame_get_yalign(self:PGtkAspectFrame):single;cdecl;external libgtk4;
procedure gtk_aspect_frame_set_ratio(self:PGtkAspectFrame; ratio:single);cdecl;external libgtk4;
function gtk_aspect_frame_get_ratio(self:PGtkAspectFrame):single;cdecl;external libgtk4;
procedure gtk_aspect_frame_set_obey_child(self:PGtkAspectFrame; obey_child:Tgboolean);cdecl;external libgtk4;
function gtk_aspect_frame_get_obey_child(self:PGtkAspectFrame):Tgboolean;cdecl;external libgtk4;
procedure gtk_aspect_frame_set_child(self:PGtkAspectFrame; child:PGtkWidget);cdecl;external libgtk4;
function gtk_aspect_frame_get_child(self:PGtkAspectFrame):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAspectFrame, g_object_unref) }

// === Konventiert am: 5-7-26 19:16:08 ===

function GTK_TYPE_ASPECT_FRAME : TGType;
function GTK_ASPECT_FRAME(obj : Pointer) : PGtkAspectFrame;
function GTK_IS_ASPECT_FRAME(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_ASPECT_FRAME : TGType;
  begin
    GTK_TYPE_ASPECT_FRAME:=gtk_aspect_frame_get_type;
  end;

function GTK_ASPECT_FRAME(obj : Pointer) : PGtkAspectFrame;
begin
  Result := PGtkAspectFrame(g_type_check_instance_cast(obj, GTK_TYPE_ASPECT_FRAME));
end;

function GTK_IS_ASPECT_FRAME(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ASPECT_FRAME);
end;



end.
