unit gtkprogressbar;

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

function gtk_progress_bar_get_type:TGType;cdecl;external libgtk4;
function gtk_progress_bar_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_progress_bar_pulse(pbar:PGtkProgressBar);cdecl;external libgtk4;
procedure gtk_progress_bar_set_text(pbar:PGtkProgressBar; text:Pchar);cdecl;external libgtk4;
procedure gtk_progress_bar_set_fraction(pbar:PGtkProgressBar; fraction:Tdouble);cdecl;external libgtk4;
procedure gtk_progress_bar_set_pulse_step(pbar:PGtkProgressBar; fraction:Tdouble);cdecl;external libgtk4;
procedure gtk_progress_bar_set_inverted(pbar:PGtkProgressBar; inverted:Tgboolean);cdecl;external libgtk4;
function gtk_progress_bar_get_text(pbar:PGtkProgressBar):Pchar;cdecl;external libgtk4;
function gtk_progress_bar_get_fraction(pbar:PGtkProgressBar):Tdouble;cdecl;external libgtk4;
function gtk_progress_bar_get_pulse_step(pbar:PGtkProgressBar):Tdouble;cdecl;external libgtk4;
function gtk_progress_bar_get_inverted(pbar:PGtkProgressBar):Tgboolean;cdecl;external libgtk4;
procedure gtk_progress_bar_set_ellipsize(pbar:PGtkProgressBar; mode:TPangoEllipsizeMode);cdecl;external libgtk4;
function gtk_progress_bar_get_ellipsize(pbar:PGtkProgressBar):TPangoEllipsizeMode;cdecl;external libgtk4;
procedure gtk_progress_bar_set_show_text(pbar:PGtkProgressBar; show_text:Tgboolean);cdecl;external libgtk4;
function gtk_progress_bar_get_show_text(pbar:PGtkProgressBar):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkProgressBar, g_object_unref) }

// === Konventiert am: 6-7-26 16:33:11 ===

function GTK_TYPE_PROGRESS_BAR : TGType;
function GTK_PROGRESS_BAR(obj : Pointer) : PGtkProgressBar;
function GTK_IS_PROGRESS_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_PROGRESS_BAR : TGType;
  begin
    GTK_TYPE_PROGRESS_BAR:=gtk_progress_bar_get_type;
  end;

function GTK_PROGRESS_BAR(obj : Pointer) : PGtkProgressBar;
begin
  Result := PGtkProgressBar(g_type_check_instance_cast(obj, GTK_TYPE_PROGRESS_BAR));
end;

function GTK_IS_PROGRESS_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_PROGRESS_BAR);
end;



end.
