
unit poppler_movie;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_movie.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_movie.h
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
Pgchar  = ^gchar;
Pgint  = ^gint;
PPopplerMovie  = ^PopplerMovie;
PPopplerMoviePlayMode  = ^PopplerMoviePlayMode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-movie.h: glib interface to Movie
 *
 * Copyright (C) 2010 Carlos Garcia Campos <carlosgc@gnome.org>
 * Copyright (C) 2008 Hugo Mercier <hmercier31[@]gmail.com>
 * Copyright (C) 2017 Francesco Poli <invernomuto@paranoici.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_MOVIE_H__}
{$define __POPPLER_MOVIE_H__}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_MOVIE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_MOVIE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_MOVIE(obj : longint) : longint;

{*
 * PopplerMoviePlayMode:
 * @POPPLER_MOVIE_PLAY_MODE_ONCE: the movie should be played once and controls should be closed at the end.
 * @POPPLER_MOVIE_PLAY_MODE_OPEN: the movie should be played once, but controls should be left open.
 * @POPPLER_MOVIE_PLAY_MODE_REPEAT: the movie should be played in loop, until manually stopped.
 * @POPPLER_MOVIE_PLAY_MODE_PALINDROME: the movie should be played forward and backward, forward and backward,
 *   and so forth, until manually stopped.
 *
 * Play mode enum values.
 *
 * Since: 0.54
  }
type
  PPopplerMoviePlayMode = ^TPopplerMoviePlayMode;
  TPopplerMoviePlayMode =  Longint;
  Const
    POPPLER_MOVIE_PLAY_MODE_ONCE = 0;
    POPPLER_MOVIE_PLAY_MODE_OPEN = 1;
    POPPLER_MOVIE_PLAY_MODE_REPEAT = 2;
    POPPLER_MOVIE_PLAY_MODE_PALINDROME = 3;
;

function poppler_movie_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function poppler_movie_get_filename(poppler_movie:PPopplerMovie):Pgchar;cdecl;external;
function poppler_movie_need_poster(poppler_movie:PPopplerMovie):Tgboolean;cdecl;external;
function poppler_movie_show_controls(poppler_movie:PPopplerMovie):Tgboolean;cdecl;external;
function poppler_movie_get_play_mode(poppler_movie:PPopplerMovie):TPopplerMoviePlayMode;cdecl;external;
function poppler_movie_is_synchronous(poppler_movie:PPopplerMovie):Tgboolean;cdecl;external;
function poppler_movie_get_volume(poppler_movie:PPopplerMovie):Tgdouble;cdecl;external;
function poppler_movie_get_rate(poppler_movie:PPopplerMovie):Tgdouble;cdecl;external;
function poppler_movie_get_rotation_angle(poppler_movie:PPopplerMovie):Tgushort;cdecl;external;
function poppler_movie_get_start(poppler_movie:PPopplerMovie):Tguint64;cdecl;external;
function poppler_movie_get_duration(poppler_movie:PPopplerMovie):Tguint64;cdecl;external;
procedure poppler_movie_get_aspect(poppler_movie:PPopplerMovie; width:Pgint; height:Pgint);cdecl;external;
{$endif}
{ __POPPLER_MOVIE_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_MOVIE : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_MOVIE:=poppler_movie_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_MOVIE(obj : longint) : longint;
begin
  POPPLER_MOVIE:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_MOVIE,PopplerMovie);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_MOVIE(obj : longint) : longint;
begin
  POPPLER_IS_MOVIE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_MOVIE);
end;


end.
