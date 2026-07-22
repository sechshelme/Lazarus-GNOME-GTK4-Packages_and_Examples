
unit gstanalyticstensormtd;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstanalyticstensormtd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstanalyticstensormtd.h
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
Pgsize  = ^gsize;
PGstAnalyticsRelationMeta  = ^GstAnalyticsRelationMeta;
PGstAnalyticsTensorMtd  = ^GstAnalyticsTensorMtd;
PGstBuffer  = ^GstBuffer;
PGstTensor  = ^GstTensor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2024 Collabora Ltd
 *  @author: Daniel Morin <daniel.morin@collabora.com>
 *
 * gstanalyticstensormtd.h
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
{$ifndef __GST_ANALYTICS_TENSOR_MTD_H__}
{$define __GST_ANALYTICS_TENSOR_MTD_H__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gstanalyticsmeta.h>}
{$include <gst/analytics/gsttensor.h>}
{*
 * GstAnalyticsTensorMtd:
 * @id: Instance identifier
 * @meta: Instance of #GstAnalyticsRelationMeta where the analytics-metadata
 * identified by @id is stored
 *
 * Handle containing data required to use gst_analytics_tensor_mtd APIs.
 * This type is generally expected to be allocated on stack.
 *
 * Since: 1.28
  }
type
  TGstAnalyticsMtd = TGstAnalyticsTensorMtd;

function gst_analytics_tensor_mtd_get_mtd_type:TGstAnalyticsMtdType;cdecl;external;
(* Const before type ignored *)
function gst_analytics_tensor_mtd_get_tensor(instance:PGstAnalyticsTensorMtd):PGstTensor;cdecl;external;
function gst_analytics_relation_meta_add_tensor_mtd(instance:PGstAnalyticsRelationMeta; num_dims:Tgsize; tensor_mtd:PGstAnalyticsTensorMtd):Tgboolean;cdecl;external;
function gst_analytics_relation_meta_add_tensor_mtd_simple(instance:PGstAnalyticsRelationMeta; id:TGQuark; data_type:TGstTensorDataType; data:PGstBuffer; dims_order:TGstTensorDimOrder; 
           num_dims:Tgsize; dims:Pgsize; tensor_mtd:PGstAnalyticsTensorMtd):Tgboolean;cdecl;external;
function gst_analytics_relation_meta_get_tensor_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; rlt:PGstAnalyticsTensorMtd):Tgboolean;cdecl;external;
{$endif}
{ __GST_ANALYTICS_TENSOR_MTD_H__  }

implementation


end.
