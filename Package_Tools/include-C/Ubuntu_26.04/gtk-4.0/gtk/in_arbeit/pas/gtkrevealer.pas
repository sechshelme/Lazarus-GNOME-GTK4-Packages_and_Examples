unit gtkrevealer;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by 
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public 
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License 
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 *
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtkwidget.h>}

type
{*
 * GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_RIGHT:
 *
 * Combination of [enum@Gtk.RevealerTransitionType.CROSSFADE]
 * and [enum@Gtk.RevealerTransitionType.SLIDE_RIGHT].
 *
 * Since: 4.22
  }
{*
 * GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_LEFT:
 *
 * Combination of [enum@Gtk.RevealerTransitionType.CROSSFADE]
 * and [enum@Gtk.RevealerTransitionType.SLIDE_LEFT].
 *
 * Since: 4.22
  }
{*
 * GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_UP:
 *
 * Combination of [enum@Gtk.RevealerTransitionType.CROSSFADE]
 * and [enum@Gtk.RevealerTransitionType.SLIDE_UP].
 *
 * Since: 4.22
  }
{*
 * GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_DOWN:
 *
 * Combination of [enum@Gtk.RevealerTransitionType.CROSSFADE]
 * and [enum@Gtk.RevealerTransitionType.SLIDE_DOWN].
 *
 * Since: 4.22
  }

  PGtkRevealerTransitionType = ^TGtkRevealerTransitionType;
  TGtkRevealerTransitionType =  Longint;
  Const
    GTK_REVEALER_TRANSITION_TYPE_NONE = 0;
    GTK_REVEALER_TRANSITION_TYPE_CROSSFADE = 1;
    GTK_REVEALER_TRANSITION_TYPE_SLIDE_RIGHT = 2;
    GTK_REVEALER_TRANSITION_TYPE_SLIDE_LEFT = 3;
    GTK_REVEALER_TRANSITION_TYPE_SLIDE_UP = 4;
    GTK_REVEALER_TRANSITION_TYPE_SLIDE_DOWN = 5;
    GTK_REVEALER_TRANSITION_TYPE_SWING_RIGHT = 6;
    GTK_REVEALER_TRANSITION_TYPE_SWING_LEFT = 7;
    GTK_REVEALER_TRANSITION_TYPE_SWING_UP = 8;
    GTK_REVEALER_TRANSITION_TYPE_SWING_DOWN = 9;
    GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_RIGHT = 10;
    GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_LEFT = 11;
    GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_UP = 12;
    GTK_REVEALER_TRANSITION_TYPE_FADE_SLIDE_DOWN = 13;
;

function gtk_revealer_get_type:TGType;cdecl;external libgtk4;
function gtk_revealer_new:PGtkWidget;cdecl;external libgtk4;
function gtk_revealer_get_reveal_child(revealer:PGtkRevealer):Tgboolean;cdecl;external libgtk4;
procedure gtk_revealer_set_reveal_child(revealer:PGtkRevealer; reveal_child:Tgboolean);cdecl;external libgtk4;
function gtk_revealer_get_child_revealed(revealer:PGtkRevealer):Tgboolean;cdecl;external libgtk4;
function gtk_revealer_get_transition_duration(revealer:PGtkRevealer):Tguint;cdecl;external libgtk4;
procedure gtk_revealer_set_transition_duration(revealer:PGtkRevealer; duration:Tguint);cdecl;external libgtk4;
procedure gtk_revealer_set_transition_type(revealer:PGtkRevealer; transition:TGtkRevealerTransitionType);cdecl;external libgtk4;
function gtk_revealer_get_transition_type(revealer:PGtkRevealer):TGtkRevealerTransitionType;cdecl;external libgtk4;
procedure gtk_revealer_set_child(revealer:PGtkRevealer; child:PGtkWidget);cdecl;external libgtk4;
function gtk_revealer_get_child(revealer:PGtkRevealer):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkRevealer, g_object_unref) }

// === Konventiert am: 6-7-26 16:28:51 ===

function GTK_TYPE_REVEALER : TGType;
function GTK_REVEALER(obj : Pointer) : PGtkRevealer;
function GTK_IS_REVEALER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_REVEALER : TGType;
  begin
    GTK_TYPE_REVEALER:=gtk_revealer_get_type;
  end;

function GTK_REVEALER(obj : Pointer) : PGtkRevealer;
begin
  Result := PGtkRevealer(g_type_check_instance_cast(obj, GTK_TYPE_REVEALER));
end;

function GTK_IS_REVEALER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_REVEALER);
end;



end.
