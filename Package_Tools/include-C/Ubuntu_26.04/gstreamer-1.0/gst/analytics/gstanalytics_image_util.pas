unit gstanalytics_image_util;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2025 Collabora Ltd
 *  @author: Daniel Morin <daniel.morin@dmohub.org>
 *
 * gstanalyticssegmentationmtd.h
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
{$ifndef __GST_ANALYTICS_IMAGE_UTIL_H__}
{$define __GST_ANALYTICS_IMAGE_UTIL_H__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}

function gst_analytics_image_util_iou_int(bb1_x:Tgint; bb1_y:Tgint; bb1_w:Tgint; bb1_h:Tgint; bb2_x:Tgint; 
           bb2_y:Tgint; bb2_w:Tgint; bb2_h:Tgint):Tgfloat;cdecl;external libgstanalytics;
function gst_analytics_image_util_iou_float(bb1_x:Tgfloat; bb1_y:Tgfloat; bb1_w:Tgfloat; bb1_h:Tgfloat; bb2_x:Tgfloat; 
           bb2_y:Tgfloat; bb2_w:Tgfloat; bb2_h:Tgfloat):Tgfloat;cdecl;external libgstanalytics;
{$endif}
{ __GST_ANALYTICS_IMAGE_UTIL_H__  }

// === Konventiert am: 22-7-26 19:37:18 ===


implementation



end.
