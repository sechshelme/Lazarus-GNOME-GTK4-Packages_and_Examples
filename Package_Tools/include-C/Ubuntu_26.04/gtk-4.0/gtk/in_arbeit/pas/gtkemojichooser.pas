unit gtkemojichooser;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkemojichooser.h: An Emoji chooser widget
 * Copyright 2017, Red Hat, Inc.
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

function gtk_emoji_chooser_get_type:TGType;cdecl;external libgtk4;
function gtk_emoji_chooser_new:PGtkWidget;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:10:49 ===

function GTK_TYPE_EMOJI_CHOOSER : TGType;
function GTK_EMOJI_CHOOSER(obj : Pointer) : PGtkEmojiChooser;
function GTK_EMOJI_CHOOSER_CLASS(klass : Pointer) : PGtkEmojiChooserClass;
function GTK_IS_EMOJI_CHOOSER(obj : Pointer) : Tgboolean;
function GTK_IS_EMOJI_CHOOSER_CLASS(klass : Pointer) : Tgboolean;
function GTK_EMOJI_CHOOSER_GET_CLASS(obj : Pointer) : PGtkEmojiChooserClass;

implementation

function GTK_TYPE_EMOJI_CHOOSER : TGType;
  begin
    GTK_TYPE_EMOJI_CHOOSER:=gtk_emoji_chooser_get_type;
  end;

function GTK_EMOJI_CHOOSER(obj : Pointer) : PGtkEmojiChooser;
begin
  Result := PGtkEmojiChooser(g_type_check_instance_cast(obj, GTK_TYPE_EMOJI_CHOOSER));
end;

function GTK_EMOJI_CHOOSER_CLASS(klass : Pointer) : PGtkEmojiChooserClass;
begin
  Result := PGtkEmojiChooserClass(g_type_check_class_cast(klass, GTK_TYPE_EMOJI_CHOOSER));
end;

function GTK_IS_EMOJI_CHOOSER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EMOJI_CHOOSER);
end;

function GTK_IS_EMOJI_CHOOSER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_EMOJI_CHOOSER);
end;

function GTK_EMOJI_CHOOSER_GET_CLASS(obj : Pointer) : PGtkEmojiChooserClass;
begin
  Result := PGtkEmojiChooserClass(PGTypeInstance(obj)^.g_class);
end;



end.
