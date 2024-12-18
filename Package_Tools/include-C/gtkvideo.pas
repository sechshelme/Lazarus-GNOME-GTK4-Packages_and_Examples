unit gtkvideo;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

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
{$include <gtk/gtkgraphicsoffload.h>}

{ G_DECLARE_FINAL_TYPE (GtkVideo, gtk_video, GTK, VIDEO, GtkWidget) }
function gtk_video_new:PGtkWidget;cdecl;external libges;
function gtk_video_new_for_media_stream(stream:PGtkMediaStream):PGtkWidget;cdecl;external libges;
function gtk_video_new_for_file(file:PGFile):PGtkWidget;cdecl;external libges;
function gtk_video_new_for_filename(filename:Pchar):PGtkWidget;cdecl;external libges;
function gtk_video_new_for_resource(resource_path:Pchar):PGtkWidget;cdecl;external libges;
function gtk_video_get_media_stream(self:PGtkVideo):PGtkMediaStream;cdecl;external libges;
procedure gtk_video_set_media_stream(self:PGtkVideo; stream:PGtkMediaStream);cdecl;external libges;
function gtk_video_get_file(self:PGtkVideo):PGFile;cdecl;external libges;
procedure gtk_video_set_file(self:PGtkVideo; file:PGFile);cdecl;external libges;
procedure gtk_video_set_filename(self:PGtkVideo; filename:Pchar);cdecl;external libges;
procedure gtk_video_set_resource(self:PGtkVideo; resource_path:Pchar);cdecl;external libges;
function gtk_video_get_autoplay(self:PGtkVideo):Tgboolean;cdecl;external libges;
procedure gtk_video_set_autoplay(self:PGtkVideo; autoplay:Tgboolean);cdecl;external libges;
function gtk_video_get_loop(self:PGtkVideo):Tgboolean;cdecl;external libges;
procedure gtk_video_set_loop(self:PGtkVideo; loop:Tgboolean);cdecl;external libges;
function gtk_video_get_graphics_offload(self:PGtkVideo):TGtkGraphicsOffloadEnabled;cdecl;external libges;
procedure gtk_video_set_graphics_offload(self:PGtkVideo; enabled:TGtkGraphicsOffloadEnabled);cdecl;external libges;

// === Konventiert am: 18-12-24 17:42:29 ===

function GTK_TYPE_VIDEO: TGType;
function GTK_VIDEO(obj: Pointer): PGtkVideo;
function GTK_IS_VIDEO(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_VIDEO: TGType;
begin
  Result := gtk_video_get_type;
end;

function GTK_VIDEO(obj: Pointer): PGtkVideo;
begin
  Result := PGtkVideo(g_type_check_instance_cast(obj, GTK_TYPE_VIDEO));
end;

function GTK_IS_VIDEO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_VIDEO);
end;

type 
  TGtkVideo = record
  end;
  PGtkVideo = ^TGtkVideo;

  TGtkVideoClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkVideoClass = ^TGtkVideoClass;

function gtk_video_get_type: TGType; cdecl; external libgxxxxxxx;



end.
