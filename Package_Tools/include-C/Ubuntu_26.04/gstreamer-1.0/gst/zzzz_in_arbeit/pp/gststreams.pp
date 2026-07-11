
unit gststreams;
interface

{
  Automatically converted by H2Pas 1.0.0 from gststreams.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gststreams.h
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
PGstCaps  = ^GstCaps;
PGstStream  = ^GstStream;
PGstStreamClass  = ^GstStreamClass;
PGstStreamPrivate  = ^GstStreamPrivate;
PGstStreamType  = ^GstStreamType;
PGstTagList  = ^GstTagList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2015 Centricular Ltd
 *  @author: Edward Hervey <edward@centricular.com>
 *  @author: Jan Schmidt <jan@centricular.com>
 *
 * gststreams.h : Header for GstStream subsystem
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
{$ifndef __GST_STREAMS_H__}
{$define __GST_STREAMS_H__}
{$include <gst/gstobject.h>}

{ was #define dname def_expr }
function GST_TYPE_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STREAM_CAST(obj : longint) : PGstStream;

{*
 * GstStreamType:
 * @GST_STREAM_TYPE_UNKNOWN: The stream is of unknown (unclassified) type.
 * @GST_STREAM_TYPE_AUDIO: The stream is of audio data
 * @GST_STREAM_TYPE_VIDEO: The stream carries video data
 * @GST_STREAM_TYPE_CONTAINER: The stream is a muxed container type
 * @GST_STREAM_TYPE_TEXT: The stream contains subtitle / subpicture data.
 * @GST_STREAM_TYPE_METADATA: The stream contains metadata.
 *
 * #GstStreamType describes a high level classification set for
 * flows of data in #GstStream objects.
 *
 * Note that this is a flag, and therefore users should not assume it
 * will be a single value. Do not use the equality operator for checking
 * whether a stream is of a certain type.
 *
 * Since: 1.10
  }
{*
   * GST_STREAM_TYPE_METADATA:
   *
   * The stream contains metadata.
   *
   * Since: 1.28
    }
type
  PGstStreamType = ^TGstStreamType;
  TGstStreamType =  Longint;
  Const
    GST_STREAM_TYPE_UNKNOWN = 1 shl 0;
    GST_STREAM_TYPE_AUDIO = 1 shl 1;
    GST_STREAM_TYPE_VIDEO = 1 shl 2;
    GST_STREAM_TYPE_CONTAINER = 1 shl 3;
    GST_STREAM_TYPE_TEXT = 1 shl 4;
    GST_STREAM_TYPE_METADATA = 1 shl 5;
;
type
{*
 * GstStream:
 * @stream_id: The Stream Identifier for this #GstStream
 *
 * A high-level object representing a single stream. It might be backed, or
 * not, by an actual flow of data in a pipeline (#GstPad).
 *
 * A #GstStream does not care about data changes (such as decoding, encoding,
 * parsing,...) as long as the underlying data flow corresponds to the same
 * high-level flow (ex: a certain audio track).
 *
 * A #GstStream contains all the information pertinent to a stream, such as
 * stream-id, tags, caps, type, ...
 *
 * Elements can subclass a #GstStream for internal usage (to contain information
 * pertinent to streams of data).
 *
 * Since: 1.10
  }
{< private > }
{< public > }
(* Const before type ignored *)
{< private > }
  PGstStream = ^TGstStream;
  TGstStream = record
      object : TGstObject;
      stream_id : Pgchar;
      priv : PGstStreamPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstStreamClass:
 * @parent_class: the parent class structure
 *
 * GstStream class structure
  }
{< private > }
  PGstStreamClass = ^TGstStreamClass;
  TGstStreamClass = record
      parent_class : TGstObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_stream_get_type:TGType;cdecl;external;
{$include <gst/gstevent.h>}
(* Const before type ignored *)

function gst_stream_new(stream_id:Pgchar; caps:PGstCaps; _type:TGstStreamType; flags:TGstStreamFlags):PGstStream;cdecl;external;
(* Const before type ignored *)
function gst_stream_get_stream_id(stream:PGstStream):Pgchar;cdecl;external;
procedure gst_stream_set_stream_flags(stream:PGstStream; flags:TGstStreamFlags);cdecl;external;
function gst_stream_get_stream_flags(stream:PGstStream):TGstStreamFlags;cdecl;external;
procedure gst_stream_set_stream_type(stream:PGstStream; stream_type:TGstStreamType);cdecl;external;
function gst_stream_get_stream_type(stream:PGstStream):TGstStreamType;cdecl;external;
procedure gst_stream_set_tags(stream:PGstStream; tags:PGstTagList);cdecl;external;
function gst_stream_get_tags(stream:PGstStream):PGstTagList;cdecl;external;
procedure gst_stream_set_caps(stream:PGstStream; caps:PGstCaps);cdecl;external;
function gst_stream_get_caps(stream:PGstStream):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_stream_type_get_name(stype:TGstStreamType):Pgchar;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstStream, gst_object_unref) }
{$endif}
{ __GST_STREAMS_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_STREAM : longint; { return type might be wrong }
  begin
    GST_TYPE_STREAM:=gst_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM(obj : longint) : longint;
begin
  GST_IS_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM_CLASS(klass : longint) : longint;
begin
  GST_IS_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_GET_CLASS(obj : longint) : longint;
begin
  GST_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_STREAM,GstStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM(obj : longint) : longint;
begin
  GST_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_STREAM,GstStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_CLASS(klass : longint) : longint;
begin
  GST_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_STREAM,GstStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STREAM_CAST(obj : longint) : PGstStream;
begin
  GST_STREAM_CAST:=PGstStream(obj);
end;


end.
