unit gtkscale;

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
{$include <gtk/gtkrange.h>}

type
  PGtkScale = ^TGtkScale;
  TGtkScale = record
      parent_instance : TGtkRange;
    end;

{< private > }
  PGtkScaleClass = ^TGtkScaleClass;
  TGtkScaleClass = record
      parent_class : TGtkRangeClass;
      get_layout_offsets : procedure (scale:PGtkScale; x:Plongint; y:Plongint);cdecl;
      padding : array[0..7] of Tgpointer;
    end;

{*
 * GtkScaleFormatValueFunc:
 * @scale: The `GtkScale`
 * @value: The numeric value to format
 * @user_data: (closure): user data
 *
 * Function that formats the value of a scale.
 *
 * See [method@Gtk.Scale.set_format_value_func].
 *
 * Returns: (not nullable): A newly allocated string describing a textual representation
 *   of the given numerical value.
  }

  PGtkScaleFormatValueFunc = ^TGtkScaleFormatValueFunc;
  TGtkScaleFormatValueFunc = function (scale:PGtkScale; value:Tdouble; user_data:Tgpointer):Pchar;cdecl;

function gtk_scale_get_type:TGType;cdecl;external libgtk4;
function gtk_scale_new(orientation:TGtkOrientation; adjustment:PGtkAdjustment):PGtkWidget;cdecl;external libgtk4;
function gtk_scale_new_with_range(orientation:TGtkOrientation; min:Tdouble; max:Tdouble; step:Tdouble):PGtkWidget;cdecl;external libgtk4;
procedure gtk_scale_set_digits(scale:PGtkScale; digits:longint);cdecl;external libgtk4;
function gtk_scale_get_digits(scale:PGtkScale):longint;cdecl;external libgtk4;
procedure gtk_scale_set_draw_value(scale:PGtkScale; draw_value:Tgboolean);cdecl;external libgtk4;
function gtk_scale_get_draw_value(scale:PGtkScale):Tgboolean;cdecl;external libgtk4;
procedure gtk_scale_set_has_origin(scale:PGtkScale; has_origin:Tgboolean);cdecl;external libgtk4;
function gtk_scale_get_has_origin(scale:PGtkScale):Tgboolean;cdecl;external libgtk4;
procedure gtk_scale_set_value_pos(scale:PGtkScale; pos:TGtkPositionType);cdecl;external libgtk4;
function gtk_scale_get_value_pos(scale:PGtkScale):TGtkPositionType;cdecl;external libgtk4;
function gtk_scale_get_layout(scale:PGtkScale):PPangoLayout;cdecl;external libgtk4;
procedure gtk_scale_get_layout_offsets(scale:PGtkScale; x:Plongint; y:Plongint);cdecl;external libgtk4;
procedure gtk_scale_add_mark(scale:PGtkScale; value:Tdouble; position:TGtkPositionType; markup:Pchar);cdecl;external libgtk4;
procedure gtk_scale_clear_marks(scale:PGtkScale);cdecl;external libgtk4;
procedure gtk_scale_set_format_value_func(scale:PGtkScale; func:TGtkScaleFormatValueFunc; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkScale, g_object_unref) }

// === Konventiert am: 6-7-26 16:20:29 ===

function GTK_TYPE_SCALE : TGType;
function GTK_SCALE(obj : Pointer) : PGtkScale;
function GTK_SCALE_CLASS(klass : Pointer) : PGtkScaleClass;
function GTK_IS_SCALE(obj : Pointer) : Tgboolean;
function GTK_IS_SCALE_CLASS(klass : Pointer) : Tgboolean;
function GTK_SCALE_GET_CLASS(obj : Pointer) : PGtkScaleClass;

implementation

function GTK_TYPE_SCALE : TGType;
  begin
    GTK_TYPE_SCALE:=gtk_scale_get_type;
  end;

function GTK_SCALE(obj : Pointer) : PGtkScale;
begin
  Result := PGtkScale(g_type_check_instance_cast(obj, GTK_TYPE_SCALE));
end;

function GTK_SCALE_CLASS(klass : Pointer) : PGtkScaleClass;
begin
  Result := PGtkScaleClass(g_type_check_class_cast(klass, GTK_TYPE_SCALE));
end;

function GTK_IS_SCALE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SCALE);
end;

function GTK_IS_SCALE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_SCALE);
end;

function GTK_SCALE_GET_CLASS(obj : Pointer) : PGtkScaleClass;
begin
  Result := PGtkScaleClass(PGTypeInstance(obj)^.g_class);
end;



end.
