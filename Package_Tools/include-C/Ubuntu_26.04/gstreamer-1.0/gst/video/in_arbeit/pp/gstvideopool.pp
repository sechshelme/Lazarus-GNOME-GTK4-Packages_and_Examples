
unit gstvideopool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvideopool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvideopool.h
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
PGstBufferPool  = ^GstBufferPool;
PGstStructure  = ^GstStructure;
PGstVideoAlignment  = ^GstVideoAlignment;
PGstVideoBufferPool  = ^GstVideoBufferPool;
PGstVideoBufferPoolClass  = ^GstVideoBufferPoolClass;
PGstVideoBufferPoolPrivate  = ^GstVideoBufferPoolPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_POOL_H__}
{$define __GST_VIDEO_POOL_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{*
 * GST_BUFFER_POOL_OPTION_VIDEO_META:
 *
 * An option that can be activated on bufferpool to request video metadata
 * on buffers from the pool.
  }

const
  GST_BUFFER_POOL_OPTION_VIDEO_META = 'GstBufferPoolOptionVideoMeta';  
{*
 * GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT:
 *
 * A bufferpool option to enable extra padding. When a bufferpool supports this
 * option, gst_buffer_pool_config_set_video_alignment() can be called.
 *
 * When this option is enabled on the bufferpool,
 * #GST_BUFFER_POOL_OPTION_VIDEO_META should also be enabled.
  }
  GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT = 'GstBufferPoolOptionVideoAlignment';  
{ setting a bufferpool config  }
(* Const before type ignored *)

procedure gst_buffer_pool_config_set_video_alignment(config:PGstStructure; align:PGstVideoAlignment);cdecl;external;
(* Const before type ignored *)
function gst_buffer_pool_config_get_video_alignment(config:PGstStructure; align:PGstVideoAlignment):Tgboolean;cdecl;external;
{ video bufferpool  }
type

{ was #define dname def_expr }
function GST_TYPE_VIDEO_BUFFER_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_BUFFER_POOL_CAST(obj : longint) : PGstVideoBufferPool;

type
  PGstVideoBufferPool = ^TGstVideoBufferPool;
  TGstVideoBufferPool = record
      bufferpool : TGstBufferPool;
      priv : PGstVideoBufferPoolPrivate;
    end;

  PGstVideoBufferPoolClass = ^TGstVideoBufferPoolClass;
  TGstVideoBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
    end;


function gst_video_buffer_pool_get_type:TGType;cdecl;external;
function gst_video_buffer_pool_new:PGstBufferPool;cdecl;external;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoBufferPool, gst_object_unref) }
{$endif}
{ __GST_VIDEO_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_BUFFER_POOL:=gst_video_buffer_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_BUFFER_POOL(obj : longint) : longint;
begin
  GST_IS_VIDEO_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_BUFFER_POOL(obj : longint) : longint;
begin
  GST_VIDEO_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_BUFFER_POOL,GstVideoBufferPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_BUFFER_POOL_CAST(obj : longint) : PGstVideoBufferPool;
begin
  GST_VIDEO_BUFFER_POOL_CAST:=PGstVideoBufferPool(obj);
end;


end.
