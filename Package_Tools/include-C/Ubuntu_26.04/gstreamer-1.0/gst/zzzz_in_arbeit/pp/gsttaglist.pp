
unit gsttaglist;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttaglist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttaglist.h
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGDate  = ^GDate;
Pgdouble  = ^gdouble;
Pgfloat  = ^gfloat;
Pgint  = ^gint;
Pgint64  = ^gint64;
Pgpointer  = ^gpointer;
PGstDateTime  = ^GstDateTime;
PGstSample  = ^GstSample;
PGstTagFlag  = ^GstTagFlag;
PGstTagList  = ^GstTagList;
PGstTagMergeMode  = ^GstTagMergeMode;
PGstTagScope  = ^GstTagScope;
Pguint  = ^guint;
Pguint64  = ^guint64;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gsttaglist.h: Header for tag support
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_TAGLIST_H__}
{$define __GST_TAGLIST_H__}
{$include <gst/gstdatetime.h>}
{$include <gst/gstsample.h>}
{$include <gst/gstbuffer.h>}
{$include <gst/glib-compat.h>}
{*
 * GstTagMergeMode:
 * @GST_TAG_MERGE_UNDEFINED: undefined merge mode
 * @GST_TAG_MERGE_REPLACE_ALL: replace all tags (clear list and append)
 * @GST_TAG_MERGE_REPLACE: replace tags
 * @GST_TAG_MERGE_APPEND: append tags
 * @GST_TAG_MERGE_PREPEND: prepend tags
 * @GST_TAG_MERGE_KEEP: keep existing tags
 * @GST_TAG_MERGE_KEEP_ALL: keep all existing tags
 * @GST_TAG_MERGE_COUNT: the number of merge modes
 *
 * The different tag merging modes are basically replace, overwrite and append,
 * but they can be seen from two directions. Given two taglists: (A) the tags
 * already in the element and (B) the ones that are supplied to the element (
 * e.g. via gst_tag_setter_merge_tags() / gst_tag_setter_add_tags() or a
 * %GST_EVENT_TAG), how are these tags merged?
 * In the table below this is shown for the cases that a tag exists in the list
 * (A) or does not exists (!A) and combinations thereof.
 *
 * | merge mode  | A + B | A + !B | !A + B | !A + !B |
 * | ----------- | ----- | ------ | ------ | ------- |
 * | REPLACE_ALL | B     | ø      | B      | ø       |
 * | REPLACE     | B     | A      | B      | ø       |
 * | APPEND      | A, B  | A      | B      | ø       |
 * | PREPEND     | B, A  | A      | B      | ø       |
 * | KEEP        | A     | A      | B      | ø       |
 * | KEEP_ALL    | A     | A      | ø      | ø       |
  }
{ add more  }
type
  PGstTagMergeMode = ^TGstTagMergeMode;
  TGstTagMergeMode =  Longint;
  Const
    GST_TAG_MERGE_UNDEFINED = 0;
    GST_TAG_MERGE_REPLACE_ALL = 1;
    GST_TAG_MERGE_REPLACE = 2;
    GST_TAG_MERGE_APPEND = 3;
    GST_TAG_MERGE_PREPEND = 4;
    GST_TAG_MERGE_KEEP = 5;
    GST_TAG_MERGE_KEEP_ALL = 6;
    GST_TAG_MERGE_COUNT = 7;
;
{*
 * GstTagFlag:
 * @GST_TAG_FLAG_UNDEFINED: undefined flag
 * @GST_TAG_FLAG_META: tag is meta data
 * @GST_TAG_FLAG_ENCODED: tag is encoded
 * @GST_TAG_FLAG_DECODED: tag is decoded
 * @GST_TAG_FLAG_COUNT: number of tag flags
 *
 * Extra tag flags used when registering tags.
  }
{ FIXME: these are not really flags ..  }
type
  PGstTagFlag = ^TGstTagFlag;
  TGstTagFlag =  Longint;
  Const
    GST_TAG_FLAG_UNDEFINED = 0;
    GST_TAG_FLAG_META = 1;
    GST_TAG_FLAG_ENCODED = 2;
    GST_TAG_FLAG_DECODED = 3;
    GST_TAG_FLAG_COUNT = 4;
