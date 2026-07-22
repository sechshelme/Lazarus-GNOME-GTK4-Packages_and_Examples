unit gstanalyticsobjecttrackingmtd;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2023 Collabora Ltd
 *
 * gstobjecttrackingmtd.h
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
{$ifdef HAVE_CONFIG_H}
{$include "config.h"}
{$endif}
{$ifndef __GST_ANALYTICS_OBJECT_TRACKING_MTD__}
{$define __GST_ANALYTICS_OBJECT_TRACKING_MTD__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gstanalyticsmeta.h>}
{*
 * GstAnalyticsTrackMtd:
 * @id: Instance identifier.
 * @meta: Instance of #GstAnalyticsRelationMeta where the analysis-metadata
 * identified by @id is stored.
 *
 * Handle containing data required to use gst_analytics_track_mtd APIs.
 * This type is generally expected to be allocated on the stack.
 *
 * Since: 1.24
  }
type
  TGstAnalyticsMtd = TGstAnalyticsTrackingMtd;

function gst_analytics_tracking_mtd_get_mtd_type:TGstAnalyticsMtdType;cdecl;external libgstanalytics;
function gst_analytics_tracking_mtd_update_last_seen(instance:PGstAnalyticsTrackingMtd; last_seen:TGstClockTime):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_tracking_mtd_set_lost(instance:PGstAnalyticsTrackingMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_tracking_mtd_get_info(instance:PGstAnalyticsTrackingMtd; tracking_id:Pguint64; tracking_first_seen:PGstClockTime; tracking_last_seen:PGstClockTime; tracking_lost:Pgboolean):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_add_tracking_mtd(instance:PGstAnalyticsRelationMeta; tracking_id:Tguint64; tracking_first_seen:TGstClockTime; trk_mtd:PGstAnalyticsTrackingMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_tracking_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; rlt:PGstAnalyticsTrackingMtd):Tgboolean;cdecl;external libgstanalytics;
{$endif}
{ __GST_ANALYTICS_OBJECT_TRACKING_MTD__ }

// === Konventiert am: 22-7-26 19:37:02 ===


implementation



end.
