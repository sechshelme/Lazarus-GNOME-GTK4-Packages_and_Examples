unit gtkmediacontrols;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkmediastream.h>}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_FINAL_TYPE (GtkMediaControls, gtk_media_controls, GTK, MEDIA_CONTROLS, GtkWidget) }
function gtk_media_controls_new(stream:PGtkMediaStream):PGtkWidget;cdecl;external libgtk4;
function gtk_media_controls_get_media_stream(controls:PGtkMediaControls):PGtkMediaStream;cdecl;external libgtk4;
procedure gtk_media_controls_set_media_stream(controls:PGtkMediaControls; stream:PGtkMediaStream);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:36 ===

function GTK_TYPE_MEDIA_CONTROLS: TGType;
function GTK_MEDIA_CONTROLS(obj: Pointer): PGtkMediaControls;
function GTK_IS_MEDIA_CONTROLS(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_MEDIA_CONTROLS: TGType;
begin
  Result := gtk_media_controls_get_type;
end;

function GTK_MEDIA_CONTROLS(obj: Pointer): PGtkMediaControls;
begin
  Result := PGtkMediaControls(g_type_check_instance_cast(obj, GTK_TYPE_MEDIA_CONTROLS));
end;

function GTK_IS_MEDIA_CONTROLS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MEDIA_CONTROLS);
end;

type 
  PGtkMediaControls = type Pointer;

  TGtkMediaControlsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkMediaControlsClass = ^TGtkMediaControlsClass;

function gtk_media_controls_get_type: TGType; cdecl; external libgxxxxxxx;



end.
