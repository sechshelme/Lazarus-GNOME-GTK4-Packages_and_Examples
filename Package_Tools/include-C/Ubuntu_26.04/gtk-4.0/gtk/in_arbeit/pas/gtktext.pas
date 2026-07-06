unit gtktext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * Copyright (C) 2004-2006 Christian Hammond
 * Copyright (C) 2008 Cody Russell
 * Copyright (C) 2008 Red Hat, Inc.
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
{$include <gtk/gtkeditable.h>}
{$include <gtk/gtkentrybuffer.h>}

type
{< private > }
  PGtkText = ^TGtkText;
  TGtkText = record
      parent_instance : TGtkWidget;
    end;


function gtk_text_get_type:TGType;cdecl;external libgtk4;
function gtk_text_new:PGtkWidget;cdecl;external libgtk4;
function gtk_text_new_with_buffer(buffer:PGtkEntryBuffer):PGtkWidget;cdecl;external libgtk4;
function gtk_text_get_buffer(self:PGtkText):PGtkEntryBuffer;cdecl;external libgtk4;
procedure gtk_text_set_buffer(self:PGtkText; buffer:PGtkEntryBuffer);cdecl;external libgtk4;
procedure gtk_text_set_visibility(self:PGtkText; visible:Tgboolean);cdecl;external libgtk4;
function gtk_text_get_visibility(self:PGtkText):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_set_invisible_char(self:PGtkText; ch:Tgunichar);cdecl;external libgtk4;
function gtk_text_get_invisible_char(self:PGtkText):Tgunichar;cdecl;external libgtk4;
procedure gtk_text_unset_invisible_char(self:PGtkText);cdecl;external libgtk4;
procedure gtk_text_set_overwrite_mode(self:PGtkText; overwrite:Tgboolean);cdecl;external libgtk4;
function gtk_text_get_overwrite_mode(self:PGtkText):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_set_max_length(self:PGtkText; length:longint);cdecl;external libgtk4;
function gtk_text_get_max_length(self:PGtkText):longint;cdecl;external libgtk4;
function gtk_text_get_text_length(self:PGtkText):Tguint16;cdecl;external libgtk4;
procedure gtk_text_set_activates_default(self:PGtkText; activates:Tgboolean);cdecl;external libgtk4;
function gtk_text_get_activates_default(self:PGtkText):Tgboolean;cdecl;external libgtk4;
function gtk_text_get_placeholder_text(self:PGtkText):Pchar;cdecl;external libgtk4;
procedure gtk_text_set_placeholder_text(self:PGtkText; text:Pchar);cdecl;external libgtk4;
procedure gtk_text_set_input_purpose(self:PGtkText; purpose:TGtkInputPurpose);cdecl;external libgtk4;
function gtk_text_get_input_purpose(self:PGtkText):TGtkInputPurpose;cdecl;external libgtk4;
procedure gtk_text_set_input_hints(self:PGtkText; hints:TGtkInputHints);cdecl;external libgtk4;
function gtk_text_get_input_hints(self:PGtkText):TGtkInputHints;cdecl;external libgtk4;
procedure gtk_text_set_attributes(self:PGtkText; attrs:PPangoAttrList);cdecl;external libgtk4;
function gtk_text_get_attributes(self:PGtkText):PPangoAttrList;cdecl;external libgtk4;
procedure gtk_text_set_tabs(self:PGtkText; tabs:PPangoTabArray);cdecl;external libgtk4;
function gtk_text_get_tabs(self:PGtkText):PPangoTabArray;cdecl;external libgtk4;
function gtk_text_grab_focus_without_selecting(self:PGtkText):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_set_extra_menu(self:PGtkText; model:PGMenuModel);cdecl;external libgtk4;
function gtk_text_get_extra_menu(self:PGtkText):PGMenuModel;cdecl;external libgtk4;
procedure gtk_text_set_enable_emoji_completion(self:PGtkText; enable_emoji_completion:Tgboolean);cdecl;external libgtk4;
function gtk_text_get_enable_emoji_completion(self:PGtkText):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_set_propagate_text_width(self:PGtkText; propagate_text_width:Tgboolean);cdecl;external libgtk4;
function gtk_text_get_propagate_text_width(self:PGtkText):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_set_truncate_multiline(self:PGtkText; truncate_multiline:Tgboolean);cdecl;external libgtk4;
function gtk_text_get_truncate_multiline(self:PGtkText):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_compute_cursor_extents(self:PGtkText; position:Tgsize; strong:Pgraphene_rect_t; weak:Pgraphene_rect_t);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:13:44 ===

function GTK_TYPE_TEXT : TGType;
function GTK_TEXT(obj : Pointer) : PGtkText;
function GTK_IS_TEXT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_TEXT : TGType;
  begin
    GTK_TYPE_TEXT:=gtk_text_get_type;
  end;

function GTK_TEXT(obj : Pointer) : PGtkText;
begin
  Result := PGtkText(g_type_check_instance_cast(obj, GTK_TYPE_TEXT));
end;

function GTK_IS_TEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TEXT);
end;



end.
