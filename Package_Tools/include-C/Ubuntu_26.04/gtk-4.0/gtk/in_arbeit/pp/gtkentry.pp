
unit gtkentry;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkentry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkentry.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pgchar  = ^gchar;
PGdkContentProvider  = ^GdkContentProvider;
PGdkPaintable  = ^GdkPaintable;
PGdkRectangle  = ^GdkRectangle;
PGIcon  = ^GIcon;
PGMenuModel  = ^GMenuModel;
PGtkEntry  = ^GtkEntry;
PGtkEntryBuffer  = ^GtkEntryBuffer;
PGtkEntryClass  = ^GtkEntryClass;
PGtkEntryCompletion  = ^GtkEntryCompletion;
PGtkEntryIconPosition  = ^GtkEntryIconPosition;
PGtkWidget  = ^GtkWidget;
PPangoAttrList  = ^PangoAttrList;
PPangoTabArray  = ^PangoTabArray;
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

{ was #define dname def_expr }
function GTK_TYPE_ENTRY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_GET_CLASS(obj : longint) : longint;

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


function gtk_entry_get_type:TGType;cdecl;external;
function gtk_entry_new:PGtkWidget;cdecl;external;
function gtk_entry_new_with_buffer(buffer:PGtkEntryBuffer):PGtkWidget;cdecl;external;
function gtk_entry_get_buffer(entry:PGtkEntry):PGtkEntryBuffer;cdecl;external;
procedure gtk_entry_set_buffer(entry:PGtkEntry; buffer:PGtkEntryBuffer);cdecl;external;
procedure gtk_entry_set_visibility(entry:PGtkEntry; visible:Tgboolean);cdecl;external;
function gtk_entry_get_visibility(entry:PGtkEntry):Tgboolean;cdecl;external;
procedure gtk_entry_set_invisible_char(entry:PGtkEntry; ch:Tgunichar);cdecl;external;
function gtk_entry_get_invisible_char(entry:PGtkEntry):Tgunichar;cdecl;external;
procedure gtk_entry_unset_invisible_char(entry:PGtkEntry);cdecl;external;
procedure gtk_entry_set_has_frame(entry:PGtkEntry; setting:Tgboolean);cdecl;external;
function gtk_entry_get_has_frame(entry:PGtkEntry):Tgboolean;cdecl;external;
procedure gtk_entry_set_overwrite_mode(entry:PGtkEntry; overwrite:Tgboolean);cdecl;external;
function gtk_entry_get_overwrite_mode(entry:PGtkEntry):Tgboolean;cdecl;external;
{ text is truncated if needed  }
procedure gtk_entry_set_max_length(entry:PGtkEntry; max:longint);cdecl;external;
function gtk_entry_get_max_length(entry:PGtkEntry):longint;cdecl;external;
function gtk_entry_get_text_length(entry:PGtkEntry):Tguint16;cdecl;external;
procedure gtk_entry_set_activates_default(entry:PGtkEntry; setting:Tgboolean);cdecl;external;
function gtk_entry_get_activates_default(entry:PGtkEntry):Tgboolean;cdecl;external;
procedure gtk_entry_set_alignment(entry:PGtkEntry; xalign:single);cdecl;external;
function gtk_entry_get_alignment(entry:PGtkEntry):single;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_set_completion(entry:PGtkEntry; completion:PGtkEntryCompletion);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_get_completion(entry:PGtkEntry):PGtkEntryCompletion;cdecl;external;
{ Progress API
  }
procedure gtk_entry_set_progress_fraction(entry:PGtkEntry; fraction:Tdouble);cdecl;external;
function gtk_entry_get_progress_fraction(entry:PGtkEntry):Tdouble;cdecl;external;
procedure gtk_entry_set_progress_pulse_step(entry:PGtkEntry; fraction:Tdouble);cdecl;external;
function gtk_entry_get_progress_pulse_step(entry:PGtkEntry):Tdouble;cdecl;external;
procedure gtk_entry_progress_pulse(entry:PGtkEntry);cdecl;external;
(* Const before type ignored *)
function gtk_entry_get_placeholder_text(entry:PGtkEntry):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_set_placeholder_text(entry:PGtkEntry; text:Pchar);cdecl;external;
{ Setting and managing icons
  }
procedure gtk_entry_set_icon_from_paintable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; paintable:PGdkPaintable);cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_set_icon_from_icon_name(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; icon_name:Pchar);cdecl;external;
procedure gtk_entry_set_icon_from_gicon(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; icon:PGIcon);cdecl;external;
function gtk_entry_get_icon_storage_type(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):TGtkImageType;cdecl;external;
function gtk_entry_get_icon_paintable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):PGdkPaintable;cdecl;external;
(* Const before type ignored *)
function gtk_entry_get_icon_name(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pchar;cdecl;external;
function gtk_entry_get_icon_gicon(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):PGIcon;cdecl;external;
procedure gtk_entry_set_icon_activatable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; activatable:Tgboolean);cdecl;external;
function gtk_entry_get_icon_activatable(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Tgboolean;cdecl;external;
procedure gtk_entry_set_icon_sensitive(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; sensitive:Tgboolean);cdecl;external;
function gtk_entry_get_icon_sensitive(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Tgboolean;cdecl;external;
function gtk_entry_get_icon_at_pos(entry:PGtkEntry; x:longint; y:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_set_icon_tooltip_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; tooltip:Pchar);cdecl;external;
function gtk_entry_get_icon_tooltip_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_set_icon_tooltip_markup(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; tooltip:Pchar);cdecl;external;
function gtk_entry_get_icon_tooltip_markup(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pchar;cdecl;external;
procedure gtk_entry_set_icon_drag_source(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; provider:PGdkContentProvider; actions:TGdkDragAction);cdecl;external;
function gtk_entry_get_current_icon_drag_source(entry:PGtkEntry):longint;cdecl;external;
procedure gtk_entry_get_icon_area(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; icon_area:PGdkRectangle);cdecl;external;
procedure gtk_entry_reset_im_context(entry:PGtkEntry);cdecl;external;
procedure gtk_entry_set_input_purpose(entry:PGtkEntry; purpose:TGtkInputPurpose);cdecl;external;
function gtk_entry_get_input_purpose(entry:PGtkEntry):TGtkInputPurpose;cdecl;external;
procedure gtk_entry_set_input_hints(entry:PGtkEntry; hints:TGtkInputHints);cdecl;external;
function gtk_entry_get_input_hints(entry:PGtkEntry):TGtkInputHints;cdecl;external;
procedure gtk_entry_set_attributes(entry:PGtkEntry; attrs:PPangoAttrList);cdecl;external;
function gtk_entry_get_attributes(entry:PGtkEntry):PPangoAttrList;cdecl;external;
procedure gtk_entry_set_tabs(entry:PGtkEntry; tabs:PPangoTabArray);cdecl;external;
function gtk_entry_get_tabs(entry:PGtkEntry):PPangoTabArray;cdecl;external;
function gtk_entry_grab_focus_without_selecting(entry:PGtkEntry):Tgboolean;cdecl;external;
procedure gtk_entry_set_extra_menu(entry:PGtkEntry; model:PGMenuModel);cdecl;external;
function gtk_entry_get_extra_menu(entry:PGtkEntry):PGMenuModel;cdecl;external;
(* Const before type ignored *)
function gtk_entry_get_menu_entry_icon_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_entry_set_menu_entry_icon_text(entry:PGtkEntry; icon_pos:TGtkEntryIconPosition; text:Pgchar);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEntry, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_ENTRY : longint; { return type might be wrong }
  begin
    GTK_TYPE_ENTRY:=gtk_entry_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY(obj : longint) : longint;
begin
  GTK_ENTRY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_ENTRY,GtkEntry);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_CLASS(klass : longint) : longint;
begin
  GTK_ENTRY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_ENTRY,GtkEntryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY(obj : longint) : longint;
begin
  GTK_IS_ENTRY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_ENTRY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ENTRY_CLASS(klass : longint) : longint;
begin
  GTK_IS_ENTRY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_ENTRY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ENTRY_GET_CLASS(obj : longint) : longint;
begin
  GTK_ENTRY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_ENTRY,GtkEntryClass);
end;


end.
