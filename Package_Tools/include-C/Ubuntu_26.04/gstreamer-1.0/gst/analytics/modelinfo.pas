unit modelinfo;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2025 Collabora Ltd.
 * @author: Olivier Crete <olivier.crete@collabora.com>
 *
 * modeinfo.c
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
{$include <glib.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{$include <gst/analytics/gsttensor.h>}
(** unsupported pragma#pragma once*)
{*
 * GST_MODELINFO_VERSION_MAJOR:
 *
 * The current major version of the modelinfo format
 *
 * Since: 1.28
  }

const
  GST_MODELINFO_VERSION_MAJOR = 1;  
{*
 * GST_MODELINFO_VERSION_MINOR:
 *
 * The current minor version of the modelinfo format
 *
 * Since: 1.28
  }
  GST_MODELINFO_VERSION_MINOR = 0;  
{*
 * GST_MODELINFO_VERSION_STR:
 *
 * The current version string for the modelinfo format.
 * This MUST be updated whenever the format changes.
 *
 * Since: 1.28
  }
  GST_MODELINFO_VERSION_STR = '1.0';  
{*
 * GST_MODELINFO_SECTION_NAME:
 *
 * The name of the modelinfo header section
 *
 * Since: 1.28
  }
  GST_MODELINFO_SECTION_NAME = 'modelinfo';  
{*
 * GstAnalyticsModelInfoTensorDirection:
 * @MODELINFO_DIRECTION_UNKNOWN: Tensor location is unknown
 * @MODELINFO_DIRECTION_INPUT: Input tensor
 * @MODELINFO_DIRECTION_OUTPUT: Output tensor
 *
 * Since: 1.28
  }
type
  PGstAnalyticsModelInfoTensorDirection = ^TGstAnalyticsModelInfoTensorDirection;
  TGstAnalyticsModelInfoTensorDirection =  Longint;
  Const
    MODELINFO_DIRECTION_UNKNOWN = 0;
    MODELINFO_DIRECTION_INPUT = 1;
    MODELINFO_DIRECTION_OUTPUT = 2;
;
{*
 * GstAnalyticsModelInfo:
 *
 * The #GstAnalyticsModelInfo is an object storing artifical neural network
 * model metadata describing the input and output tensors. These information's
 * are required by inference elements.
 *
 * Since: 1.28
  }
type
  TModelInfo = TGstAnalyticsModelInfo;

function gst_analytics_modelinfo_get_type:TGType;cdecl;external libgstanalytics;
{*
 * GST_ANALYTICS_MODELINFO_TYPE:
 *
 * The model info type
 *
 * Since: 1.28
  }
function gst_analytics_modelinfo_load(model_filename:Pgchar):PGstAnalyticsModelInfo;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_find_tensor_name(modelinfo:PGstAnalyticsModelInfo; dir:TGstAnalyticsModelInfoTensorDirection; index:Tgsize; in_tensor_name:Pgchar; data_type:TGstTensorDataType; 
           num_dims:Tgsize; dims:Pgsize):Pgchar;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_id(modelinfo:PGstAnalyticsModelInfo; tensor_name:Pgchar):Pgchar;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_group_id(modelinfo:PGstAnalyticsModelInfo):Pgchar;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_quark_id(modelinfo:PGstAnalyticsModelInfo; tensor_name:Pgchar):TGQuark;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_quark_group_id(modelinfo:PGstAnalyticsModelInfo):TGQuark;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_target_ranges(modelinfo:PGstAnalyticsModelInfo; tensor_name:Pgchar; num_ranges:Pgsize; mins:PPgdouble; maxs:PPgdouble):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_input_scales_offsets(modelinfo:PGstAnalyticsModelInfo; tensor_name:Pgchar; num_input_ranges:Tgsize; input_mins:Pgdouble; input_maxs:Pgdouble; 
           num_output_ranges:Pgsize; output_scales:PPgdouble; output_offsets:PPgdouble):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_dims_order(modelinfo:PGstAnalyticsModelInfo; tensor_name:Pgchar):TGstTensorDimOrder;cdecl;external libgstanalytics;
function gst_analytics_modelinfo_get_version(modelinfo:PGstAnalyticsModelInfo):Pgchar;cdecl;external libgstanalytics;
procedure gst_analytics_modelinfo_free(model_info:PGstAnalyticsModelInfo);cdecl;external libgstanalytics;

// === Konventiert am: 22-7-26 19:36:35 ===

function GST_ANALYTICS_MODELINFO_TYPE : TGType;

implementation

function GST_ANALYTICS_MODELINFO_TYPE : TGType;
  begin
    GST_ANALYTICS_MODELINFO_TYPE:=gst_analytics_modelinfo_get_type;
  end;



end.
