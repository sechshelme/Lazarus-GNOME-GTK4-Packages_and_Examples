
unit gstvideodmabufpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvideodmabufpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvideodmabufpool.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer video dmabuf pool
 *
 * Copyright (C) 2025 Collabora Ltd.
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
(** unsupported pragma#pragma once*)
{$include <gst/video/gstvideopool.h>}
{*
 * GstVideoDmabufPool:
 *
 * Private instance object for #GstVideoDmabufPool.
 *
 * Since: 1.28
  }
{*
 * GstVideoDmabufPoolClass.parent_class:
 *
 * Parent Class.
 *
 * Since: 1.28
  }
{*
 * GST_TYPE_VIDEO_DMABUF_POOL:
 *
 * Macro that returns the #GstVideoDmabufPool type.
 *
 * Since: 1.28
  }

{ was #define dname def_expr }
function GST_TYPE_VIDEO_DMABUF_POOL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GstVideoDmabufPool, gst_video_dmabuf_pool, GST, VIDEO_DMABUF_POOL, GstVideoBufferPool) }
function gst_video_dmabuf_pool_new:PGstBufferPool;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_DMABUF_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_DMABUF_POOL:=gst_video_dmabuf_pool_get_type;
  end;


end.
