unit gtklabel;

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

function gtk_label_get_type:TGType;cdecl;external libgtk4;
function gtk_label_new(str:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_label_new_with_mnemonic(str:Pchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_label_set_text(self:PGtkLabel; str:Pchar);cdecl;external libgtk4;
function gtk_label_get_text(self:PGtkLabel):Pchar;cdecl;external libgtk4;
procedure gtk_label_set_attributes(self:PGtkLabel; attrs:PPangoAttrList);cdecl;external libgtk4;
function gtk_label_get_attributes(self:PGtkLabel):PPangoAttrList;cdecl;external libgtk4;
procedure gtk_label_set_label(self:PGtkLabel; str:Pchar);cdecl;external libgtk4;
function gtk_label_get_label(self:PGtkLabel):Pchar;cdecl;external libgtk4;
procedure gtk_label_set_markup(self:PGtkLabel; str:Pchar);cdecl;external libgtk4;
procedure gtk_label_set_use_markup(self:PGtkLabel; setting:Tgboolean);cdecl;external libgtk4;
function gtk_label_get_use_markup(self:PGtkLabel):Tgboolean;cdecl;external libgtk4;
procedure gtk_label_set_use_underline(self:PGtkLabel; setting:Tgboolean);cdecl;external libgtk4;
function gtk_label_get_use_underline(self:PGtkLabel):Tgboolean;cdecl;external libgtk4;
procedure gtk_label_set_markup_with_mnemonic(self:PGtkLabel; str:Pchar);cdecl;external libgtk4;
function gtk_label_get_mnemonic_keyval(self:PGtkLabel):Tguint;cdecl;external libgtk4;
procedure gtk_label_set_mnemonic_widget(self:PGtkLabel; widget:PGtkWidget);cdecl;external libgtk4;
function gtk_label_get_mnemonic_widget(self:PGtkLabel):PGtkWidget;cdecl;external libgtk4;
procedure gtk_label_set_text_with_mnemonic(self:PGtkLabel; str:Pchar);cdecl;external libgtk4;
procedure gtk_label_set_justify(self:PGtkLabel; jtype:TGtkJustification);cdecl;external libgtk4;
function gtk_label_get_justify(self:PGtkLabel):TGtkJustification;cdecl;external libgtk4;
procedure gtk_label_set_ellipsize(self:PGtkLabel; mode:TPangoEllipsizeMode);cdecl;external libgtk4;
function gtk_label_get_ellipsize(self:PGtkLabel):TPangoEllipsizeMode;cdecl;external libgtk4;
procedure gtk_label_set_width_chars(self:PGtkLabel; n_chars:longint);cdecl;external libgtk4;
function gtk_label_get_width_chars(self:PGtkLabel):longint;cdecl;external libgtk4;
procedure gtk_label_set_max_width_chars(self:PGtkLabel; n_chars:longint);cdecl;external libgtk4;
function gtk_label_get_max_width_chars(self:PGtkLabel):longint;cdecl;external libgtk4;
procedure gtk_label_set_lines(self:PGtkLabel; lines:longint);cdecl;external libgtk4;
function gtk_label_get_lines(self:PGtkLabel):longint;cdecl;external libgtk4;
procedure gtk_label_set_wrap(self:PGtkLabel; wrap:Tgboolean);cdecl;external libgtk4;
function gtk_label_get_wrap(self:PGtkLabel):Tgboolean;cdecl;external libgtk4;
procedure gtk_label_set_wrap_mode(self:PGtkLabel; wrap_mode:TPangoWrapMode);cdecl;external libgtk4;
function gtk_label_get_wrap_mode(self:PGtkLabel):TPangoWrapMode;cdecl;external libgtk4;
procedure gtk_label_set_natural_wrap_mode(self:PGtkLabel; wrap_mode:TGtkNaturalWrapMode);cdecl;external libgtk4;
function gtk_label_get_natural_wrap_mode(self:PGtkLabel):TGtkNaturalWrapMode;cdecl;external libgtk4;
procedure gtk_label_set_selectable(self:PGtkLabel; setting:Tgboolean);cdecl;external libgtk4;
function gtk_label_get_selectable(self:PGtkLabel):Tgboolean;cdecl;external libgtk4;
procedure gtk_label_select_region(self:PGtkLabel; start_offset:longint; end_offset:longint);cdecl;external libgtk4;
function gtk_label_get_selection_bounds(self:PGtkLabel; start:Plongint; end:Plongint):Tgboolean;cdecl;external libgtk4;
function gtk_label_get_layout(self:PGtkLabel):PPangoLayout;cdecl;external libgtk4;
procedure gtk_label_get_layout_offsets(self:PGtkLabel; x:Plongint; y:Plongint);cdecl;external libgtk4;
procedure gtk_label_set_single_line_mode(self:PGtkLabel; single_line_mode:Tgboolean);cdecl;external libgtk4;
function gtk_label_get_single_line_mode(self:PGtkLabel):Tgboolean;cdecl;external libgtk4;
function gtk_label_get_current_uri(self:PGtkLabel):Pchar;cdecl;external libgtk4;
procedure gtk_label_set_xalign(self:PGtkLabel; xalign:single);cdecl;external libgtk4;
function gtk_label_get_xalign(self:PGtkLabel):single;cdecl;external libgtk4;
procedure gtk_label_set_yalign(self:PGtkLabel; yalign:single);cdecl;external libgtk4;
function gtk_label_get_yalign(self:PGtkLabel):single;cdecl;external libgtk4;
procedure gtk_label_set_extra_menu(self:PGtkLabel; model:PGMenuModel);cdecl;external libgtk4;
function gtk_label_get_extra_menu(self:PGtkLabel):PGMenuModel;cdecl;external libgtk4;
procedure gtk_label_set_tabs(self:PGtkLabel; tabs:PPangoTabArray);cdecl;external libgtk4;
function gtk_label_get_tabs(self:PGtkLabel):PPangoTabArray;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkLabel, g_object_unref) }

// === Konventiert am: 6-7-26 16:14:42 ===

function GTK_TYPE_LABEL : TGType;
function GTK_LABEL(obj : Pointer) : PGtkLabel;
function GTK_IS_LABEL(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_LABEL : TGType;
  begin
    GTK_TYPE_LABEL:=gtk_label_get_type;
  end;

function GTK_LABEL(obj : Pointer) : PGtkLabel;
begin
  Result := PGtkLabel(g_type_check_instance_cast(obj, GTK_TYPE_LABEL));
end;

function GTK_IS_LABEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_LABEL);
end;



end.
