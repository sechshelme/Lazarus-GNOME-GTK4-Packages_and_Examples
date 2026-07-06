unit gtkentry;

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
{$include <gtk/gtkimcontext.h>}
{$include <gtk/gtkentrybuffer.h>}
{$include <gtk/deprecated/gtkentrycompletion.h>}
{$include <gtk/gtkimage.h>}

{*
 * GtkEntryIconPosition:
 * @GTK_ENTRY_ICON_PRIMARY: At the beginning of the entry (depending on the text direction).
 * @GTK_ENTRY_ICON_SECONDARY: At the end of the entry (depending on the text direction).
 *
 * Specifies the side of the entry at which an icon is placed.
  }
type
  PGtkEntryIconPosition = ^TGtkEntryIconPosition;
  TGtkEntryIconPosition =  Longint;
  Const
    GTK_ENTRY_ICON_PRIMARY = 0;
    GTK_ENTRY_ICON_SECONDARY = 1;
;
type
{< private > }
  PGtkEntry = ^TGtkEntry;
  TGtkEntry = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkEntryClass:
 * @parent_class: The parent class.
 * @activate: Class handler for the `GtkEntry::activate` signal. The default
 *   implementation activates the gtk.activate-default action.
 *
 * Class structure for `GtkEntry`. All virtual functions have a default
 * implementation. Derived classes may set the virtual function pointers for the
 * signal handlers to %NULL, but must keep @get_text_area_size and
 * @get_frame_size non-%NULL; either use the default implementation, or provide
 * a custom one.
  }
{ Action signals
    }
{< private > }
  PGtkEntryClass = ^TGtkEntryClass;
  TGtkEntryClass = record
      parent_class : TGtkWidgetClass;
      activate : procedure (entry:PGtkEntry);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_entry_get_type:TGType;cdecl;external libgtk4;
function gtk_entry_new:PGtkWidget;cdecl;external libgtk4;
function gtk_entry_new_with_buffer(buffer:PGtkEntryBuffer):PGtkWidget;cdecl;external libgtk4;
function gtk_entry_get_buffer(entry:PGtkEntry):PGtkEntryBuffer;cdecl;external libgtk4;
procedure gtk_entry_set_buffer(entry:PGtkEntry; buffer:PGtkEntryBuffer);cdecl;external libgtk4;
procedure gtk_entry_set_visibility(entry:PGtkEntry; visible:Tgboolean);cdecl;external libgtk4;
function gtk_entry_get_visibility(entry:PGtkEntry):Tgboolean;cdecl;external libgtk4;
procedure gtk_entry_set_invisible_char(entry:PGtkEntry; ch:Tgunichar);cdecl;external libgtk4;
function gtk_entry_get_invisible_char(entry:PGtkEntry):Tgunichar;cdecl;external libgtk4;
procedure gtk_entry_unset_invisible_char(entry:PGtkEntry);cdecl;external libgtk4;
procedure gtk_entry_set_has_frame(entry:PGtkEntry; setting:Tgboolean);cdecl;external libgtk4;
function gtk_entry_get_has_frame(entry:PGtkEntry):Tgboolean;cdecl;external libgtk4;
procedure gtk_entry_set_overwrite_mode(entry:PGtkEntry; overwrite:Tgboolean);cdecl;external libgtk4;
function gtk_entry_get_overwrite_mode(entry:PGtkEntry):Tgboolean;cdecl;external libgtk4;
{ text is truncated if needed  }
procedure gtk_entry_set_max_length(entry:PGtkEntry; max:longint);cdecl;external libgtk4;
function gtk_entry_get_max_length(entry:PGtkEntry):longint;cdecl;external libgtk4;
function gtk_entry_get_text_length(entry:PGtkEntry):Tguint16;cdecl;external libgtk4;
procedure gtk_entry_set_activates_default(entry:PGtkEntry; setting:Tgboolean);cdecl;external libgtk4;
function gtk_entry_get_activates_default(entry:PGtkEntry):Tgboolean;cdecl;external libgtk4;
procedure gtk_entry_set_alignment(entry:PGtkEntry; xalign:single);cdecl;external libgtk4;
function gtk_entry_get_alignment(entry:PGtkEntry):single;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_set_completion(entry:PGtkEntry; completion:PGtkEntryCompletion);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_get_completion(entry:PGtkEntry):PGtkEntryCompletion;cdecl;external libgtk4;
{ Progress API
  }
procedure gtk_entry_set_progress_fraction(entry:PGtkEntry; fraction:Tdouble);cdecl;external libgtk4;
function gtk_entry_get_progress_fraction(entry:PGtkEntry):Tdouble;cdecl;external libgtk4;
procedure gtk_entry_set_progress_pulse_step(entry:PGtkEntry; fraction:Tdouble);cdecl;external libgtk4;
function gtk_entry_get_progress_pulse_step(entry:PGtkEntry):Tdouble;cdecl;external libgtk4;
procedure gtk_entry_progress_pulse(entry:PGtkEntry);cdecl;external libgtk4;
function gtk_entry_get_placeholder_text(entry:PGtkEntry):Pchar;cdecl;external libgtk4;
procedure gtk_entry_set_placeholder_text(entry:PGtkEntry; text:Pchar);cdecl;external libgtk4;
{ Setting and managing icons
  }
