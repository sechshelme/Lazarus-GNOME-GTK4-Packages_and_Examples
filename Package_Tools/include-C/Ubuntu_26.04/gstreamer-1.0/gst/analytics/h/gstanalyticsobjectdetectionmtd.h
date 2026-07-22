/* GStreamer
 * Copyright (C) 2023 Collabora Ltd
 * Copyright (C) 2024 Intel Corporation
 *
 * gstanalyticsobjectdetectionmtd.h
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
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#ifndef __GST_ANALYTICS_OBJECT_DETECTION_MTD__
#define __GST_ANALYTICS_OBJECT_DETECTION_MTD__

#include <gst/gst.h>
#include <gst/analytics/analytics-meta-prelude.h>
#include <gst/analytics/gstanalyticsmeta.h>


/**
 * GstAnalyticsODMtd:
 * @id: Instance identifier.
 * @meta: Instance of #GstAnalyticsRelationMeta where the analysis-metadata
 * identified by @id is stored.
 *
 * Handle containing data required to use gst_analytics_od_mtd APIs. This type
 * is generally expected to be allocated on the stack.
 *
 * Since: 1.24
 */
typedef struct _GstAnalyticsMtd GstAnalyticsODMtd;

extern
GstAnalyticsMtdType gst_analytics_od_mtd_get_mtd_type (void);

extern
gboolean gst_analytics_od_mtd_get_location (const GstAnalyticsODMtd *
    instance, gint * x, gint * y, gint * w, gint * h, gfloat * loc_conf_lvl);

extern
gboolean gst_analytics_od_mtd_get_oriented_location (const GstAnalyticsODMtd
    * instance, gint * x, gint * y, gint * w, gint * h, gfloat * r,
    gfloat * loc_conf_lvl);

extern
gboolean gst_analytics_od_mtd_get_confidence_lvl (const GstAnalyticsODMtd *
    instance, gfloat * loc_conf_lvl);

extern
GQuark gst_analytics_od_mtd_get_obj_type (const GstAnalyticsODMtd * handle);

extern
gboolean gst_analytics_relation_meta_add_od_mtd (GstAnalyticsRelationMeta *
    instance, GQuark type, gint x, gint y, gint w, gint h, gfloat loc_conf_lvl,
    GstAnalyticsODMtd * od_mtd);

extern
gboolean
gst_analytics_relation_meta_add_oriented_od_mtd (GstAnalyticsRelationMeta *
    instance, GQuark type, gint x, gint y, gint w, gint h, gfloat r,
    gfloat loc_conf_lvl, GstAnalyticsODMtd * od_mtd);

extern
gboolean
gst_analytics_relation_meta_get_od_mtd (GstAnalyticsRelationMeta * meta,
    guint an_meta_id, GstAnalyticsODMtd * rlt);



#endif // __GST_ANALYTICS_OBJECT_DETECTION_MTD__
