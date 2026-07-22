
unit gstanalyticsclassificationmtd;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstanalyticsclassificationmtd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstanalyticsclassificationmtd.h
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
PGQuark  = ^GQuark;
PGstAnalyticsClsMtd  = ^GstAnalyticsClsMtd;
PGstAnalyticsRelationMeta  = ^GstAnalyticsRelationMeta;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2023 Collabora Ltd
 *
 * gstanalyticsclassificationmtd.h
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
{$ifndef __GST_ANALYTICS_CLASSIFICATION_H__}
{$define __GST_ANALYTICS_CLASSIFICATION_H__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gstanalyticsmeta.h>}
{*
 * GstAnalyticsClsMtd:
 * @id: Instance identifier.
 * @meta: Instance of #GstAnalyticsRelationMeta where the analysis-metadata
 * identified by @id is stored.
 *
 * Handle containing data required to use gst_analytics_cls_mtd APIs. This type
 * is generally expected to be allocated on the stack.
 *
 * Since: 1.24
  }
type
  TGstAnalyticsMtd = TGstAnalyticsClsMtd;

function gst_analytics_cls_mtd_get_mtd_type:TGstAnalyticsMtdType;cdecl;external;
(* Const before type ignored *)
function gst_analytics_cls_mtd_get_level(handle:PGstAnalyticsClsMtd; index:Tgsize):Tgfloat;cdecl;external;
(* Const before type ignored *)
function gst_analytics_cls_mtd_get_index_by_quark(handle:PGstAnalyticsClsMtd; quark:TGQuark):Tgint;cdecl;external;
(* Const before type ignored *)
function gst_analytics_cls_mtd_get_length(handle:PGstAnalyticsClsMtd):Tgsize;cdecl;external;
(* Const before type ignored *)
function gst_analytics_cls_mtd_get_quark(handle:PGstAnalyticsClsMtd; index:Tgsize):TGQuark;cdecl;external;
function gst_analytics_relation_meta_add_cls_mtd(instance:PGstAnalyticsRelationMeta; length:Tgsize; confidence_levels:Pgfloat; class_quarks:PGQuark; cls_mtd:PGstAnalyticsClsMtd):Tgboolean;cdecl;external;
function gst_analytics_relation_meta_add_one_cls_mtd(instance:PGstAnalyticsRelationMeta; confidence_level:Tgfloat; class_quark:TGQuark; cls_mtd:PGstAnalyticsClsMtd):Tgboolean;cdecl;external;
function gst_analytics_relation_meta_get_cls_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; rlt:PGstAnalyticsClsMtd):Tgboolean;cdecl;external;
{$endif}
{ __GST_ANALYTICS_CLASSIFICATION_H__ }

implementation


end.
