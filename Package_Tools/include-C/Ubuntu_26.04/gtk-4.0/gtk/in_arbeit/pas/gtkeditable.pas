unit gtkeditable;

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
{$include <gtk/gtkaccessible.h>}
{$include <gtk/gtkwidget.h>}

type
{ Dummy typedef  }
{ signals  }
{ vtable  }
  PGtkEditableInterface = ^TGtkEditableInterface;
  TGtkEditableInterface = record
      base_iface : TGTypeInterface;
      insert_text : procedure (editable:PGtkEditable; text:Pchar; length:longint; position:Plongint);cdecl;
      delete_text : procedure (editable:PGtkEditable; start_pos:longint; end_pos:longint);cdecl;
      changed : procedure (editable:PGtkEditable);cdecl;
      get_text : function (editable:PGtkEditable):Pchar;cdecl;
      do_insert_text : procedure (editable:PGtkEditable; text:Pchar; length:longint; position:Plongint);cdecl;
      do_delete_text : procedure (editable:PGtkEditable; start_pos:longint; end_pos:longint);cdecl;
      get_selection_bounds : function (editable:PGtkEditable; start_pos:Plongint; end_pos:Plongint):Tgboolean;cdecl;
      set_selection_bounds : procedure (editable:PGtkEditable; start_pos:longint; end_pos:longint);cdecl;
      get_delegate : function (editable:PGtkEditable):PGtkEditable;cdecl;
    end;


function gtk_editable_get_type:TGType;cdecl;external libgtk4;
function gtk_editable_get_text(editable:PGtkEditable):Pchar;cdecl;external libgtk4;
procedure gtk_editable_set_text(editable:PGtkEditable; text:Pchar);cdecl;external libgtk4;
function gtk_editable_get_chars(editable:PGtkEditable; start_pos:longint; end_pos:longint):Pchar;cdecl;external libgtk4;
procedure gtk_editable_insert_text(editable:PGtkEditable; text:Pchar; length:longint; position:Plongint);cdecl;external libgtk4;
procedure gtk_editable_delete_text(editable:PGtkEditable; start_pos:longint; end_pos:longint);cdecl;external libgtk4;
function gtk_editable_get_selection_bounds(editable:PGtkEditable; start_pos:Plongint; end_pos:Plongint):Tgboolean;cdecl;external libgtk4;
procedure gtk_editable_delete_selection(editable:PGtkEditable);cdecl;external libgtk4;
procedure gtk_editable_select_region(editable:PGtkEditable; start_pos:longint; end_pos:longint);cdecl;external libgtk4;
procedure gtk_editable_set_position(editable:PGtkEditable; position:longint);cdecl;external libgtk4;
function gtk_editable_get_position(editable:PGtkEditable):longint;cdecl;external libgtk4;
function gtk_editable_get_editable(editable:PGtkEditable):Tgboolean;cdecl;external libgtk4;
procedure gtk_editable_set_editable(editable:PGtkEditable; is_editable:Tgboolean);cdecl;external libgtk4;
function gtk_editable_get_alignment(editable:PGtkEditable):single;cdecl;external libgtk4;
procedure gtk_editable_set_alignment(editable:PGtkEditable; xalign:single);cdecl;external libgtk4;
function gtk_editable_get_width_chars(editable:PGtkEditable):longint;cdecl;external libgtk4;
procedure gtk_editable_set_width_chars(editable:PGtkEditable; n_chars:longint);cdecl;external libgtk4;
function gtk_editable_get_max_width_chars(editable:PGtkEditable):longint;cdecl;external libgtk4;
procedure gtk_editable_set_max_width_chars(editable:PGtkEditable; n_chars:longint);cdecl;external libgtk4;
function gtk_editable_get_enable_undo(editable:PGtkEditable):Tgboolean;cdecl;external libgtk4;
procedure gtk_editable_set_enable_undo(editable:PGtkEditable; enable_undo:Tgboolean);cdecl;external libgtk4;
{ api for implementations  }
{*
 * GtkEditableProperties:
 * @GTK_EDITABLE_PROP_TEXT: the property id for [property@Gtk.Editable:text]
 * @GTK_EDITABLE_PROP_CURSOR_POSITION: the property id for [property@Gtk.Editable:cursor-position]
 * @GTK_EDITABLE_PROP_SELECTION_BOUND: the property id for [property@Gtk.Editable:selection-bound]
 * @GTK_EDITABLE_PROP_EDITABLE: the property id for [property@Gtk.Editable:editable]
 * @GTK_EDITABLE_PROP_WIDTH_CHARS: the property id for [property@Gtk.Editable:width-chars]
 * @GTK_EDITABLE_PROP_MAX_WIDTH_CHARS: the property id for [property@Gtk.Editable:max-width-chars]
 * @GTK_EDITABLE_PROP_XALIGN: the property id for [property@Gtk.Editable:xalign]
 * @GTK_EDITABLE_PROP_ENABLE_UNDO: the property id for [property@Gtk.Editable:enable-undo]
 * @GTK_EDITABLE_NUM_PROPERTIES: the number of properties
 *
 * The identifiers for [iface@Gtk.Editable] properties.
 *
 * See [func@Gtk.Editable.install_properties] for details on how to
 * implement the `GtkEditable` interface.
  }
