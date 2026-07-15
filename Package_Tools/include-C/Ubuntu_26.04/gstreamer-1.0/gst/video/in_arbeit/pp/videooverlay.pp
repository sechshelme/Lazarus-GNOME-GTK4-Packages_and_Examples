
unit videooverlay;
interface

{
  Automatically converted by H2Pas 1.0.0 from videooverlay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    videooverlay.h
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
PGObject  = ^GObject;
PGObjectClass  = ^GObjectClass;
PGstMessage  = ^GstMessage;
PGstVideoOverlay  = ^GstVideoOverlay;
PGstVideoOverlayInterface  = ^GstVideoOverlayInterface;
PGValue  = ^GValue;
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

{ was #define dname def_expr }
function GST_TYPE_VIDEO_OVERLAY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_OVERLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY_GET_INTERFACE(inst : longint) : longint;

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


function gst_video_overlay_get_type:TGType;cdecl;external;
{ virtual function wrappers  }
function gst_video_overlay_set_render_rectangle(overlay:PGstVideoOverlay; x:Tgint; y:Tgint; width:Tgint; height:Tgint):Tgboolean;cdecl;external;
procedure gst_video_overlay_expose(overlay:PGstVideoOverlay);cdecl;external;
procedure gst_video_overlay_handle_events(overlay:PGstVideoOverlay; handle_events:Tgboolean);cdecl;external;
procedure gst_video_overlay_set_window_handle(overlay:PGstVideoOverlay; handle:Tguintptr);cdecl;external;
{ public methods to dispatch bus messages  }
procedure gst_video_overlay_got_window_handle(overlay:PGstVideoOverlay; handle:Tguintptr);cdecl;external;
procedure gst_video_overlay_prepare_window_handle(overlay:PGstVideoOverlay);cdecl;external;
function gst_is_video_overlay_prepare_window_handle_message(msg:PGstMessage):Tgboolean;cdecl;external;
procedure gst_video_overlay_install_properties(oclass:PGObjectClass; last_prop_id:Tgint);cdecl;external;
(* Const before type ignored *)
function gst_video_overlay_set_property(object:PGObject; last_prop_id:Tgint; property_id:Tguint; value:PGValue):Tgboolean;cdecl;external;
{$endif}
{ __GST_VIDEO_OVERLAY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_OVERLAY : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_OVERLAY:=gst_video_overlay_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY(obj : longint) : longint;
begin
  GST_VIDEO_OVERLAY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_OVERLAY,GstVideoOverlay);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_OVERLAY(obj : longint) : longint;
begin
  GST_IS_VIDEO_OVERLAY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_OVERLAY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_OVERLAY_GET_INTERFACE(inst : longint) : longint;
begin
  GST_VIDEO_OVERLAY_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_VIDEO_OVERLAY,GstVideoOverlayInterface);
end;


end.
