unit gstanalyticssegmentationmtd;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2024 Collabora Ltd
 *  @author: Daniel Morin <daniel.morin@collabora.com>
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
{$ifndef __GST_ANALYTICS_SEGMENTATION_META_H__}
{$define __GST_ANALYTICS_SEGMENTATION_META_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-info.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gstanalyticsmeta.h>}
{*
 * GstAnalyticsSegmentationMtd:
 * @id: Instance identifier
 * @meta: Instance of #GstAnalyticsRelationMeta where the analytics-metadata
 * identified by @id is stored.
 *
 * Handle containing data required to use gst_analytics_segmentation_mtd APIs.
 * This type is generally expected to be allocated on the stack.
 *
 * Since: 1.26
  }
type
  TGstAnalyticsMtd = TGstAnalyticsSegmentationMtd;
{*
 * GstSegmentationType:
 * @GST_SEGMENTATION_TYPE_SEMANTIC: Segmentation where the belonging of each
 * pixel to a class of objects is identified.
 * @GST_SEGMENTATION_TYPE_INSTANCE: Segmentation where the belonging of each
 * pixel to instance of an object is identified.
 *
 * Enum value describing supported segmentation type
 *
 * Since: 1.26
  }

  PGstSegmentationType = ^TGstSegmentationType;
  TGstSegmentationType =  Longint;
  Const
    GST_SEGMENTATION_TYPE_SEMANTIC = 0;
    GST_SEGMENTATION_TYPE_INSTANCE = 1;
;

function gst_analytics_segmentation_mtd_get_mtd_type:TGstAnalyticsMtdType;cdecl;external libgstanalytics;
function gst_analytics_segmentation_mtd_get_mask(handle:PGstAnalyticsSegmentationMtd; masks_loc_x:Pgint; masks_loc_y:Pgint; masks_loc_w:Pguint; masks_loc_h:Pguint):PGstBuffer;cdecl;external libgstanalytics;
function gst_analytics_segmentation_mtd_get_region_index(handle:PGstAnalyticsSegmentationMtd; index:Pgsize; id:Tguint):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_segmentation_mtd_get_region_id(handle:PGstAnalyticsSegmentationMtd; index:Tgsize):Tguint;cdecl;external libgstanalytics;
function gst_analytics_segmentation_mtd_get_region_count(handle:PGstAnalyticsSegmentationMtd):Tgsize;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_add_segmentation_mtd(instance:PGstAnalyticsRelationMeta; buffer:PGstBuffer; segmentation_type:TGstSegmentationType; region_count:Tgsize; region_ids:Pguint; 
           masks_loc_x:Tgint; masks_loc_y:Tgint; masks_loc_w:Tguint; masks_loc_h:Tguint; segmentation_mtd:PGstAnalyticsSegmentationMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_segmentation_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; rlt:PGstAnalyticsSegmentationMtd):Tgboolean;cdecl;external libgstanalytics;
{$endif}
{ __GST_ANALYTICS_SEGMENTATION_META_H__ }

// === Konventiert am: 22-7-26 19:36:59 ===


implementation



end.
