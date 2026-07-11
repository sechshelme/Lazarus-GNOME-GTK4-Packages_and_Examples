
unit gsttoc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsttoc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsttoc
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
Pgint64  = ^gint64;
PGList  = ^GList;
PGstTagList  = ^GstTagList;
PGstToc  = ^GstToc;
PGstTocEntry  = ^GstTocEntry;
PGstTocEntryType  = ^GstTocEntryType;
PGstTocLoopType  = ^GstTocLoopType;
PGstTocScope  = ^GstTocScope;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * (c) 2010, 2012 Alexander Saprykin <xelfium@gmail.com>
 *
 * gsttoc.h: generic TOC API declaration
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
{$ifndef __GST_TOC_H__}
{$define __GST_TOC_H__}
{$include <gst/gstconfig.h>}
{$include <gst/gstminiobject.h>}
{$include <gst/gststructure.h>}
{$include <gst/gsttaglist.h>}
{$include <gst/gstformat.h>}
  var
    _gst_toc_type : TGType;cvar;external;
    _gst_toc_entry_type : TGType;cvar;external;

const
  GST_TYPE_TOC = _gst_toc_type;  
  GST_TYPE_TOC_ENTRY = _gst_toc_entry_type;  
type
{*
 * GstTocScope:
 * @GST_TOC_SCOPE_GLOBAL: global TOC representing all selectable options
 *     (this is what applications are usually interested in)
 * @GST_TOC_SCOPE_CURRENT: TOC for the currently active/selected stream
 *     (this is a TOC representing the current stream from start to EOS,
 *     and is what a TOC writer / muxer is usually interested in; it will
 *     usually be a subset of the global TOC, e.g. just the chapters of
 *     the current title, or the chapters selected for playback from the
 *     current title)
 *
 * The scope of a TOC.
  }

  PGstTocScope = ^TGstTocScope;
  TGstTocScope =  Longint;
  Const
    GST_TOC_SCOPE_GLOBAL = 1;
    GST_TOC_SCOPE_CURRENT = 2;
;
{*
 * GstTocEntryType:
 * @GST_TOC_ENTRY_TYPE_ANGLE: entry is an angle (i.e. an alternative)
 * @GST_TOC_ENTRY_TYPE_VERSION: entry is a version (i.e. alternative)
 * @GST_TOC_ENTRY_TYPE_EDITION: entry is an edition (i.e. alternative)
 * @GST_TOC_ENTRY_TYPE_INVALID: invalid entry type value
 * @GST_TOC_ENTRY_TYPE_TITLE: entry is a title (i.e. a part of a sequence)
 * @GST_TOC_ENTRY_TYPE_TRACK: entry is a track (i.e. a part of a sequence)
 * @GST_TOC_ENTRY_TYPE_CHAPTER: entry is a chapter (i.e. a part of a sequence)
 *
 * The different types of TOC entries (see #GstTocEntry).
 *
 * There are two types of TOC entries: alternatives or parts in a sequence.
  }
type
  PGstTocEntryType = ^TGstTocEntryType;
  TGstTocEntryType =  Longint;
  Const
    GST_TOC_ENTRY_TYPE_ANGLE = -(3);
    GST_TOC_ENTRY_TYPE_VERSION = -(2);
    GST_TOC_ENTRY_TYPE_EDITION = -(1);
    GST_TOC_ENTRY_TYPE_INVALID = 0;
    GST_TOC_ENTRY_TYPE_TITLE = 1;
    GST_TOC_ENTRY_TYPE_TRACK = 2;
    GST_TOC_ENTRY_TYPE_CHAPTER = 3;
;
type
  PGstTocLoopType = ^TGstTocLoopType;
  TGstTocLoopType =  Longint;
  Const
    GST_TOC_LOOP_NONE = 0;
    GST_TOC_LOOP_FORWARD = 1;
    GST_TOC_LOOP_REVERSE = 2;
    GST_TOC_LOOP_PING_PONG = 3;
;
{*
 * GST_TOC_REPEAT_COUNT_INFINITE:
 *
 * Special value for the repeat_count set in gst_toc_entry_set_loop() or
 * returned by gst_toc_entry_set_loop() to indicate infinite looping.
 *
 * Since: 1.4
  }
  GST_TOC_REPEAT_COUNT_INFINITE = -(1);  
{ functions to return type structures  }

function gst_toc_get_type:TGType;cdecl;external;
function gst_toc_entry_get_type:TGType;cdecl;external;
{ functions to create, ref and unref/free TOCs  }
function gst_toc_new(scope:TGstTocScope):PGstToc;cdecl;external;
(* Const before type ignored *)
function gst_toc_get_scope(toc:PGstToc):TGstTocScope;cdecl;external;
procedure gst_toc_set_tags(toc:PGstToc; tags:PGstTagList);cdecl;external;
procedure gst_toc_merge_tags(toc:PGstToc; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
(* Const before type ignored *)
function gst_toc_get_tags(toc:PGstToc):PGstTagList;cdecl;external;
procedure gst_toc_append_entry(toc:PGstToc; entry:PGstTocEntry);cdecl;external;
(* Const before type ignored *)
function gst_toc_get_entries(toc:PGstToc):PGList;cdecl;external;
procedure gst_toc_dump(toc:PGstToc);cdecl;external;
{ functions to create, ref and unref/free TOC entries  }
(* Const before type ignored *)
function gst_toc_entry_new(_type:TGstTocEntryType; uid:Pgchar):PGstTocEntry;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_toc_find_entry(toc:PGstToc; uid:Pgchar):PGstTocEntry;cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_get_entry_type(entry:PGstTocEntry):TGstTocEntryType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_toc_entry_get_uid(entry:PGstTocEntry):Pgchar;cdecl;external;
procedure gst_toc_entry_append_sub_entry(entry:PGstTocEntry; subentry:PGstTocEntry);cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_get_sub_entries(entry:PGstTocEntry):PGList;cdecl;external;
procedure gst_toc_entry_set_tags(entry:PGstTocEntry; tags:PGstTagList);cdecl;external;
procedure gst_toc_entry_merge_tags(entry:PGstTocEntry; tags:PGstTagList; mode:TGstTagMergeMode);cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_get_tags(entry:PGstTocEntry):PGstTagList;cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_is_alternative(entry:PGstTocEntry):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_is_sequence(entry:PGstTocEntry):Tgboolean;cdecl;external;
procedure gst_toc_entry_set_start_stop_times(entry:PGstTocEntry; start:Tgint64; stop:Tgint64);cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_get_start_stop_times(entry:PGstTocEntry; start:Pgint64; stop:Pgint64):Tgboolean;cdecl;external;
procedure gst_toc_entry_set_loop(entry:PGstTocEntry; loop_type:TGstTocLoopType; repeat_count:Tgint);cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_get_loop(entry:PGstTocEntry; loop_type:PGstTocLoopType; repeat_count:Pgint):Tgboolean;cdecl;external;
function gst_toc_entry_get_toc(entry:PGstTocEntry):PGstToc;cdecl;external;
function gst_toc_entry_get_parent(entry:PGstTocEntry):PGstTocEntry;cdecl;external;
(* Const before type ignored *)
function gst_toc_entry_type_get_nick(_type:TGstTocEntryType):Pgchar;cdecl;external;
{$endif}
{ __GST_TOC_H__  }

implementation


end.
