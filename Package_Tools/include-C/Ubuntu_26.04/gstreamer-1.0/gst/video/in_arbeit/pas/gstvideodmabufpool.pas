unit gstvideodmabufpool;

interface

uses
  fp_glib2, fp_gst;

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

{G_DECLARE_FINAL_TYPE (GstVideoDmabufPool, gst_video_dmabuf_pool, GST, VIDEO_DMABUF_POOL, GstVideoBufferPool) }
function gst_video_dmabuf_pool_new:PGstBufferPool;cdecl;external libgstvideo;

// === Konventiert am: 15-7-26 13:21:22 ===

function GST_TYPE_VIDEO_DMABUF_POOL: TGType;
function GST_VIDEO_DMABUF_POOL(obj: Pointer): PGstVideoDmabufPool;
function GST_IS_VIDEO_DMABUF_POOL(obj: Pointer): Tgboolean;

implementation

function GST_TYPE_VIDEO_DMABUF_POOL: TGType;
begin
  Result := gst_video_dmabuf_pool_get_type;
end;

function GST_VIDEO_DMABUF_POOL(obj: Pointer): PGstVideoDmabufPool;
begin
  Result := PGstVideoDmabufPool(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_DMABUF_POOL));
end;

function GST_IS_VIDEO_DMABUF_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_DMABUF_POOL);
end;

type 
  PGstVideoDmabufPool = type Pointer;

  TGstVideoDmabufPoolClass = record
    parent_class: TGstVideoBufferPoolClass;
  end;
  PGstVideoDmabufPoolClass = ^TGstVideoDmabufPoolClass;

function gst_video_dmabuf_pool_get_type: TGType; cdecl; external libgxxxxxxx;



end.