type
  PGtkEditableProperties = ^TGtkEditableProperties;
  TGtkEditableProperties =  Longint;
  Const
    GTK_EDITABLE_PROP_TEXT = 0;
    GTK_EDITABLE_PROP_CURSOR_POSITION = 1;
    GTK_EDITABLE_PROP_SELECTION_BOUND = 2;
    GTK_EDITABLE_PROP_EDITABLE = 3;
    GTK_EDITABLE_PROP_WIDTH_CHARS = 4;
    GTK_EDITABLE_PROP_MAX_WIDTH_CHARS = 5;
    GTK_EDITABLE_PROP_XALIGN = 6;
    GTK_EDITABLE_PROP_ENABLE_UNDO = 7;
    GTK_EDITABLE_NUM_PROPERTIES = 8;
;

function gtk_editable_install_properties(object_class:PGObjectClass; first_prop:Tguint):Tguint;cdecl;external libgtk4;
function gtk_editable_get_delegate(editable:PGtkEditable):PGtkEditable;cdecl;external libgtk4;
procedure gtk_editable_init_delegate(editable:PGtkEditable);cdecl;external libgtk4;
procedure gtk_editable_finish_delegate(editable:PGtkEditable);cdecl;external libgtk4;
function gtk_editable_delegate_set_property(object:PGObject; prop_id:Tguint; value:PGValue; pspec:PGParamSpec):Tgboolean;cdecl;external libgtk4;
function gtk_editable_delegate_get_property(object:PGObject; prop_id:Tguint; value:PGValue; pspec:PGParamSpec):Tgboolean;cdecl;external libgtk4;
function gtk_editable_delegate_get_accessible_platform_state(editable:PGtkEditable; state:TGtkAccessiblePlatformState):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEditable, g_object_unref) }

// === Konventiert am: 6-7-26 16:09:15 ===

function GTK_TYPE_EDITABLE : TGType;
function GTK_EDITABLE(obj : Pointer) : PGtkEditable;
function GTK_IS_EDITABLE(obj : Pointer) : Tgboolean;
function GTK_EDITABLE_GET_IFACE(obj : Pointer) : PGtkEditableInterface;

implementation

function GTK_TYPE_EDITABLE : TGType;
  begin
    GTK_TYPE_EDITABLE:=gtk_editable_get_type;
  end;

function GTK_EDITABLE(obj : Pointer) : PGtkEditable;
begin
  Result := PGtkEditable(g_type_check_instance_cast(obj, GTK_TYPE_EDITABLE));
end;

function GTK_IS_EDITABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EDITABLE);
end;

function GTK_EDITABLE_GET_IFACE(obj : Pointer) : PGtkEditableInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_EDITABLE);
end;



end.
