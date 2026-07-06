unit gtkdrawingarea;

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
{*
 * GtkDrawingAreaDrawFunc:
 * @drawing_area: the `GtkDrawingArea` to redraw
 * @cr: the context to draw to
 * @width: the actual width of the contents. This value will be at least
 *   as wide as GtkDrawingArea:width.
 * @height: the actual height of the contents. This value will be at least
 *   as wide as GtkDrawingArea:height.
 * @user_data: (closure): user data
 *
 * Whenever @drawing_area needs to redraw, this function will be called.
 *
 * This function should exclusively redraw the contents of the drawing area
 * and must not call any widget functions that cause changes.
  }

  TGtkDrawingAreaDrawFunc = procedure (drawing_area:PGtkDrawingArea; cr:Pcairo_t; width:longint; height:longint; user_data:Tgpointer);cdecl;
  PGtkDrawingArea = ^TGtkDrawingArea;
  TGtkDrawingArea = record
      widget : TGtkWidget;cdecl;
    end;

{< private > }
  PGtkDrawingAreaClass = ^TGtkDrawingAreaClass;
  TGtkDrawingAreaClass = record
      parent_class : TGtkWidgetClass;
      resize : procedure (area:PGtkDrawingArea; width:longint; height:longint);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_drawing_area_get_type:TGType;cdecl;external libgtk4;
function gtk_drawing_area_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_drawing_area_set_content_width(self:PGtkDrawingArea; width:longint);cdecl;external libgtk4;
function gtk_drawing_area_get_content_width(self:PGtkDrawingArea):longint;cdecl;external libgtk4;
procedure gtk_drawing_area_set_content_height(self:PGtkDrawingArea; height:longint);cdecl;external libgtk4;
function gtk_drawing_area_get_content_height(self:PGtkDrawingArea):longint;cdecl;external libgtk4;
procedure gtk_drawing_area_set_draw_func(self:PGtkDrawingArea; draw_func:TGtkDrawingAreaDrawFunc; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkDrawingArea, g_object_unref) }

// === Konventiert am: 6-7-26 16:25:30 ===

function GTK_TYPE_DRAWING_AREA : TGType;
function GTK_DRAWING_AREA(obj : Pointer) : PGtkDrawingArea;
function GTK_DRAWING_AREA_CLASS(klass : Pointer) : PGtkDrawingAreaClass;
function GTK_IS_DRAWING_AREA(obj : Pointer) : Tgboolean;
function GTK_IS_DRAWING_AREA_CLASS(klass : Pointer) : Tgboolean;
function GTK_DRAWING_AREA_GET_CLASS(obj : Pointer) : PGtkDrawingAreaClass;

implementation

function GTK_TYPE_DRAWING_AREA : TGType;
  begin
    GTK_TYPE_DRAWING_AREA:=gtk_drawing_area_get_type;
  end;

function GTK_DRAWING_AREA(obj : Pointer) : PGtkDrawingArea;
begin
  Result := PGtkDrawingArea(g_type_check_instance_cast(obj, GTK_TYPE_DRAWING_AREA));
end;

function GTK_DRAWING_AREA_CLASS(klass : Pointer) : PGtkDrawingAreaClass;
begin
  Result := PGtkDrawingAreaClass(g_type_check_class_cast(klass, GTK_TYPE_DRAWING_AREA));
end;

function GTK_IS_DRAWING_AREA(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_DRAWING_AREA);
end;

function GTK_IS_DRAWING_AREA_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_DRAWING_AREA);
end;

function GTK_DRAWING_AREA_GET_CLASS(obj : Pointer) : PGtkDrawingAreaClass;
begin
  Result := PGtkDrawingAreaClass(PGTypeInstance(obj)^.g_class);
end;



end.
