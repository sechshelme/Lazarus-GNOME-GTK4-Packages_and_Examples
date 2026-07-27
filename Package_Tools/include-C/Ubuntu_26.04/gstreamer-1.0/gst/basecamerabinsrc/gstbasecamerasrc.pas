unit gstbasecamerasrc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2010 Texas Instruments, Inc
 * Copyright (C) 2011 Thiago Santos <thiago.sousa.santos@collabora.com>
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
{$ifndef __GST_BASE_CAMERA_SRC_H__}
{$define __GST_BASE_CAMERA_SRC_H__}
{$include <gst/gst.h>}
{$include <gst/gstbin.h>}
{$include "basecamerabinsrc-prelude.h"}
{$include "gstcamerabin-enum.h"}
{$include "gstcamerabinpreview.h"}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_CAMERA_SRC_CAST(obj : longint) : PGstBaseCameraSrc;

function gst_base_camera_src_get_type:TGType;cdecl;external libgstbasecamerabinsrc;
type

const
  GST_BASE_CAMERA_SRC_VIEWFINDER_PAD_NAME = 'vfsrc';  
  GST_BASE_CAMERA_SRC_IMAGE_PAD_NAME = 'imgsrc';  
  GST_BASE_CAMERA_SRC_VIDEO_PAD_NAME = 'vidsrc';  
  GST_BASE_CAMERA_SRC_PREVIEW_MESSAGE_NAME = 'preview-image';  
{*
 * GstBaseCameraSrc:
  }
{ Preview convert pipeline  }
{ Resolution of the buffers configured to camerabin  }
type
  PGstBaseCameraSrc = ^TGstBaseCameraSrc;
  TGstBaseCameraSrc = record
      parent : TGstBin;
      mode : TGstCameraBinMode;
      auto_start : Tgboolean;
      capturing : Tgboolean;
      capturing_mutex : TGMutex;
      preview_caps : PGstCaps;
      post_preview : Tgboolean;
      preview_filter : PGstElement;
      preview_pipeline : PGstCameraBinPreviewPipelineData;
      width : Tgint;
      height : Tgint;
      zoom : Tgfloat;
      max_zoom : Tgfloat;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{*
 * GstBaseCameraSrcClass:
 * @construct_pipeline: construct pipeline
 * @setup_pipeline: configure pipeline for the chosen settings
 * @set_zoom: set the zoom
 * @set_mode: set the mode
  }
{ Construct pipeline. (called in GST_STATE_CHANGE_NULL_TO_READY) Optional.  }
{ (called in GST_STATE_CHANGE_READY_TO_PAUSED). Optional.  }
{ Set the zoom. If set, called when changing 'zoom' property. Optional.  }
{ Set the mode. If set, called when changing 'mode' property. Optional.  }
{ Set preview caps. If set, called called when setting new 'preview-caps'. Optional.  }
{ Called by the handler for 'start-capture'. Mandatory.  }
{ Called by the handler for 'stop-capture'. Mandatory.  }
  PGstBaseCameraSrcClass = ^TGstBaseCameraSrcClass;
  TGstBaseCameraSrcClass = record
      parent : TGstBinClass;
      construct_pipeline : function (self:PGstBaseCameraSrc):Tgboolean;cdecl;
      setup_pipeline : function (self:PGstBaseCameraSrc):Tgboolean;cdecl;
      set_zoom : procedure (self:PGstBaseCameraSrc; zoom:Tgfloat);cdecl;
      set_mode : function (self:PGstBaseCameraSrc; mode:TGstCameraBinMode):Tgboolean;cdecl;
      set_preview : function (self:PGstBaseCameraSrc; preview_caps:PGstCaps):Tgboolean;cdecl;
      start_capture : function (src:PGstBaseCameraSrc):Tgboolean;cdecl;
      stop_capture : procedure (src:PGstBaseCameraSrc);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{ FIXME: these should be properly namespaced if they're meant as exposed API  }
{$ifndef __GI_SCANNER__}

const
  MIN_ZOOM = 1.0;  
  MAX_ZOOM = 10.0;  
  ZOOM_1X = MIN_ZOOM;  
{$endif}
{ !__GI_SCANNER__  }

function gst_base_camera_src_set_mode(self:PGstBaseCameraSrc; mode:TGstCameraBinMode):Tgboolean;cdecl;external libgstbasecamerabinsrc;
procedure gst_base_camera_src_setup_zoom(self:PGstBaseCameraSrc);cdecl;external libgstbasecamerabinsrc;
procedure gst_base_camera_src_setup_preview(self:PGstBaseCameraSrc; preview_caps:PGstCaps);cdecl;external libgstbasecamerabinsrc;
procedure gst_base_camera_src_finish_capture(self:PGstBaseCameraSrc);cdecl;external libgstbasecamerabinsrc;
procedure gst_base_camera_src_post_preview(self:PGstBaseCameraSrc; sample:PGstSample);cdecl;external libgstbasecamerabinsrc;
{ XXX add methods to get/set img capture and vid capture caps.. }
{$endif}
{ __GST_BASE_CAMERA_SRC_H__  }

// === Konventiert am: 27-7-26 13:09:20 ===

function GST_TYPE_BASE_CAMERA_SRC : TGType;
function GST_BASE_CAMERA_SRC(obj : Pointer) : PGstBaseCameraSrc;
function GST_BASE_CAMERA_SRC_CLASS(klass : Pointer) : PGstBaseCameraSrcClass;
function GST_IS_BASE_CAMERA_SRC(obj : Pointer) : Tgboolean;
function GST_IS_BASE_CAMERA_SRC_CLASS(klass : Pointer) : Tgboolean;
function GST_BASE_CAMERA_SRC_GET_CLASS(obj : Pointer) : PGstBaseCameraSrcClass;

implementation

function GST_TYPE_BASE_CAMERA_SRC : TGType;
  begin
    GST_TYPE_BASE_CAMERA_SRC:=gst_base_camera_src_get_type;
  end;

function GST_BASE_CAMERA_SRC(obj : Pointer) : PGstBaseCameraSrc;
begin
  Result := PGstBaseCameraSrc(g_type_check_instance_cast(obj, GST_TYPE_BASE_CAMERA_SRC));
end;

function GST_BASE_CAMERA_SRC_CLASS(klass : Pointer) : PGstBaseCameraSrcClass;
begin
  Result := PGstBaseCameraSrcClass(g_type_check_class_cast(klass, GST_TYPE_BASE_CAMERA_SRC));
end;

function GST_IS_BASE_CAMERA_SRC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_BASE_CAMERA_SRC);
end;

function GST_IS_BASE_CAMERA_SRC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_BASE_CAMERA_SRC);
end;

function GST_BASE_CAMERA_SRC_GET_CLASS(obj : Pointer) : PGstBaseCameraSrcClass;
begin
  Result := PGstBaseCameraSrcClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_BASE_CAMERA_SRC_CAST(obj : longint) : PGstBaseCameraSrc;
begin
  GST_BASE_CAMERA_SRC_CAST:=PGstBaseCameraSrc(obj);
end;


end.
