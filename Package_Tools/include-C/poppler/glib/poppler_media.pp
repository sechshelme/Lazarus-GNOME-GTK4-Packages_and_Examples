
unit poppler_media;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_media.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_media.h
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
PGError  = ^GError;
PPopplerMedia  = ^PopplerMedia;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-media.h: glib interface to MediaRendition
 *
 * Copyright (C) 2010 Carlos Garcia Campos <carlosgc@gnome.org>
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
{$ifndef __POPPLER_MEDIA_H__}
{$define __POPPLER_MEDIA_H__}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_MEDIA : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_MEDIA(obj : longint) : longint;

{ FIXME: this should be generic (PopplerSaveToCallbackFunc)  }
{*
 * PopplerMediaSaveFunc:
 * @buf: (array length=count) (element-type guint8): buffer containing
 *   bytes to be written.
 * @count: number of bytes in @buf.
 * @data: (closure): user data passed to poppler_media_save_to_callback()
 * @error: GError to set on error, or %NULL
 *
 * Specifies the type of the function passed to
 * poppler_media_save_to_callback().  It is called once for each block of
 * bytes that is "written" by poppler_media_save_to_callback().  If
 * successful it should return %TRUE.  If an error occurs it should set
 * @error and return %FALSE, in which case poppler_media_save_to_callback()
 * will fail with the same error.
 *
 * Returns: %TRUE if successful, %FALSE (with @error set) if failed.
 *
 * Since: 0.14
  }
(* Const before type ignored *)
type

  TPopplerMediaSaveFunc = function (buf:Pgchar; count:Tgsize; data:Tgpointer; error:PPGError):Tgboolean;cdecl;

function poppler_media_get_type:TGType;cdecl;external;
function poppler_media_is_embedded(poppler_media:PPopplerMedia):Tgboolean;cdecl;external;
(* Const before type ignored *)
function poppler_media_get_filename(poppler_media:PPopplerMedia):Pgchar;cdecl;external;
(* Const before type ignored *)
function poppler_media_get_mime_type(poppler_media:PPopplerMedia):Pgchar;cdecl;external;
function poppler_media_get_auto_play(poppler_media:PPopplerMedia):Tgboolean;cdecl;external;
function poppler_media_get_show_controls(poppler_media:PPopplerMedia):Tgboolean;cdecl;external;
function poppler_media_get_repeat_count(poppler_media:PPopplerMedia):Tgfloat;cdecl;external;
(* Const before type ignored *)
function poppler_media_save(poppler_media:PPopplerMedia; filename:Pchar; error:PPGError):Tgboolean;cdecl;external;
{$ifndef G_OS_WIN32}

function poppler_media_save_to_fd(poppler_media:PPopplerMedia; fd:longint; error:PPGError):Tgboolean;cdecl;external;
{$endif}

function poppler_media_save_to_callback(poppler_media:PPopplerMedia; save_func:TPopplerMediaSaveFunc; user_data:Tgpointer; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __POPPLER_MEDIA_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_MEDIA : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_MEDIA:=poppler_media_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_MEDIA(obj : longint) : longint;
begin
  POPPLER_MEDIA:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_MEDIA,PopplerMedia);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_MEDIA(obj : longint) : longint;
begin
  POPPLER_IS_MEDIA:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_MEDIA);
end;


end.
