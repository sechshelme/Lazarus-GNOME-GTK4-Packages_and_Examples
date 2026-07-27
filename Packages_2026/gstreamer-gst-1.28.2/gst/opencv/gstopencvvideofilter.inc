{$IFDEF read_interface}


{
 * GStreamer
 * Copyright (C) 2010 Thiago Santos <thiago.sousa.santos@collabora.co.uk>
 * Copyright (C) 2018 Nicola Murino <nicola.murino@gmail.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Alternatively, the contents of this file may be used under the
 * GNU Lesser General Public License Version 2.1 (the "LGPL"), in
 * which case the following provisions apply instead of the ones
 * mentioned above:
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
{$ifndef __GST_OPENCV_VIDEO_FILTER_H__}
{$define __GST_OPENCV_VIDEO_FILTER_H__}
{$include <gst/gst.h>}
{$include <gst/video/gstvideofilter.h>}
{$include <gst/opencv/opencv-prelude.h>}
{$include <opencv2/core.hpp>}
{ forward declare opencv type to avoid exposing them in this API  }
{typedef struct _IplImage IplImage; }
{ #defines don't like whitespacey bits  }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OPENCV_VIDEO_FILTER_CAST(obj : longint) : PGstOpencvVideoFilter;

type

  TGstOpencvVideoFilterTransformIPFunc = function (transform:PGstOpencvVideoFilter; buffer:PGstBuffer; img:pointer):TGstFlowReturn;cdecl;

  TGstOpencvVideoFilterTransformFunc = function (transform:PGstOpencvVideoFilter; buffer:PGstBuffer; img:pointer; outbuf:PGstBuffer; outimg:pointer):TGstFlowReturn;cdecl;

  TGstOpencvVideoFilterSetCaps = function (transform:PGstOpencvVideoFilter; in_width:Tgint; in_height:Tgint; in_cv_type:longint; out_width:Tgint; 
               out_height:Tgint; out_cv_type:longint):Tgboolean;cdecl;
  PGstOpencvVideoFilter = ^TGstOpencvVideoFilter;
  TGstOpencvVideoFilter = record
      trans : TGstVideoFilter;cdecl;
      in_place : Tgboolean;
      cvImage : pointer;
      out_cvImage : pointer;
    end;

  PGstOpencvVideoFilterClass = ^TGstOpencvVideoFilterClass;
  TGstOpencvVideoFilterClass = record
      parent_class : TGstVideoFilterClass;
      cv_trans_func : TGstOpencvVideoFilterTransformFunc;
      cv_trans_ip_func : TGstOpencvVideoFilterTransformIPFunc;
      cv_set_caps : TGstOpencvVideoFilterSetCaps;
    end;


function gst_opencv_video_filter_get_type:TGType;cdecl;external libgstopencv;
procedure gst_opencv_video_filter_set_in_place(transform:PGstOpencvVideoFilter; ip:Tgboolean);cdecl;external libgstopencv;
{$endif}
{ __GST_OPENCV_VIDEO_FILTER_H__  }

// === Konventiert am: 27-7-26 13:22:44 ===

function GST_TYPE_OPENCV_VIDEO_FILTER : TGType;
function GST_OPENCV_VIDEO_FILTER(obj : Pointer) : PGstOpencvVideoFilter;
function GST_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : PGstOpencvVideoFilterClass;
function GST_IS_OPENCV_VIDEO_FILTER(obj : Pointer) : Tgboolean;
function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : Tgboolean;
function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : Pointer) : PGstOpencvVideoFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_OPENCV_VIDEO_FILTER : TGType;
  begin
    GST_TYPE_OPENCV_VIDEO_FILTER:=gst_opencv_video_filter_get_type;
  end;

function GST_OPENCV_VIDEO_FILTER(obj : Pointer) : PGstOpencvVideoFilter;
begin
  Result := PGstOpencvVideoFilter(g_type_check_instance_cast(obj, GST_TYPE_OPENCV_VIDEO_FILTER));
end;

function GST_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : PGstOpencvVideoFilterClass;
begin
  Result := PGstOpencvVideoFilterClass(g_type_check_class_cast(klass, GST_TYPE_OPENCV_VIDEO_FILTER));
end;

function GST_IS_OPENCV_VIDEO_FILTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_OPENCV_VIDEO_FILTER);
end;

function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_OPENCV_VIDEO_FILTER);
end;

function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : Pointer) : PGstOpencvVideoFilterClass;
begin
  Result := PGstOpencvVideoFilterClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_OPENCV_VIDEO_FILTER_CAST(obj : longint) : PGstOpencvVideoFilter;
begin
  GST_OPENCV_VIDEO_FILTER_CAST:=PGstOpencvVideoFilter(obj);
end;


{$ENDIF read_implementation}
