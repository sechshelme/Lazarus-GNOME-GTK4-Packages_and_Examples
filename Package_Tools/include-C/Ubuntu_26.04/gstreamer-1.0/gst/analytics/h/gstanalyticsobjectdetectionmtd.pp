
unit gstanalyticsobjectdetectionmtd;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstanalyticsobjectdetectionmtd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstanalyticsobjectdetectionmtd.h
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
Pgfloat  = ^gfloat;
Pgint  = ^gint;
PGstAnalyticsODMtd  = ^GstAnalyticsODMtd;
PGstAnalyticsRelationMeta  = ^GstAnalyticsRelationMeta;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
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
  }
{$ifdef HAVE_CONFIG_H}
{$include "config.h"}
{$endif}
{$ifndef __GST_ANALYTICS_OBJECT_DETECTION_MTD__}
{$define __GST_ANALYTICS_OBJECT_DETECTION_MTD__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gstanalyticsmeta.h>}
{*
 * GstAnalyticsODMtd:
 * @id: Instance identifier.
 * @meta: Instance of #GstAnalyticsRelationMeta where the analysis-metadata
 * identified by @id is stored.
 *
 * Handle containing data required to use gst_analytics_od_mtd APIs. This type
 * is generally expected to be allocated on the stack.
 *
 * Since: 1.24
  }
type
  TGstAnalyticsMtd = TGstAnalyticsODMtd;

function gst_analytics_od_mtd_get_mtd_type:TGstAnalyticsMtdType;cdecl;external;
(* Const before type ignored *)
function gst_analytics_od_mtd_get_location(instance:PGstAnalyticsODMtd; x:Pgint; y:Pgint; w:Pgint; h:Pgint; 
           loc_conf_lvl:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_analytics_od_mtd_get_oriented_location(instance:PGstAnalyticsODMtd; x:Pgint; y:Pgint; w:Pgint; h:Pgint; 
           r:Pgfloat; loc_conf_lvl:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_analytics_od_mtd_get_confidence_lvl(instance:PGstAnalyticsODMtd; loc_conf_lvl:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_analytics_od_mtd_get_obj_type(handle:PGstAnalyticsODMtd):TGQuark;cdecl;external;
function gst_analytics_relation_meta_add_od_mtd(instance:PGstAnalyticsRelationMeta; _type:TGQuark; x:Tgint; y:Tgint; w:Tgint; 
           h:Tgint; loc_conf_lvl:Tgfloat; od_mtd:PGstAnalyticsODMtd):Tgboolean;cdecl;external;
function gst_analytics_relation_meta_add_oriented_od_mtd(instance:PGstAnalyticsRelationMeta; _type:TGQuark; x:Tgint; y:Tgint; w:Tgint; 
           h:Tgint; r:Tgfloat; loc_conf_lvl:Tgfloat; od_mtd:PGstAnalyticsODMtd):Tgboolean;cdecl;external;
function gst_analytics_relation_meta_get_od_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; rlt:PGstAnalyticsODMtd):Tgboolean;cdecl;external;
{$endif}
{ __GST_ANALYTICS_OBJECT_DETECTION_MTD__ }

implementation


end.
