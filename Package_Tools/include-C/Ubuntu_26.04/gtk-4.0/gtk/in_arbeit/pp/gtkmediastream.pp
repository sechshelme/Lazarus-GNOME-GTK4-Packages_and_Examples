
unit gtkmediastream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkmediastream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkmediastream.h
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
PGdkSurface  = ^GdkSurface;
PGError  = ^GError;
PGtkMediaStream  = ^GtkMediaStream;
PGtkMediaStreamClass  = ^GtkMediaStreamClass;
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
{$include <gdk/gdk.h>}

{ was #define dname def_expr }
function GTK_TYPE_MEDIA_STREAM : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkMediaStream, gtk_media_stream, GTK, MEDIA_STREAM, GObject) }
{ Padding for future expansion  }
type
  PGtkMediaStreamClass = ^TGtkMediaStreamClass;
  TGtkMediaStreamClass = record
      parent_class : TGObjectClass;
      play : function (self:PGtkMediaStream):Tgboolean;cdecl;
      pause : procedure (self:PGtkMediaStream);cdecl;
      seek : procedure (self:PGtkMediaStream; timestamp:Tgint64);cdecl;
      update_audio : procedure (self:PGtkMediaStream; muted:Tgboolean; volume:Tdouble);cdecl;
      realize : procedure (self:PGtkMediaStream; surface:PGdkSurface);cdecl;
      unrealize : procedure (self:PGtkMediaStream; surface:PGdkSurface);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
      _gtk_reserved5 : procedure ;cdecl;
      _gtk_reserved6 : procedure ;cdecl;
      _gtk_reserved7 : procedure ;cdecl;
      _gtk_reserved8 : procedure ;cdecl;
    end;


function gtk_media_stream_is_prepared(self:PGtkMediaStream):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_media_stream_get_error(self:PGtkMediaStream):PGError;cdecl;external;
function gtk_media_stream_has_audio(self:PGtkMediaStream):Tgboolean;cdecl;external;
function gtk_media_stream_has_video(self:PGtkMediaStream):Tgboolean;cdecl;external;
procedure gtk_media_stream_play(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_pause(self:PGtkMediaStream);cdecl;external;
function gtk_media_stream_get_playing(self:PGtkMediaStream):Tgboolean;cdecl;external;
procedure gtk_media_stream_set_playing(self:PGtkMediaStream; playing:Tgboolean);cdecl;external;
function gtk_media_stream_get_ended(self:PGtkMediaStream):Tgboolean;cdecl;external;
function gtk_media_stream_get_timestamp(self:PGtkMediaStream):Tgint64;cdecl;external;
function gtk_media_stream_get_duration(self:PGtkMediaStream):Tgint64;cdecl;external;
function gtk_media_stream_is_seekable(self:PGtkMediaStream):Tgboolean;cdecl;external;
function gtk_media_stream_is_seeking(self:PGtkMediaStream):Tgboolean;cdecl;external;
procedure gtk_media_stream_seek(self:PGtkMediaStream; timestamp:Tgint64);cdecl;external;
function gtk_media_stream_get_loop(self:PGtkMediaStream):Tgboolean;cdecl;external;
procedure gtk_media_stream_set_loop(self:PGtkMediaStream; loop:Tgboolean);cdecl;external;
function gtk_media_stream_get_muted(self:PGtkMediaStream):Tgboolean;cdecl;external;
procedure gtk_media_stream_set_muted(self:PGtkMediaStream; muted:Tgboolean);cdecl;external;
function gtk_media_stream_get_volume(self:PGtkMediaStream):Tdouble;cdecl;external;
procedure gtk_media_stream_set_volume(self:PGtkMediaStream; volume:Tdouble);cdecl;external;
procedure gtk_media_stream_realize(self:PGtkMediaStream; surface:PGdkSurface);cdecl;external;
procedure gtk_media_stream_unrealize(self:PGtkMediaStream; surface:PGdkSurface);cdecl;external;
{ for implementations only  }
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_media_stream_stream_prepared) }
procedure gtk_media_stream_prepared(self:PGtkMediaStream; has_audio:Tgboolean; has_video:Tgboolean; seekable:Tgboolean; duration:Tgint64);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_media_stream_stream_unprepared) }
procedure gtk_media_stream_unprepared(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_stream_prepared(self:PGtkMediaStream; has_audio:Tgboolean; has_video:Tgboolean; seekable:Tgboolean; duration:Tgint64);cdecl;external;
procedure gtk_media_stream_stream_unprepared(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_update(self:PGtkMediaStream; timestamp:Tgint64);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_4_FOR(gtk_media_stream_stream_ended) }
procedure gtk_media_stream_ended(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_stream_ended(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_seek_success(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_seek_failed(self:PGtkMediaStream);cdecl;external;
procedure gtk_media_stream_gerror(self:PGtkMediaStream; error:PGError);cdecl;external;
(* Const before type ignored *)
procedure gtk_media_stream_error(self:PGtkMediaStream; domain:TGQuark; code:longint; format:Pchar; args:array of const);cdecl;external;
procedure gtk_media_stream_error(self:PGtkMediaStream; domain:TGQuark; code:longint; format:Pchar);cdecl;external;
{ (4, 5); }
(* Const before type ignored *)
procedure gtk_media_stream_error_valist(self:PGtkMediaStream; domain:TGQuark; code:longint; format:Pchar; args:Tva_list);cdecl;external;
{ (4, 0); }

implementation

{ was #define dname def_expr }
function GTK_TYPE_MEDIA_STREAM : longint; { return type might be wrong }
  begin
    GTK_TYPE_MEDIA_STREAM:=gtk_media_stream_get_type;
  end;


end.
