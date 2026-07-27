unit gstopencvutils;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2010> Thiago Santos <thiago.sousa.santos@collabora.co.uk>
 * Copyright (C) <2018> Nicola Murino <nicola.murino@gmail.com> 
 *
 * gstopencvutils.h: miscellaneous utility functions
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
{$ifndef __GST_OPENCV_UTILS__}
{$define __GST_OPENCV_UTILS__}
{$ifdef HAVE_CONFIG_H}
{$include "config.h"}
{$endif}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/opencv/opencv-prelude.h>}

function gst_opencv_parse_cv_mat_params_from_caps(caps:PGstCaps; width:Pgint; height:Pgint; cv_type:Plongint; err:PPGError):Tgboolean;cdecl;external libgstopencv;
function gst_opencv_cv_mat_params_from_video_info(info:PGstVideoInfo; width:Pgint; height:Pgint; cv_type:Plongint; err:PPGError):Tgboolean;cdecl;external libgstopencv;
function gst_opencv_cv_image_type_from_video_format(format:TGstVideoFormat; cv_type:Plongint; err:PPGError):Tgboolean;cdecl;external libgstopencv;
function gst_opencv_caps_from_cv_image_type(cv_type:longint):PGstCaps;cdecl;external libgstopencv;
{$endif}
{ __GST_OPENCV_UTILS__  }

// === Konventiert am: 27-7-26 13:22:37 ===


implementation



end.
