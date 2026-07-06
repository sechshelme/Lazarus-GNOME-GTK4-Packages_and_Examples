unit gtkcalendar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * GTK Calendar Widget
 * Copyright (C) 1998 Cesar Miquel and Shawn T. Amundson
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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

function gtk_calendar_get_type:TGType;cdecl;external libgtk4;
function gtk_calendar_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_20_FOR (gtk_calendar_set_date) }
procedure gtk_calendar_select_day(self:PGtkCalendar; date:PGDateTime);cdecl;external libgtk4;
procedure gtk_calendar_mark_day(calendar:PGtkCalendar; day:Tguint);cdecl;external libgtk4;
procedure gtk_calendar_unmark_day(calendar:PGtkCalendar; day:Tguint);cdecl;external libgtk4;
procedure gtk_calendar_clear_marks(calendar:PGtkCalendar);cdecl;external libgtk4;
procedure gtk_calendar_set_show_week_numbers(self:PGtkCalendar; value:Tgboolean);cdecl;external libgtk4;
function gtk_calendar_get_show_week_numbers(self:PGtkCalendar):Tgboolean;cdecl;external libgtk4;
procedure gtk_calendar_set_show_heading(self:PGtkCalendar; value:Tgboolean);cdecl;external libgtk4;
function gtk_calendar_get_show_heading(self:PGtkCalendar):Tgboolean;cdecl;external libgtk4;
procedure gtk_calendar_set_show_day_names(self:PGtkCalendar; value:Tgboolean);cdecl;external libgtk4;
function gtk_calendar_get_show_day_names(self:PGtkCalendar):Tgboolean;cdecl;external libgtk4;
procedure gtk_calendar_set_day(self:PGtkCalendar; day:longint);cdecl;external libgtk4;
function gtk_calendar_get_day(self:PGtkCalendar):longint;cdecl;external libgtk4;
procedure gtk_calendar_set_month(self:PGtkCalendar; month:longint);cdecl;external libgtk4;
function gtk_calendar_get_month(self:PGtkCalendar):longint;cdecl;external libgtk4;
procedure gtk_calendar_set_year(self:PGtkCalendar; year:longint);cdecl;external libgtk4;
function gtk_calendar_get_year(self:PGtkCalendar):longint;cdecl;external libgtk4;
procedure gtk_calendar_set_date(self:PGtkCalendar; date:PGDateTime);cdecl;external libgtk4;
function gtk_calendar_get_date(self:PGtkCalendar):PGDateTime;cdecl;external libgtk4;
function gtk_calendar_get_day_is_marked(calendar:PGtkCalendar; day:Tguint):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCalendar, g_object_unref) }

// === Konventiert am: 6-7-26 13:53:12 ===

function GTK_TYPE_CALENDAR : TGType;
function GTK_CALENDAR(obj : Pointer) : PGtkCalendar;
function GTK_IS_CALENDAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CALENDAR : TGType;
  begin
    GTK_TYPE_CALENDAR:=gtk_calendar_get_type;
  end;

function GTK_CALENDAR(obj : Pointer) : PGtkCalendar;
begin
  Result := PGtkCalendar(g_type_check_instance_cast(obj, GTK_TYPE_CALENDAR));
end;

function GTK_IS_CALENDAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CALENDAR);
end;



end.
