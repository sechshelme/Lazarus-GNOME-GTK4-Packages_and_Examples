unit gbookmarkfile;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gbookmarkfile.h: parsing and building desktop bookmarks
 *
 * Copyright (C) 2005-2006 Emmanuele Bassi
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_BOOKMARK_FILE_H__}
{$define __G_BOOKMARK_FILE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gdatetime.h>}
{$include <glib/gerror.h>}
{$include <time.h>}
{*
 * G_BOOKMARK_FILE_ERROR:
 *
 * Error domain for bookmark file parsing.
 *
 * Errors in this domain will be from the #GBookmarkFileError
 * enumeration. See #GError for information on error domains.
  }

{ was #define dname def_expr }
function G_BOOKMARK_FILE_ERROR : longint; { return type might be wrong }

{*
 * GBookmarkFileError:
 * @G_BOOKMARK_FILE_ERROR_INVALID_URI: URI was ill-formed
 * @G_BOOKMARK_FILE_ERROR_INVALID_VALUE: a requested field was not found
 * @G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED: a requested application did
 *     not register a bookmark
 * @G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND: a requested URI was not found
 * @G_BOOKMARK_FILE_ERROR_READ: document was ill formed
 * @G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING: the text being parsed was
 *     in an unknown encoding
 * @G_BOOKMARK_FILE_ERROR_WRITE: an error occurred while writing
 * @G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND: requested file was not found
 *
 * Error codes returned by bookmark file parsing.
  }
type
  PGBookmarkFileError = ^TGBookmarkFileError;
  TGBookmarkFileError =  Longint;
  Const
    G_BOOKMARK_FILE_ERROR_INVALID_URI = 0;
    G_BOOKMARK_FILE_ERROR_INVALID_VALUE = 1;
    G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED = 2;
    G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND = 3;
    G_BOOKMARK_FILE_ERROR_READ = 4;
    G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING = 5;
    G_BOOKMARK_FILE_ERROR_WRITE = 6;
    G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND = 7;
;

function g_bookmark_file_error_quark:TGQuark;cdecl;external libglib2;
{*
 * GBookmarkFile:
 *
 * `GBookmarkFile` lets you parse, edit or create files containing bookmarks.
 *
 * Bookmarks refer to a URI, along with some meta-data about the resource
 * pointed by the URI like its MIME type, the application that is registering
 * the bookmark and the icon that should be used to represent the bookmark.
 * The data is stored using the
 * [Desktop Bookmark Specification](https://www.freedesktop.org/wiki/Specifications/desktop-bookmark-spec/).
 *
 * The syntax of the bookmark files is described in detail inside the
 * Desktop Bookmark Specification, here is a quick summary: bookmark
 * files use a sub-class of the XML Bookmark Exchange Language
 * specification, consisting of valid UTF-8 encoded XML, under the
 * `<xbel>` root element; each bookmark is stored inside a
 * `<bookmark>` element, using its URI: no relative paths can
 * be used inside a bookmark file. The bookmark may have a user defined
 * title and description, to be used instead of the URI. Under the
 * `<metadata>` element, with its owner attribute set to
 * `http://freedesktop.org`, is stored the meta-data about a resource
 * pointed by its URI. The meta-data consists of the resource's MIME
 * type; the applications that have registered a bookmark; the groups
 * to which a bookmark belongs to; a visibility flag, used to set the
 * bookmark as "private" to the applications and groups that has it
 * registered; the URI and MIME type of an icon, to be used when
 * displaying the bookmark inside a GUI.
 *
 * Here is an example of a bookmark file:
 * [bookmarks.xbel](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/glib/tests/bookmarks.xbel)
 *
 * A bookmark file might contain more than one bookmark; each bookmark
 * is accessed through its URI.
 *
 * The important caveat of bookmark files is that when you add a new
 * bookmark you must also add the application that is registering it, using
 * [method@GLib.BookmarkFile.add_application] or [method@GLib.BookmarkFile.set_application_info].
 * If a bookmark has no applications then it won't be dumped when creating
 * the on disk representation, using [method@GLib.BookmarkFile.to_data] or
 * [method@GLib.BookmarkFile.to_file].
 *
 * Since: 2.12
  }
type

function g_bookmark_file_new:PGBookmarkFile;cdecl;external libglib2;
procedure g_bookmark_file_free(bookmark:PGBookmarkFile);cdecl;external libglib2;
function g_bookmark_file_copy(bookmark:PGBookmarkFile):PGBookmarkFile;cdecl;external libglib2;
function g_bookmark_file_load_from_file(bookmark:PGBookmarkFile; filename:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_load_from_data(bookmark:PGBookmarkFile; data:Pgchar; length:Tgsize; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_load_from_data_dirs(bookmark:PGBookmarkFile; file:Pgchar; full_path:PPgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_to_data(bookmark:PGBookmarkFile; length:Pgsize; error:PPGError):Pgchar;cdecl;external libglib2;
function g_bookmark_file_to_file(bookmark:PGBookmarkFile; filename:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
procedure g_bookmark_file_set_title(bookmark:PGBookmarkFile; uri:Pgchar; title:Pgchar);cdecl;external libglib2;
function g_bookmark_file_get_title(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Pgchar;cdecl;external libglib2;
procedure g_bookmark_file_set_description(bookmark:PGBookmarkFile; uri:Pgchar; description:Pgchar);cdecl;external libglib2;
function g_bookmark_file_get_description(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Pgchar;cdecl;external libglib2;
procedure g_bookmark_file_set_mime_type(bookmark:PGBookmarkFile; uri:Pgchar; mime_type:Pgchar);cdecl;external libglib2;
function g_bookmark_file_get_mime_type(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Pgchar;cdecl;external libglib2;
procedure g_bookmark_file_set_groups(bookmark:PGBookmarkFile; uri:Pgchar; groups:PPgchar; length:Tgsize);cdecl;external libglib2;
procedure g_bookmark_file_add_group(bookmark:PGBookmarkFile; uri:Pgchar; group:Pgchar);cdecl;external libglib2;
function g_bookmark_file_has_group(bookmark:PGBookmarkFile; uri:Pgchar; group:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_get_groups(bookmark:PGBookmarkFile; uri:Pgchar; length:Pgsize; error:PPGError):^Pgchar;cdecl;external libglib2;
procedure g_bookmark_file_add_application(bookmark:PGBookmarkFile; uri:Pgchar; name:Pgchar; exec:Pgchar);cdecl;external libglib2;
function g_bookmark_file_has_application(bookmark:PGBookmarkFile; uri:Pgchar; name:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_get_applications(bookmark:PGBookmarkFile; uri:Pgchar; length:Pgsize; error:PPGError):^Pgchar;cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_set_application_info) }
function g_bookmark_file_set_app_info(bookmark:PGBookmarkFile; uri:Pgchar; name:Pgchar; exec:Pgchar; count:Tgint; 
           stamp:Ttime_t; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_set_application_info(bookmark:PGBookmarkFile; uri:Pchar; name:Pchar; exec:Pchar; count:longint; 
           stamp:PGDateTime; error:PPGError):Tgboolean;cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_get_application_info) }
function g_bookmark_file_get_app_info(bookmark:PGBookmarkFile; uri:Pgchar; name:Pgchar; exec:PPgchar; count:Pguint; 
           stamp:Ptime_t; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_get_application_info(bookmark:PGBookmarkFile; uri:Pchar; name:Pchar; exec:PPchar; count:Pdword; 
           stamp:PPGDateTime; error:PPGError):Tgboolean;cdecl;external libglib2;
procedure g_bookmark_file_set_is_private(bookmark:PGBookmarkFile; uri:Pgchar; is_private:Tgboolean);cdecl;external libglib2;
function g_bookmark_file_get_is_private(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
procedure g_bookmark_file_set_icon(bookmark:PGBookmarkFile; uri:Pgchar; href:Pgchar; mime_type:Pgchar);cdecl;external libglib2;
function g_bookmark_file_get_icon(bookmark:PGBookmarkFile; uri:Pgchar; href:PPgchar; mime_type:PPgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_set_added_date_time) }
procedure g_bookmark_file_set_added(bookmark:PGBookmarkFile; uri:Pgchar; added:Ttime_t);cdecl;external libglib2;
procedure g_bookmark_file_set_added_date_time(bookmark:PGBookmarkFile; uri:Pchar; added:PGDateTime);cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_get_added_date_time) }
function g_bookmark_file_get_added(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Ttime_t;cdecl;external libglib2;
function g_bookmark_file_get_added_date_time(bookmark:PGBookmarkFile; uri:Pchar; error:PPGError):PGDateTime;cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_set_modified_date_time) }
procedure g_bookmark_file_set_modified(bookmark:PGBookmarkFile; uri:Pgchar; modified:Ttime_t);cdecl;external libglib2;
procedure g_bookmark_file_set_modified_date_time(bookmark:PGBookmarkFile; uri:Pchar; modified:PGDateTime);cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_get_modified_date_time) }
function g_bookmark_file_get_modified(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Ttime_t;cdecl;external libglib2;
function g_bookmark_file_get_modified_date_time(bookmark:PGBookmarkFile; uri:Pchar; error:PPGError):PGDateTime;cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_set_visited_date_time) }
procedure g_bookmark_file_set_visited(bookmark:PGBookmarkFile; uri:Pgchar; visited:Ttime_t);cdecl;external libglib2;
procedure g_bookmark_file_set_visited_date_time(bookmark:PGBookmarkFile; uri:Pchar; visited:PGDateTime);cdecl;external libglib2;
{xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_66_FOR(g_bookmark_file_get_visited_date_time) }
function g_bookmark_file_get_visited(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Ttime_t;cdecl;external libglib2;
function g_bookmark_file_get_visited_date_time(bookmark:PGBookmarkFile; uri:Pchar; error:PPGError):PGDateTime;cdecl;external libglib2;
function g_bookmark_file_has_item(bookmark:PGBookmarkFile; uri:Pgchar):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_get_size(bookmark:PGBookmarkFile):Tgint;cdecl;external libglib2;
function g_bookmark_file_get_uris(bookmark:PGBookmarkFile; length:Pgsize):^Pgchar;cdecl;external libglib2;
function g_bookmark_file_remove_group(bookmark:PGBookmarkFile; uri:Pgchar; group:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_remove_application(bookmark:PGBookmarkFile; uri:Pgchar; name:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_remove_item(bookmark:PGBookmarkFile; uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_bookmark_file_move_item(bookmark:PGBookmarkFile; old_uri:Pgchar; new_uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
{$endif}
{ __G_BOOKMARK_FILE_H__  }

// === Konventiert am: 22-6-26 16:01:08 ===


implementation


{ was #define dname def_expr }
function G_BOOKMARK_FILE_ERROR : longint; { return type might be wrong }
  begin
    G_BOOKMARK_FILE_ERROR:=g_bookmark_file_error_quark;
  end;


end.
