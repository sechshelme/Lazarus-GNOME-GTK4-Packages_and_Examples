unit videooverlay;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Video Overlay Interface
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 * Copyright (C) 2003 Julien Moutte <julien@moutte.net>
 * Copyright (C) 2011 Tim-Philipp Müller <tim@centricular.net>
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
{$ifndef __GST_VIDEO_OVERLAY_H__}
{$define __GST_VIDEO_OVERLAY_H__}
{$include <gst/gst.h>}
{$include <gst/video/gstvideosink.h>}

{*
 * GstVideoOverlay:
 *
 * Opaque #GstVideoOverlay interface structure
  }
type
{*
 * GstVideoOverlayInterface:
 * @iface: parent interface type.
 * @expose: virtual method to handle expose events
 * @handle_events: virtual method to handle events
 * @set_render_rectangle: virtual method to set the render rectangle
 * @set_window_handle: virtual method to configure the window handle
 *
 * #GstVideoOverlay interface
  }
{ virtual functions  }
  PGstVideoOverlayInterface = ^TGstVideoOverlayInterface;
  TGstVideoOverlayInterface = record
      iface : TGTypeInterface;
      expose : procedure (overlay:PGstVideoOverlay);cdecl;
      handle_events : procedure (overlay:PGstVideoOverlay; handle_events:Tgboolean);cdecl;
      set_render_rectangle : procedure (overlay:PGstVideoOverlay; x:Tgint; y:Tgint; width:Tgint; height:Tgint);cdecl;
      set_window_handle : procedure (overlay:PGstVideoOverlay; handle:Tguintptr);cdecl;
    end;


function gst_video_overlay_get_type:TGType;cdecl;external libgstvideo;
{ virtual function wrappers  }
function gst_video_overlay_set_render_rectangle(overlay:PGstVideoOverlay; x:Tgint; y:Tgint; width:Tgint; height:Tgint):Tgboolean;cdecl;external libgstvideo;
procedure gst_video_overlay_expose(overlay:PGstVideoOverlay);cdecl;external libgstvideo;
procedure gst_video_overlay_handle_events(overlay:PGstVideoOverlay; handle_events:Tgboolean);cdecl;external libgstvideo;
procedure gst_video_overlay_set_window_handle(overlay:PGstVideoOverlay; handle:Tguintptr);cdecl;external libgstvideo;
{ public methods to dispatch bus messages  }
procedure gst_video_overlay_got_window_handle(overlay:PGstVideoOverlay; handle:Tguintptr);cdecl;external libgstvideo;
procedure gst_video_overlay_prepare_window_handle(overlay:PGstVideoOverlay);cdecl;external libgstvideo;
function gst_is_video_overlay_prepare_window_handle_message(msg:PGstMessage):Tgboolean;cdecl;external libgstvideo;
procedure gst_video_overlay_install_properties(oclass:PGObjectClass; last_prop_id:Tgint);cdecl;external libgstvideo;
function gst_video_overlay_set_property(object:PGObject; last_prop_id:Tgint; property_id:Tguint; value:PGValue):Tgboolean;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_OVERLAY_H__  }

// === Konventiert am: 15-7-26 13:39:22 ===

function GST_TYPE_VIDEO_OVERLAY : TGType;
function GST_VIDEO_OVERLAY(obj : Pointer) : PGstVideoOverlay;
function GST_IS_VIDEO_OVERLAY(obj : Pointer) : Tgboolean;
function GST_VIDEO_OVERLAY_GET_INTERFACE(obj : Pointer) : PGstVideoOverlayInterface;

implementation

function GST_TYPE_VIDEO_OVERLAY : TGType;
  begin
    GST_TYPE_VIDEO_OVERLAY:=gst_video_overlay_get_type;
  end;

function GST_VIDEO_OVERLAY(obj : Pointer) : PGstVideoOverlay;
begin
  Result := PGstVideoOverlay(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_OVERLAY));
end;

function GST_IS_VIDEO_OVERLAY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VIDEO_OVERLAY);
end;

function GST_VIDEO_OVERLAY_GET_INTERFACE(obj : Pointer) : PGstVideoOverlayInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_OVERLAY);
end;



end.
