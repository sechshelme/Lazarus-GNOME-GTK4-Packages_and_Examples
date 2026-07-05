unit gtkadjustment;

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
{$include <gdk/gdk.h>}
{$include <gtk/gtktypes.h>}

type
  PGtkAdjustment = ^TGtkAdjustment;
  TGtkAdjustment = record
      parent_instance : TGInitiallyUnowned;
    end;

{ Padding for future expansion  }
  PGtkAdjustmentClass = ^TGtkAdjustmentClass;
  TGtkAdjustmentClass = record
      parent_class : TGInitiallyUnownedClass;
      changed : procedure (adjustment:PGtkAdjustment);cdecl;
      value_changed : procedure (adjustment:PGtkAdjustment);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_adjustment_get_type:TGType;cdecl;external libgtk4;
function gtk_adjustment_new(value:Tdouble; lower:Tdouble; upper:Tdouble; step_increment:Tdouble; page_increment:Tdouble; 
           page_size:Tdouble):PGtkAdjustment;cdecl;external libgtk4;
procedure gtk_adjustment_clamp_page(adjustment:PGtkAdjustment; lower:Tdouble; upper:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_value(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
procedure gtk_adjustment_set_value(adjustment:PGtkAdjustment; value:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_lower(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
procedure gtk_adjustment_set_lower(adjustment:PGtkAdjustment; lower:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_upper(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
procedure gtk_adjustment_set_upper(adjustment:PGtkAdjustment; upper:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_step_increment(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
procedure gtk_adjustment_set_step_increment(adjustment:PGtkAdjustment; step_increment:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_page_increment(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
procedure gtk_adjustment_set_page_increment(adjustment:PGtkAdjustment; page_increment:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_page_size(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
procedure gtk_adjustment_set_page_size(adjustment:PGtkAdjustment; page_size:Tdouble);cdecl;external libgtk4;
procedure gtk_adjustment_configure(adjustment:PGtkAdjustment; value:Tdouble; lower:Tdouble; upper:Tdouble; step_increment:Tdouble; 
            page_increment:Tdouble; page_size:Tdouble);cdecl;external libgtk4;
function gtk_adjustment_get_minimum_increment(adjustment:PGtkAdjustment):Tdouble;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAdjustment, g_object_unref) }

// === Konventiert am: 5-7-26 16:28:01 ===

function GTK_TYPE_ADJUSTMENT : TGType;
function GTK_ADJUSTMENT(obj : Pointer) : PGtkAdjustment;
function GTK_ADJUSTMENT_CLASS(klass : Pointer) : PGtkAdjustmentClass;
function GTK_IS_ADJUSTMENT(obj : Pointer) : Tgboolean;
function GTK_IS_ADJUSTMENT_CLASS(klass : Pointer) : Tgboolean;
function GTK_ADJUSTMENT_GET_CLASS(obj : Pointer) : PGtkAdjustmentClass;

implementation

function GTK_TYPE_ADJUSTMENT : TGType;
  begin
    GTK_TYPE_ADJUSTMENT:=gtk_adjustment_get_type;
  end;

function GTK_ADJUSTMENT(obj : Pointer) : PGtkAdjustment;
begin
  Result := PGtkAdjustment(g_type_check_instance_cast(obj, GTK_TYPE_ADJUSTMENT));
end;

function GTK_ADJUSTMENT_CLASS(klass : Pointer) : PGtkAdjustmentClass;
begin
  Result := PGtkAdjustmentClass(g_type_check_class_cast(klass, GTK_TYPE_ADJUSTMENT));
end;

function GTK_IS_ADJUSTMENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ADJUSTMENT);
end;

function GTK_IS_ADJUSTMENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_ADJUSTMENT);
end;

function GTK_ADJUSTMENT_GET_CLASS(obj : Pointer) : PGtkAdjustmentClass;
begin
  Result := PGtkAdjustmentClass(PGTypeInstance(obj)^.g_class);
end;



end.
