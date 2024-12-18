
unit gtkvideo;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkvideo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkvideo.h
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
PGFile  = ^GFile;
PGtkMediaStream  = ^GtkMediaStream;
PGtkVideo  = ^GtkVideo;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_VIDEO : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (GtkVideo, gtk_video, GTK, VIDEO, GtkWidget) }
function gtk_video_new:PGtkWidget;cdecl;external;
function gtk_video_new_for_media_stream(stream:PGtkMediaStream):PGtkWidget;cdecl;external;
function gtk_video_new_for_file(file:PGFile):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_video_new_for_filename(filename:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_video_new_for_resource(resource_path:Pchar):PGtkWidget;cdecl;external;
function gtk_video_get_media_stream(self:PGtkVideo):PGtkMediaStream;cdecl;external;
procedure gtk_video_set_media_stream(self:PGtkVideo; stream:PGtkMediaStream);cdecl;external;
function gtk_video_get_file(self:PGtkVideo):PGFile;cdecl;external;
procedure gtk_video_set_file(self:PGtkVideo; file:PGFile);cdecl;external;
(* Const before type ignored *)
procedure gtk_video_set_filename(self:PGtkVideo; filename:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_video_set_resource(self:PGtkVideo; resource_path:Pchar);cdecl;external;
function gtk_video_get_autoplay(self:PGtkVideo):Tgboolean;cdecl;external;
procedure gtk_video_set_autoplay(self:PGtkVideo; autoplay:Tgboolean);cdecl;external;
function gtk_video_get_loop(self:PGtkVideo):Tgboolean;cdecl;external;
procedure gtk_video_set_loop(self:PGtkVideo; loop:Tgboolean);cdecl;external;
function gtk_video_get_graphics_offload(self:PGtkVideo):TGtkGraphicsOffloadEnabled;cdecl;external;
procedure gtk_video_set_graphics_offload(self:PGtkVideo; enabled:TGtkGraphicsOffloadEnabled);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_VIDEO : longint; { return type might be wrong }
  begin
    GTK_TYPE_VIDEO:=gtk_video_get_type;
  end;


end.
