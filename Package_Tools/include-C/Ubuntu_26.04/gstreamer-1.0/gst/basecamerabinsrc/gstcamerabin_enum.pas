unit gstcamerabin_enum;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2009 Nokia Corporation <multimedia@maemo.org>
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
{$ifndef __GST_CAMERABIN_ENUM_H__}
{$define __GST_CAMERABIN_ENUM_H__}
{$include <gst/gst.h>}
{$include "basecamerabinsrc-prelude.h"}
{ FIXME: these should be properly namespaced if they're meant as exposed API  }
{$ifndef __GI_SCANNER__}

const
  DEFAULT_WIDTH = 640;  
  DEFAULT_HEIGHT = 480;  
  DEFAULT_CAPTURE_WIDTH = 800;  
  DEFAULT_CAPTURE_HEIGHT = 600;  
{ makes it use the default  }
  DEFAULT_FPS_N = 0;  
  DEFAULT_FPS_D = 1;  
  DEFAULT_ZOOM = MIN_ZOOM;  
{$endif}
{ !__GI_SCANNER__  }
{ FIXME: properly namespace these enums  }
{*
 * GstCameraBinMode:
 * @MODE_IMAGE: image capture
 * @MODE_VIDEO: video capture
 *
 * Capture mode to use.
  }
{ MODE_PREVIEW = 0, No use for this  }
type
  PGstCameraBinMode = ^TGstCameraBinMode;
  TGstCameraBinMode =  Longint;
  Const
    MODE_IMAGE = 1;
    MODE_VIDEO = 2;
;
{ FIXME: should be CAMERA_BIN_MODE and camera_bin_mode  }

function gst_camerabin_mode_get_type:TGType;cdecl;external libgstbasecamerabinsrc;
{$endif}
{ #ifndef __GST_CAMERABIN_ENUM_H__  }

// === Konventiert am: 27-7-26 13:07:22 ===

function GST_TYPE_CAMERABIN_MODE : TGType;

implementation

function GST_TYPE_CAMERABIN_MODE : TGType;
  begin
    GST_TYPE_CAMERABIN_MODE:=gst_camerabin_mode_get_type;
  end;



end.