procedure gtk_entry_set_icon_from_paintable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; paintable:PGdkPaintable);cdecl;external libgtk4;
procedure gtk_entry_set_icon_from_icon_name(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; icon_name:Pchar);cdecl;external libgtk4;
procedure gtk_entry_set_icon_from_gicon(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; icon:PGIcon);cdecl;external libgtk4;
function gtk_entry_get_icon_storage_type(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):TGtkImageType;cdecl;external libgtk4;
function gtk_entry_get_icon_paintable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):PGdkPaintable;cdecl;external libgtk4;
function gtk_entry_get_icon_name(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pchar;cdecl;external libgtk4;
function gtk_entry_get_icon_gicon(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):PGIcon;cdecl;external libgtk4;
procedure gtk_entry_set_icon_activatable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; activatable:Tgboolean);cdecl;external libgtk4;
function gtk_entry_get_icon_activatable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Tgboolean;cdecl;external libgtk4;
procedure gtk_entry_set_icon_sensitive(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; sensitive:Tgboolean);cdecl;external libgtk4;
function gtk_entry_get_icon_sensitive(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Tgboolean;cdecl;external libgtk4;
function gtk_entry_get_icon_at_pos(entry:PGtkEntry; x:longint; y:longint):longint;cdecl;external libgtk4;
procedure gtk_entry_set_icon_tooltip_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; tooltip:Pchar);cdecl;external libgtk4;
function gtk_entry_get_icon_tooltip_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pchar;cdecl;external libgtk4;
procedure gtk_entry_set_icon_tooltip_markup(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; tooltip:Pchar);cdecl;external libgtk4;
function gtk_entry_get_icon_tooltip_markup(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pchar;cdecl;external libgtk4;
procedure gtk_entry_set_icon_drag_source(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; provider:PGdkContentProvider; actions:TGdkDragAction);cdecl;external libgtk4;
function gtk_entry_get_current_icon_drag_source(entry:PGtkEntry):longint;cdecl;external libgtk4;
procedure gtk_entry_get_icon_area(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; icon_area:PGdkRectangle);cdecl;external libgtk4;
procedure gtk_entry_reset_im_context(entry:PGtkEntry);cdecl;external libgtk4;
procedure gtk_entry_set_input_purpose(entry:PGtkEntry; purpose:TGtkInputPurpose);cdecl;external libgtk4;
function gtk_entry_get_input_purpose(entry:PGtkEntry):TGtkInputPurpose;cdecl;external libgtk4;
procedure gtk_entry_set_input_hints(entry:PGtkEntry; hints:TGtkInputHints);cdecl;external libgtk4;
function gtk_entry_get_input_hints(entry:PGtkEntry):TGtkInputHints;cdecl;external libgtk4;
procedure gtk_entry_set_attributes(entry:PGtkEntry; attrs:PPangoAttrList);cdecl;external libgtk4;
function gtk_entry_get_attributes(entry:PGtkEntry):PPangoAttrList;cdecl;external libgtk4;
procedure gtk_entry_set_tabs(entry:PGtkEntry; tabs:PPangoTabArray);cdecl;external libgtk4;
function gtk_entry_get_tabs(entry:PGtkEntry):PPangoTabArray;cdecl;external libgtk4;
function gtk_entry_grab_focus_without_selecting(entry:PGtkEntry):Tgboolean;cdecl;external libgtk4;
procedure gtk_entry_set_extra_menu(entry:PGtkEntry; model:PGMenuModel);cdecl;external libgtk4;
function gtk_entry_get_extra_menu(entry:PGtkEntry):PGMenuModel;cdecl;external libgtk4;
function gtk_entry_get_menu_entry_icon_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pgchar;cdecl;external libgtk4;
procedure gtk_entry_set_menu_entry_icon_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; text:Pgchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEntry, g_object_unref) }

// === Konventiert am: 6-7-26 14:20:10 ===

function GTK_TYPE_ENTRY : TGType;
function GTK_ENTRY(obj : Pointer) : PGtkEntry;
function GTK_ENTRY_CLASS(klass : Pointer) : PGtkEntryClass;
function GTK_IS_ENTRY(obj : Pointer) : Tgboolean;
function GTK_IS_ENTRY_CLASS(klass : Pointer) : Tgboolean;
function GTK_ENTRY_GET_CLASS(obj : Pointer) : PGtkEntryClass;

implementation

function GTK_TYPE_ENTRY : TGType;
  begin
    GTK_TYPE_ENTRY:=gtk_entry_get_type;
  end;

function GTK_ENTRY(obj : Pointer) : PGtkEntry;
begin
  Result := PGtkEntry(g_type_check_instance_cast(obj, GTK_TYPE_ENTRY));
end;

function GTK_ENTRY_CLASS(klass : Pointer) : PGtkEntryClass;
begin
  Result := PGtkEntryClass(g_type_check_class_cast(klass, GTK_TYPE_ENTRY));
end;

function GTK_IS_ENTRY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ENTRY);
end;

function GTK_IS_ENTRY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_ENTRY);
end;

function GTK_ENTRY_GET_CLASS(obj : Pointer) : PGtkEntryClass;
begin
  Result := PGtkEntryClass(PGTypeInstance(obj)^.g_class);
end;



end.