;
{*
 * GstTagList:
 * @mini_object: the parent type
 *
 * Object describing tags / metadata.
  }
type
  PGstTagList = ^TGstTagList;
  TGstTagList = record
      mini_object : TGstMiniObject;
    end;

  var
    _gst_tag_list_type : TGType;cvar;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_TAG_LIST(x : longint) : PGstTagList;

const
  GST_TYPE_TAG_LIST = _gst_tag_list_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_TAG_LIST(obj : longint) : longint;

{*
 * GstTagForeachFunc:
 * @list: the #GstTagList
 * @tag: a name of a tag in @list
 * @user_data: user data
 *
 * A function that will be called in gst_tag_list_foreach(). The function may
 * not modify the tag list.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGstTagForeachFunc = procedure (list:PGstTagList; tag:Pgchar; user_data:Tgpointer);cdecl;
{*
 * GstTagMergeFunc:
 * @dest: the destination #GValue
 * @src: the source #GValue
 *
 * A function for merging multiple values of a tag used when registering
 * tags.
  }
(* Const before type ignored *)

  TGstTagMergeFunc = procedure (dest:PGValue; src:PGValue);cdecl;

function gst_tag_list_get_type:TGType;cdecl;external;
{ tag registration  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_tag_register(name:Pgchar; flag:TGstTagFlag; _type:TGType; nick:Pgchar; blurb:Pgchar; 
            func:TGstTagMergeFunc);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_tag_register_static(name:Pgchar; flag:TGstTagFlag; _type:TGType; nick:Pgchar; blurb:Pgchar; 
            func:TGstTagMergeFunc);cdecl;external;
{ some default merging functions  }
(* Const before type ignored *)
procedure gst_tag_merge_use_first(dest:PGValue; src:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_merge_strings_with_comma(dest:PGValue; src:PGValue);cdecl;external;
{ basic tag support  }
(* Const before type ignored *)
function gst_tag_exists(tag:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_tag_get_type(tag:Pgchar):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_get_nick(tag:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_get_description(tag:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_tag_get_flag(tag:Pgchar):TGstTagFlag;cdecl;external;
(* Const before type ignored *)
function gst_tag_is_fixed(tag:Pgchar):Tgboolean;cdecl;external;
{ tag lists  }
{*
 * GstTagScope:
 * @GST_TAG_SCOPE_STREAM: tags specific to this single stream
 * @GST_TAG_SCOPE_GLOBAL: global tags for the complete medium
 *
 * GstTagScope specifies if a taglist applies to the complete
 * medium or only to one single stream.
  }
type
  PGstTagScope = ^TGstTagScope;
  TGstTagScope =  Longint;
  Const
    GST_TAG_SCOPE_STREAM = 0;
    GST_TAG_SCOPE_GLOBAL = 1;
;

function gst_tag_list_new_empty:PGstTagList;cdecl;external;
(* Const before type ignored *)
function gst_tag_list_new(tag:Pgchar; args:array of const):PGstTagList;cdecl;external;
function gst_tag_list_new(tag:Pgchar):PGstTagList;cdecl;external;
function gst_tag_list_new_valist(var_args:Tva_list):PGstTagList;cdecl;external;
procedure gst_tag_list_set_scope(list:PGstTagList; scope:TGstTagScope);cdecl;external;
(* Const before type ignored *)
function gst_tag_list_get_scope(list:PGstTagList):TGstTagScope;cdecl;external;
(* Const before type ignored *)
function gst_tag_list_to_string(list:PGstTagList):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_tag_list_new_from_string(str:Pgchar):PGstTagList;cdecl;external;
(* Const before type ignored *)
function gst_tag_list_n_tags(list:PGstTagList):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_nth_tag_name(list:PGstTagList; index:Tguint):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_tag_list_is_empty(list:PGstTagList):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_is_equal(list1:PGstTagList; list2:PGstTagList):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_insert(into:PGstTagList; from:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_merge(list1:PGstTagList; list2:PGstTagList; mode:TGstTagMergeMode):PGstTagList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_tag_size(list:PGstTagList; tag:Pgchar):Tguint;cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_add(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar; args:array of const);cdecl;external;
procedure gst_tag_list_add(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_add_values(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar; args:array of const);cdecl;external;
procedure gst_tag_list_add_values(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_add_valist(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_add_valist_values(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar; var_args:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_tag_list_add_value(list:PGstTagList; mode:TGstTagMergeMode; tag:Pgchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_remove_tag(list:PGstTagList; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_tag_list_foreach(list:PGstTagList; func:TGstTagForeachFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_value_index(list:PGstTagList; tag:Pgchar; index:Tguint):PGValue;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_copy_value(dest:PGValue; list:PGstTagList; tag:Pgchar):Tgboolean;cdecl;external;
{ simplifications (FIXME: do we want them?)  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_boolean(list:PGstTagList; tag:Pgchar; value:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_boolean_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_int(list:PGstTagList; tag:Pgchar; value:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_int_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_uint(list:PGstTagList; tag:Pgchar; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_uint_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_int64(list:PGstTagList; tag:Pgchar; value:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_int64_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_uint64(list:PGstTagList; tag:Pgchar; value:Pguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_uint64_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_float(list:PGstTagList; tag:Pgchar; value:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_float_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_double(list:PGstTagList; tag:Pgchar; value:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_double_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_string(list:PGstTagList; tag:Pgchar; value:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_string_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_peek_string_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_pointer(list:PGstTagList; tag:Pgchar; value:Pgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_pointer_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:Pgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_date(list:PGstTagList; tag:Pgchar; value:PPGDate):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_date_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:PPGDate):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_date_time(list:PGstTagList; tag:Pgchar; value:PPGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_date_time_index(list:PGstTagList; tag:Pgchar; index:Tguint; value:PPGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_sample(list:PGstTagList; tag:Pgchar; sample:PPGstSample):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_tag_list_get_sample_index(list:PGstTagList; tag:Pgchar; index:Tguint; sample:PPGstSample):Tgboolean;cdecl;external;
function gst_tag_list_ref(taglist:PGstTagList):PGstTagList;cdecl;external;
procedure gst_tag_list_unref(taglist:PGstTagList);cdecl;external;
procedure gst_clear_tag_list(taglist_ptr:PPGstTagList);cdecl;external;
(* Const before type ignored *)
function gst_tag_list_copy(taglist:PGstTagList):PGstTagList;cdecl;external;
function gst_tag_list_replace(old_taglist:PPGstTagList; new_taglist:PGstTagList):Tgboolean;cdecl;external;
function gst_tag_list_take(old_taglist:PPGstTagList; new_taglist:PGstTagList):Tgboolean;cdecl;external;
function gst_tag_list_make_writable(taglist:PGstTagList):PGstTagList;cdecl;external;
(* Const before type ignored *)
function gst_tag_list_is_writable(taglist:PGstTagList):Tgboolean;cdecl;external;
{ GStreamer core tags  }
{*
 * GST_TAG_TITLE:
 *
 * commonly used title (string)
 *
 * The title as it should be displayed, e.g. 'The Doll House'
  }
const
  GST_TAG_TITLE = 'title';  
{*
 * GST_TAG_TITLE_SORTNAME:
 *
 * commonly used title, as used for sorting (string)
 *
 * The title as it should be sorted, e.g. 'Doll House, The'
  }
  GST_TAG_TITLE_SORTNAME = 'title-sortname';  
{*
 * GST_TAG_ARTIST:
 *
 * person(s) responsible for the recording (string)
 *
 * The artist name as it should be displayed, e.g. 'Jimi Hendrix' or
 * 'The Guitar Heroes'
  }
  GST_TAG_ARTIST = 'artist';  
{*
 * GST_TAG_ARTIST_SORTNAME:
 *
 * person(s) responsible for the recording, as used for sorting (string)
 *
 * The artist name as it should be sorted, e.g. 'Hendrix, Jimi' or
 * 'Guitar Heroes, The'
  }
  GST_TAG_ARTIST_SORTNAME = 'artist-sortname';  
{*
 * GST_TAG_ALBUM:
 *
 * album containing this data (string)
 *
 * The album name as it should be displayed, e.g. 'The Jazz Guitar'
  }
  GST_TAG_ALBUM = 'album';  
{*
 * GST_TAG_ALBUM_SORTNAME:
 *
 * album containing this data, as used for sorting (string)
 *
 * The album name as it should be sorted, e.g. 'Jazz Guitar, The'
  }
  GST_TAG_ALBUM_SORTNAME = 'album-sortname';  
{*
 * GST_TAG_ALBUM_ARTIST:
 *
 * The artist of the entire album, as it should be displayed.
  }
  GST_TAG_ALBUM_ARTIST = 'album-artist';  
{*
 * GST_TAG_ALBUM_ARTIST_SORTNAME:
 *
 * The artist of the entire album, as it should be sorted.
  }
  GST_TAG_ALBUM_ARTIST_SORTNAME = 'album-artist-sortname';  
{*
 * GST_TAG_COMPOSER:
 *
 * person(s) who composed the recording (string)
  }
  GST_TAG_COMPOSER = 'composer';  
{*
 * GST_TAG_CONDUCTOR:
 *
 * conductor/performer refinement (string)
 *
 * Since: 1.8
  }
  GST_TAG_CONDUCTOR = 'conductor';  
{*
 * GST_TAG_DATE:
 *
 * date the data was created (#GDate structure)
  }
  GST_TAG_DATE = 'date';  
{*
 * GST_TAG_DATE_TIME:
 *
 * date and time the data was created (#GstDateTime structure)
  }
  GST_TAG_DATE_TIME = 'datetime';  
{*
 * GST_TAG_GENRE:
 *
 * genre this data belongs to (string)
  }
  GST_TAG_GENRE = 'genre';  
{*
 * GST_TAG_COMMENT:
 *
 * free text commenting the data (string)
  }
  GST_TAG_COMMENT = 'comment';  
{*
 * GST_TAG_EXTENDED_COMMENT:
 *
 * key/value text commenting the data (string)
 *
 * Must be in the form of 'key=comment' or
 * 'key[lc]=comment' where 'lc' is an ISO-639
 * language code.
 *
 * This tag is used for unknown Vorbis comment tags,
 * unknown APE tags and certain ID3v2 comment fields.
  }
  GST_TAG_EXTENDED_COMMENT = 'extended-comment';  
{*
 * GST_TAG_TRACK_NUMBER:
 *
 * track number inside a collection (unsigned integer)
  }
  GST_TAG_TRACK_NUMBER = 'track-number';  
{*
 * GST_TAG_TRACK_COUNT:
 *
 * count of tracks inside collection this track belongs to (unsigned integer)
  }
  GST_TAG_TRACK_COUNT = 'track-count';  
{*
 * GST_TAG_ALBUM_VOLUME_NUMBER:
 *
 * disc number inside a collection (unsigned integer)
  }
  GST_TAG_ALBUM_VOLUME_NUMBER = 'album-disc-number';  
{*
 * GST_TAG_ALBUM_VOLUME_COUNT:
 *
 * count of discs inside collection this disc belongs to (unsigned integer)
  }
  GST_TAG_ALBUM_VOLUME_COUNT = 'album-disc-count';  
{*
 * GST_TAG_LOCATION:
 *
 * Origin of media as a URI (location, where the original of the file or stream
 * is hosted) (string)
  }
  GST_TAG_LOCATION = 'location';  
{*
 * GST_TAG_HOMEPAGE:
 *
 * Homepage for this media (i.e. artist or movie homepage) (string)
  }
  GST_TAG_HOMEPAGE = 'homepage';  
{*
 * GST_TAG_DESCRIPTION:
 *
 * short text describing the content of the data (string)
  }
  GST_TAG_DESCRIPTION = 'description';  
{*
 * GST_TAG_VERSION:
 *
 * version of this data (string)
  }
  GST_TAG_VERSION = 'version';  
{*
 * GST_TAG_ISRC:
 *
 * International Standard Recording Code - see http://www.ifpi.org/isrc/ (string)
  }
  GST_TAG_ISRC = 'isrc';  
{*
 * GST_TAG_ORGANIZATION:
 *
 * organization (string)
  }
  GST_TAG_ORGANIZATION = 'organization';  
{*
 * GST_TAG_COPYRIGHT:
 *
 * copyright notice of the data (string)
  }
  GST_TAG_COPYRIGHT = 'copyright';  
{*
 * GST_TAG_COPYRIGHT_URI:
 *
 * URI to location where copyright details can be found (string)
  }
  GST_TAG_COPYRIGHT_URI = 'copyright-uri';  
{*
 * GST_TAG_ENCODED_BY:
 *
 * name of the person or organisation that encoded the file. May contain a
 * copyright message if the person or organisation also holds the copyright
 * (string)
 *
 * Note: do not use this field to describe the encoding application. Use
 * #GST_TAG_APPLICATION_NAME or #GST_TAG_COMMENT for that.
  }
  GST_TAG_ENCODED_BY = 'encoded-by';  
{*
 * GST_TAG_CONTACT:
 *
 * contact information (string)
  }
  GST_TAG_CONTACT = 'contact';  
{*
 * GST_TAG_LICENSE:
 *
 * license of data (string)
  }
  GST_TAG_LICENSE = 'license';  
{*
 * GST_TAG_LICENSE_URI:
 *
 * URI to location where license details can be found (string)
  }
  GST_TAG_LICENSE_URI = 'license-uri';  
{*
 * GST_TAG_PERFORMER:
 *
 * person(s) performing (string)
  }
  GST_TAG_PERFORMER = 'performer';  
{*
 * GST_TAG_DURATION:
 *
 * length in GStreamer time units (nanoseconds) (unsigned 64-bit integer)
  }
  GST_TAG_DURATION = 'duration';  
{*
 * GST_TAG_CODEC:
 *
 * codec the data is stored in (string)
  }
  GST_TAG_CODEC = 'codec';  
{*
 * GST_TAG_VIDEO_CODEC:
 *
 * codec the video data is stored in (string)
  }
  GST_TAG_VIDEO_CODEC = 'video-codec';  
{*
 * GST_TAG_AUDIO_CODEC:
 *
 * codec the audio data is stored in (string)
  }
  GST_TAG_AUDIO_CODEC = 'audio-codec';  
{*
 * GST_TAG_SUBTITLE_CODEC:
 *
 * codec/format the subtitle data is stored in (string)
  }
  GST_TAG_SUBTITLE_CODEC = 'subtitle-codec';  
{*
 * GST_TAG_CONTAINER_FORMAT:
 *
 * container format the data is stored in (string)
  }
  GST_TAG_CONTAINER_FORMAT = 'container-format';  
{*
 * GST_TAG_BITRATE:
 *
 * exact or average bitrate in bits/s (unsigned integer)
  }
  GST_TAG_BITRATE = 'bitrate';  
{*
 * GST_TAG_NOMINAL_BITRATE:
 *
 * nominal bitrate in bits/s (unsigned integer). The actual bitrate might be
 * different from this target bitrate.
  }
  GST_TAG_NOMINAL_BITRATE = 'nominal-bitrate';  
{*
 * GST_TAG_MINIMUM_BITRATE:
 *
 * minimum bitrate in bits/s (unsigned integer)
  }
  GST_TAG_MINIMUM_BITRATE = 'minimum-bitrate';  
{*
 * GST_TAG_MAXIMUM_BITRATE:
 *
 * maximum bitrate in bits/s (unsigned integer)
  }
  GST_TAG_MAXIMUM_BITRATE = 'maximum-bitrate';  
{*
 * GST_TAG_SERIAL:
 *
 * serial number of track (unsigned integer)
  }
  GST_TAG_SERIAL = 'serial';  
{*
 * GST_TAG_ENCODER:
 *
 * encoder used to encode this stream (string)
  }
  GST_TAG_ENCODER = 'encoder';  
{*
 * GST_TAG_ENCODER_VERSION:
 *
 * version of the encoder used to encode this stream (unsigned integer)
  }
  GST_TAG_ENCODER_VERSION = 'encoder-version';  
{*
 * GST_TAG_TRACK_GAIN:
 *
 * track gain in dB (double)
  }
  GST_TAG_TRACK_GAIN = 'replaygain-track-gain';  
{*
 * GST_TAG_TRACK_GAIN_R128:
 *
 * track gain in dB (double)
 *
 * Since: 1.28
  }
  GST_TAG_TRACK_GAIN_R128 = 'r128-track-gain';  
{*
 * GST_TAG_TRACK_PEAK:
 *
 * peak of the track (double)
  }
  GST_TAG_TRACK_PEAK = 'replaygain-track-peak';  
{*
 * GST_TAG_ALBUM_GAIN:
 *
 * album gain in dB (double)
  }
  GST_TAG_ALBUM_GAIN = 'replaygain-album-gain';  
{*
 * GST_TAG_ALBUM_GAIN_R128:
 *
 * track gain in dB (double)
 *
 * Since: 1.28
  }
  GST_TAG_ALBUM_GAIN_R128 = 'r128-album-gain';  
{*
 * GST_TAG_ALBUM_PEAK:
 *
 * peak of the album (double)
  }
  GST_TAG_ALBUM_PEAK = 'replaygain-album-peak';  
{*
 * GST_TAG_REFERENCE_LEVEL:
 *
 * reference level of track and album gain values (double)
  }
  GST_TAG_REFERENCE_LEVEL = 'replaygain-reference-level';  
{*
 * GST_TAG_LANGUAGE_CODE:
 *
 * ISO-639-2 or ISO-639-1 code for the language the content is in (string)
 *
 * There is utility API in libgsttag in gst-plugins-base to obtain a translated
 * language name from the language code: `gst_tag_get_language_name()`
  }
  GST_TAG_LANGUAGE_CODE = 'language-code';  
{*
 * GST_TAG_LANGUAGE_NAME:
 *
 * Name of the language the content is in (string)
 *
 * Free-form name of the language the content is in, if a language code
 * is not available. This tag should not be set in addition to a language
 * code. It is undefined what language or locale the language name is in.
  }
  GST_TAG_LANGUAGE_NAME = 'language-name';  
{*
 * GST_TAG_IMAGE:
 *
 * image (sample) (sample taglist should specify the content type and preferably
 * also set "image-type" field as `GstTagImageType`)
  }
  GST_TAG_IMAGE = 'image';  
{*
 * GST_TAG_PREVIEW_IMAGE:
 *
 * image that is meant for preview purposes, e.g. small icon-sized version
 * (sample) (sample taglist should specify the content type)
  }
  GST_TAG_PREVIEW_IMAGE = 'preview-image';  
{*
 * GST_TAG_ATTACHMENT:
 *
 * generic file attachment (sample) (sample taglist should specify the content
 * type and if possible set "filename" to the file name of the
 * attachment)
  }
  GST_TAG_ATTACHMENT = 'attachment';  
{*
 * GST_TAG_BEATS_PER_MINUTE:
 *
 * number of beats per minute in audio (double)
  }
  GST_TAG_BEATS_PER_MINUTE = 'beats-per-minute';  
{*
 * GST_TAG_KEYWORDS:
 *
 * comma separated keywords describing the content (string).
  }
  GST_TAG_KEYWORDS = 'keywords';  
{*
 * GST_TAG_GEO_LOCATION_NAME:
 *
 * human readable descriptive location of where the media has been recorded or
 * produced. (string).
  }
  GST_TAG_GEO_LOCATION_NAME = 'geo-location-name';  
{*
 * GST_TAG_GEO_LOCATION_LATITUDE:
 *
 * geo latitude location of where the media has been recorded or produced in
 * degrees according to WGS84 (zero at the equator, negative values for southern
 * latitudes) (double).
  }
  GST_TAG_GEO_LOCATION_LATITUDE = 'geo-location-latitude';  
{*
 * GST_TAG_GEO_LOCATION_LONGITUDE:
 *
 * geo longitude location of where the media has been recorded or produced in
 * degrees according to WGS84 (zero at the prime meridian in Greenwich/UK,
 * negative values for western longitudes). (double).
  }
  GST_TAG_GEO_LOCATION_LONGITUDE = 'geo-location-longitude';  
{*
 * GST_TAG_GEO_LOCATION_ELEVATION:
 *
 * geo elevation of where the media has been recorded or produced in meters
 * according to WGS84 (zero is average sea level) (double).
  }
  GST_TAG_GEO_LOCATION_ELEVATION = 'geo-location-elevation';  
{*
 * GST_TAG_GEO_LOCATION_COUNTRY:
 *
 * The country (english name) where the media has been produced (string).
  }
  GST_TAG_GEO_LOCATION_COUNTRY = 'geo-location-country';  
{*
 * GST_TAG_GEO_LOCATION_CITY:
 *
 * The city (english name) where the media has been produced (string).
  }
  GST_TAG_GEO_LOCATION_CITY = 'geo-location-city';  
{*
 * GST_TAG_GEO_LOCATION_SUBLOCATION:
 *
 * A location 'smaller' than GST_TAG_GEO_LOCATION_CITY that specifies better
 * where the media has been produced. (e.g. the neighborhood) (string).
 *
 * This tag has been added as this is how it is handled/named in XMP's
 * Iptc4xmpcore schema.
  }
  GST_TAG_GEO_LOCATION_SUBLOCATION = 'geo-location-sublocation';  
{*
 * GST_TAG_GEO_LOCATION_HORIZONTAL_ERROR:
 *
 * Represents the expected error on the horizontal positioning in
 * meters (double).
  }
  GST_TAG_GEO_LOCATION_HORIZONTAL_ERROR = 'geo-location-horizontal-error';  
{*
 * GST_TAG_GEO_LOCATION_MOVEMENT_SPEED:
 *
 * Speed of the capturing device when performing the capture.
 * Represented in m/s. (double)
 *
 * See also #GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION
  }
  GST_TAG_GEO_LOCATION_MOVEMENT_SPEED = 'geo-location-movement-speed';  
{*
 * GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION:
 *
 * Indicates the movement direction of the device performing the capture
 * of a media. It is represented as degrees in floating point representation,
 * 0 means the geographic north, and increases clockwise (double from 0 to 360)
 *
 * See also #GST_TAG_GEO_LOCATION_CAPTURE_DIRECTION
  }
  GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION = 'geo-location-movement-direction';  
{*
 * GST_TAG_GEO_LOCATION_CAPTURE_DIRECTION:
 *
 * Indicates the direction the device is pointing to when capturing
 * a media. It is represented as degrees in floating point representation,
 * 0 means the geographic north, and increases clockwise (double from 0 to 360)
 *
 * See also #GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION
  }
  GST_TAG_GEO_LOCATION_CAPTURE_DIRECTION = 'geo-location-capture-direction';  
{*
 * GST_TAG_SHOW_NAME:
 *
 * Name of the show, used for displaying (string)
  }
  GST_TAG_SHOW_NAME = 'show-name';  
{*
 * GST_TAG_SHOW_SORTNAME:
 *
 * Name of the show, used for sorting (string)
  }
  GST_TAG_SHOW_SORTNAME = 'show-sortname';  
{*
 * GST_TAG_SHOW_EPISODE_NUMBER:
 *
 * Number of the episode within a season/show (unsigned integer)
  }
  GST_TAG_SHOW_EPISODE_NUMBER = 'show-episode-number';  
{*
 * GST_TAG_SHOW_SEASON_NUMBER:
 *
 * Number of the season of a show/series (unsigned integer)
  }
  GST_TAG_SHOW_SEASON_NUMBER = 'show-season-number';  
{*
 * GST_TAG_LYRICS:
 *
 * The lyrics of the media (string)
  }
  GST_TAG_LYRICS = 'lyrics';  
{*
 * GST_TAG_COMPOSER_SORTNAME:
 *
 * The composer's name, used for sorting (string)
  }
  GST_TAG_COMPOSER_SORTNAME = 'composer-sortname';  
{*
 * GST_TAG_GROUPING:
 *
 * Groups together media that are related and spans multiple tracks. An
 * example are multiple pieces of a concerto. (string)
  }
  GST_TAG_GROUPING = 'grouping';  
{*
 * GST_TAG_USER_RATING:
 *
 * Rating attributed by a person (likely the application user).
 * The higher the value, the more the user likes this media
 * (unsigned int from 0 to 100)
  }
  GST_TAG_USER_RATING = 'user-rating';  
{*
 * GST_TAG_DEVICE_MANUFACTURER:
 *
 * Manufacturer of the device used to create the media (string)
  }
  GST_TAG_DEVICE_MANUFACTURER = 'device-manufacturer';  
{*
 * GST_TAG_DEVICE_MODEL:
 *
 * Model of the device used to create the media (string)
  }
  GST_TAG_DEVICE_MODEL = 'device-model';  
{*
 * GST_TAG_APPLICATION_NAME:
 *
 * Name of the application used to create the media (string)
  }
  GST_TAG_APPLICATION_NAME = 'application-name';  
{*
 * GST_TAG_APPLICATION_DATA:
 *
 * Arbitrary application data (sample)
 *
 * Some formats allow applications to add their own arbitrary data
 * into files. This data is application dependent.
  }
  GST_TAG_APPLICATION_DATA = 'application-data';  
{*
 * GST_TAG_IMAGE_ORIENTATION:
 *
 * Represents the 'Orientation' tag from EXIF. Defines how the image
 * should be rotated and mirrored for display. (string)
 *
 * This tag has a predefined set of allowed values:
 *   "rotate-0"
 *   "rotate-90"
 *   "rotate-180"
 *   "rotate-270"
 *   "flip-rotate-0"
 *   "flip-rotate-90"
 *   "flip-rotate-180"
 *   "flip-rotate-270"
 *
 * The naming is adopted according to a possible transformation to perform
 * on the image to fix its orientation, obviously equivalent operations will
 * yield the same result.
 *
 * Rotations indicated by the values are in clockwise direction and
 * 'flip' means an horizontal mirroring.
  }
  GST_TAG_IMAGE_ORIENTATION = 'image-orientation';  
{*
 * GST_TAG_PUBLISHER:
 *
 * Name of the label or publisher (string)
 *
 * Since: 1.2
  }
  GST_TAG_PUBLISHER = 'publisher';  
{*
 * GST_TAG_INTERPRETED_BY:
 *
 * Information about the people behind a remix and similar
 * interpretations of another existing piece (string)
 *
 * Since: 1.2
  }
  GST_TAG_INTERPRETED_BY = 'interpreted-by';  
{*
 * GST_TAG_MIDI_BASE_NOTE:
 *
 * [Midi note number](http://en.wikipedia.org/wiki/Note#Note_designation_in_accordance_with_octave_name)
 * of the audio track. This is useful for sample instruments and in particular
 * for multi-samples.
 *
 * Since: 1.4
  }
  GST_TAG_MIDI_BASE_NOTE = 'midi-base-note';  
{*
 * GST_TAG_PRIVATE_DATA:
 *
 * Any private data that may be contained in tags (sample).
 *
 * It is represented by #GstSample in which #GstBuffer contains the
 * binary data and the sample's info #GstStructure may contain any
 * extra information that identifies the origin or meaning of the data.
 *
 * Private frames in ID3v2 tags ('PRIV' frames) will be represented
 * using this tag, in which case the GstStructure will be named
 * "ID3PrivateFrame" and contain a field named "owner" of type string
 * which contains the owner-identification string from the tag.
 *
 * Since: 1.8
  }
  GST_TAG_PRIVATE_DATA = 'private-data';  
{*
 * GST_TAG_CONTAINER_SPECIFIC_TRACK_ID:
 *
 * Unique identifier for the audio, video or text track this tag is associated
 * with. The mappings for several container formats are defined in the [Sourcing
 * In-band Media Resource Tracks from Media Containers into HTML
 * specification](https://dev.w3.org/html5/html-sourcing-inband-tracks/).
 *
 * Since: 1.24
  }
  GST_TAG_CONTAINER_SPECIFIC_TRACK_ID = 'container-specific-track-id';  
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstTagList, gst_tag_list_unref) }
{$endif}
{ __GST_TAGLIST_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_TAG_LIST(x : longint) : PGstTagList;
begin
  GST_TAG_LIST:=PGstTagList(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_TAG_LIST(obj : longint) : longint;
begin
  GST_IS_TAG_LIST:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_TAG_LIST);
end;


end.
