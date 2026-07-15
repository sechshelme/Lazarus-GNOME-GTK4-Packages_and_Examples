unit videodirection;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2016 Igalia <calvaris@igalia.com>
 *
 * videodirection.h: video rotation and flipping interface
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
{$ifndef __GST_VIDEO_DIRECTION_H__}
{$define __GST_VIDEO_DIRECTION_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}

{*
 * GstVideoDirection:
 *
 * Opaque #GstVideoDirection data structure.
 *
 * Since: 1.10
  }
type
{*
 * GstVideoDirectionInterface:
 * @iface: parent interface type.
 *
 * #GstVideoDirectionInterface interface.
 *
 * Since: 1.10
  }
  PGstVideoDirectionInterface = ^TGstVideoDirectionInterface;
  TGstVideoDirectionInterface = record
      iface : TGTypeInterface;
    end;


function gst_video_direction_get_type:TGType;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_DIRECTION_H__  }

// === Konventiert am: 15-7-26 13:29:25 ===

function GST_TYPE_VIDEO_DIRECTION : TGType;
function GST_VIDEO_DIRECTION(obj : Pointer) : PGstVideoDirection;
function GST_IS_VIDEO_DIRECTION(obj : Pointer) : Tgboolean;
function GST_VIDEO_DIRECTION_GET_INTERFACE(obj : Pointer) : PGstVideoDirectionInterface;

implementation

function GST_TYPE_VIDEO_DIRECTION : TGType;
  begin
    GST_TYPE_VIDEO_DIRECTION:=gst_video_direction_get_type;
  end;

function GST_VIDEO_DIRECTION(obj : Pointer) : PGstVideoDirection;
begin
  Result := PGstVideoDirection(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_DIRECTION));
end;

function GST_IS_VIDEO_DIRECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VIDEO_DIRECTION);
end;

function GST_VIDEO_DIRECTION_GET_INTERFACE(obj : Pointer) : PGstVideoDirectionInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_DIRECTION);
end;



end.
