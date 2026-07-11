
unit gststreamcollection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gststreamcollection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gststreamcollection.h
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
PGParamSpec  = ^GParamSpec;
PGstStream  = ^GstStream;
PGstStreamCollection  = ^GstStreamCollection;
PGstStreamCollectionClass  = ^GstStreamCollectionClass;
PGstStreamCollectionPrivate  = ^GstStreamCollectionPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2015 Centricular Ltd
 *  @author: Edward Hervey <edward@centricular.com>
 *  @author: Jan Schmidt <jan@centricular.com>
 *
 * gststreams.h : Header for GstStreamCollection subsystem
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
{$ifndef __GST_STREAM_COLLECTION_H__}
{$define __GST_STREAM_COLLECTION_H__}
{$include <gst/gstobject.h>}

{ was #define dname def_expr }
function GST_TYPE_STREAM_COLLECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM_COLLECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM_COLLECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_COLLECTION_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_COLLECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_COLLECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STREAM_COLLECTION_CAST(obj : longint) : PGstStreamCollection;

type
{$include <gst/gststreamcollection.h>}
{$include <gst/gststreams.h>}
{*
 * GstStreamCollection:
 *
 * A collection of #GstStream that are available.
 *
 * A #GstStreamCollection will be provided by elements that can make those
 * streams available. Applications can use the collection to show the user
 * what streams are available by using %gst_stream_collection_get_stream()
 *
 * Once posted, a #GstStreamCollection is immutable. Updates are made by sending
 * a new #GstStreamCollection message, which may or may not share some of
 * the #GstStream objects from the collection it replaces. The receiver can check
 * the sender of a stream collection message to know which collection is
 * obsoleted.
 *
 * Several elements in a pipeline can provide #GstStreamCollection.
 *
 * Applications can activate streams from a collection by using the
 * #GST_EVENT_SELECT_STREAMS event on a pipeline, bin or element.
 *
 * Since: 1.10
  }
{< private > }
type
  PGstStreamCollection = ^TGstStreamCollection;
  TGstStreamCollection = record
      object : TGstObject;
      upstream_id : Pgchar;
      priv : PGstStreamCollectionPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstStreamCollectionClass:
 * @parent_class: the parent class structure
 * @stream_notify: default signal handler for the stream-notify signal
 *
 * GstStreamCollection class structure
  }
{ signals  }
{< private > }
  PGstStreamCollectionClass = ^TGstStreamCollectionClass;
  TGstStreamCollectionClass = record
      parent_class : TGstObjectClass;
      stream_notify : procedure (collection:PGstStreamCollection; stream:PGstStream; pspec:PGParamSpec);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_stream_collection_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_stream_collection_new(upstream_id:Pgchar):PGstStreamCollection;cdecl;external;
(* Const before type ignored *)
function gst_stream_collection_get_upstream_id(collection:PGstStreamCollection):Pgchar;cdecl;external;
function gst_stream_collection_get_size(collection:PGstStreamCollection):Tguint;cdecl;external;
function gst_stream_collection_get_stream(collection:PGstStreamCollection; index:Tguint):PGstStream;cdecl;external;
function gst_stream_collection_add_stream(collection:PGstStreamCollection; stream:PGstStream):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstStreamCollection, gst_object_unref) }
{$endif}
{ __GST_STREAM_COLLECTION_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_STREAM_COLLECTION : longint; { return type might be wrong }
  begin
    GST_TYPE_STREAM_COLLECTION:=gst_stream_collection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM_COLLECTION(obj : longint) : longint;
begin
  GST_IS_STREAM_COLLECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_STREAM_COLLECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_STREAM_COLLECTION_CLASS(klass : longint) : longint;
begin
  GST_IS_STREAM_COLLECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_STREAM_COLLECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_COLLECTION_GET_CLASS(obj : longint) : longint;
begin
  GST_STREAM_COLLECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_STREAM_COLLECTION,GstStreamCollectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_COLLECTION(obj : longint) : longint;
begin
  GST_STREAM_COLLECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_STREAM_COLLECTION,GstStreamCollection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_STREAM_COLLECTION_CLASS(klass : longint) : longint;
begin
  GST_STREAM_COLLECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_STREAM_COLLECTION,GstStreamCollectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_STREAM_COLLECTION_CAST(obj : longint) : PGstStreamCollection;
begin
  GST_STREAM_COLLECTION_CAST:=PGstStreamCollection(obj);
end;


end.
