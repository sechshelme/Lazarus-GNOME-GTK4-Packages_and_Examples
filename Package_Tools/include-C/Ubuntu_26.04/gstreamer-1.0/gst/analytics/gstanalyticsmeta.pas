unit gstanalyticsmeta;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2023 Collabora Ltd
 *
 * gstanalyticsmeta.h
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
{$ifndef __GST_ANALYTICS_META_H__}
{$define __GST_ANALYTICS_META_H__}
{$include <gst/gst.h>}
{$include <gst/analytics/analytics-meta-prelude.h>}
{*
 * GST_INF_RELATION_SPAN:
 *
 * Passes to functions asking for a relation span when the span is
 * infinite.
 *
 * Since: 1.24
  }

const
  GST_INF_RELATION_SPAN = -(1);  
type
{*
 * GstAnalyticsMtdType:
 *
 * Type of analytics meta data
 *
 * Since: 1.24
  }

  PGstAnalyticsMtdType = ^TGstAnalyticsMtdType;
  TGstAnalyticsMtdType = Tguintptr;
{*
 * GST_ANALYTICS_MTD_TYPE_ANY:
 *
 * A wildcard matching any type of analysis
 *
 * Since: 1.24
  }

const
  GST_ANALYTICS_MTD_TYPE_ANY = 0;  
{*
 * GST_ANALYTICS_MTD_CAST: (skip)
 *
 * Since: 1.24
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_ANALYTICS_MTD_CAST(mtd : longint) : PGstAnalyticsMtd;

{*
 * GstAnalyticsRelationMeta:
 *
 * An opaque #GstMeta that can be used to hold various types of results
 * from analysis processes.
 *
 * The content should be accessed through the API.
 *
 * Since: 1.24
  }
type
{*
 * GstAnalyticsMtd:
 * @id: Instance identifier.
 * @meta: Instance of #GstAnalyticsRelationMeta where the analysis-metadata
 * identified by @id is stored.
 *
 * Handle containing data required to use gst_analytics_mtd API. This type
 * is generally expected to be allocated on the stack.
 *
 * Since: 1.24
  }
  PGstAnalyticsMtd = ^TGstAnalyticsMtd;
  TGstAnalyticsMtd = record
      id : Tguint;
      meta : PGstAnalyticsRelationMeta;
    end;

{*
 * GstAnalyticsMtdImpl:
 * @name: The name of the metadata type
 * @mtd_meta_transform: A pointer to a function that will be called
 * when the containing meta is transform to potentially copy the data
 * into a new Mtd into the new meta.
 * @mtd_meta_clear: A pointer to a function that will be called when the
 * containing meta is cleared to potetially do cleanup (ex. _unref or release)
 * resources it was using.
 *
 * This structure must be provided when registering a new type of Mtd. It must
 * have a static lifetime (never be freed).
 *
 * Since: 1.24
  }
{< private > }

  PGstAnalyticsMtdImpl = ^TGstAnalyticsMtdImpl;
  TGstAnalyticsMtdImpl = record
      name : Pchar;
      mtd_meta_transform : function (transbuf:PGstBuffer; transmtd:PGstAnalyticsMtd; buffer:PGstBuffer; _type:TGQuark; data:Tgpointer):Tgboolean;cdecl;
      mtd_meta_clear : procedure (buffer:PGstBuffer; mtd:PGstAnalyticsMtd);cdecl;
      _reserved : array[0..(GST_PADDING_LARGE-1)-1] of Tgpointer;
    end;

function gst_analytics_mtd_get_mtd_type(instance:PGstAnalyticsMtd):TGstAnalyticsMtdType;cdecl;external libgstanalytics;
function gst_analytics_mtd_get_id(instance:PGstAnalyticsMtd):Tguint;cdecl;external libgstanalytics;
function gst_analytics_mtd_get_size(instance:PGstAnalyticsMtd):Tgsize;cdecl;external libgstanalytics;
function gst_analytics_mtd_type_get_name(_type:TGstAnalyticsMtdType):Pgchar;cdecl;external libgstanalytics;
type
{*
 * GST_ANALYTICS_RELATION_META_API_TYPE:
 *
 * The Analyics Relation Meta API type
 *
 * Since: 1.24
  }

{ was #define dname def_expr }
function GST_ANALYTICS_RELATION_META_API_TYPE : longint; { return type might be wrong }

{*
 * GST_ANALYTICS_RELATION_META_INFO: (skip)
 *
 * Get the meta info
 *
 * Since: 1.24
  }
{ was #define dname def_expr }
function GST_ANALYTICS_RELATION_META_INFO : longint; { return type might be wrong }

{*
 * GstAnalyticsRelTypes:
 * @GST_ANALYTICS_REL_TYPE_NONE: No relation
 * @GST_ANALYTICS_REL_TYPE_IS_PART_OF: First analysis-meta is part of second analysis-meta
 * @GST_ANALYTICS_REL_TYPE_CONTAIN: First analysis-meta contain second analysis-meta.
 * @GST_ANALYTICS_REL_TYPE_RELATE_TO: First analysis-meta relate to second analysis-meta.
 * @GST_ANALYTICS_REL_TYPE_N_TO_N: Used to express relations between two groups
 *    where each group's components correspond to the respective component in the
 *    other group. Since: 1.26
 * @GST_ANALYTICS_REL_TYPE_ANY: Only use for criteria.
 *
 * Since: 1.24
  }
{*
   * GST_ANALYTICS_REL_TYPE_N_TO_N:
   *
   * Used to express relations between two groups where each group's components
   * correspond to the respective component in the other group.
   *
   * Since: 1.26
    }
type
  PGstAnalyticsRelTypes = ^TGstAnalyticsRelTypes;
  TGstAnalyticsRelTypes =  Longint;
  Const
    GST_ANALYTICS_REL_TYPE_NONE = 0;
    GST_ANALYTICS_REL_TYPE_IS_PART_OF = 1 shl 1;
    GST_ANALYTICS_REL_TYPE_CONTAIN = 1 shl 2;
    GST_ANALYTICS_REL_TYPE_RELATE_TO = 1 shl 3;
    GST_ANALYTICS_REL_TYPE_N_TO_N = 1 shl 4;
    GST_ANALYTICS_REL_TYPE_ANY = G_MAXINT;
;
{*
 * GstAnalyticsRelationMetaInitParams:
 * @initial_relation_order: Initial relations order.
 * @initial_buf_size: Buffer size in bytes to store relatable metadata
 *
 * GstAnalyticsRelationMeta initialization parameters.
 *
 * Since: 1.24
  }
type
  PGstAnalyticsRelationMetaInitParams = ^TGstAnalyticsRelationMetaInitParams;
  TGstAnalyticsRelationMetaInitParams = record
      initial_relation_order : Tgsize;
      initial_buf_size : Tgsize;
    end;


function gst_analytics_relation_meta_api_get_type:TGType;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_info:PGstMetaInfo;cdecl;external libgstanalytics;
function gst_analytics_relation_get_length(instance:PGstAnalyticsRelationMeta):Tgsize;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_relation(meta:PGstAnalyticsRelationMeta; an_meta_first_id:Tguint; an_meta_second_id:Tguint):TGstAnalyticsRelTypes;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_set_relation(meta:PGstAnalyticsRelationMeta; _type:TGstAnalyticsRelTypes; an_meta_first_id:Tguint; an_meta_second_id:Tguint):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_exist(rmeta:PGstAnalyticsRelationMeta; an_meta_first_id:Tguint; an_meta_second_id:Tguint; max_relation_span:Tgint; cond_types:TGstAnalyticsRelTypes; 
           relations_path:PPGArray):Tgboolean;cdecl;external libgstanalytics;
function gst_buffer_add_analytics_relation_meta(buffer:PGstBuffer):PGstAnalyticsRelationMeta;cdecl;external libgstanalytics;
function gst_buffer_add_analytics_relation_meta_full(buffer:PGstBuffer; init_params:PGstAnalyticsRelationMetaInitParams):PGstAnalyticsRelationMeta;cdecl;external libgstanalytics;
function gst_buffer_get_analytics_relation_meta(buffer:PGstBuffer):PGstAnalyticsRelationMeta;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_add_mtd(meta:PGstAnalyticsRelationMeta; impl:PGstAnalyticsMtdImpl; size:Tgsize; rlt_mtd:PGstAnalyticsMtd):Tgpointer;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; _type:TGstAnalyticsMtdType; rlt:PGstAnalyticsMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_mtd_data(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint):Tgpointer;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_iterate(meta:PGstAnalyticsRelationMeta; state:Pgpointer; _type:TGstAnalyticsMtdType; rlt_mtd:PGstAnalyticsMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_direct_related(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; relation_type:TGstAnalyticsRelTypes; _type:TGstAnalyticsMtdType; state:Pgpointer; 
           rlt_mtd:PGstAnalyticsMtd):Tgboolean;cdecl;external libgstanalytics;
{$endif}
{ __GST_ANALYTICS_META_H__ }

// === Konventiert am: 22-7-26 19:37:11 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ANALYTICS_MTD_CAST(mtd : longint) : PGstAnalyticsMtd;
begin
  GST_ANALYTICS_MTD_CAST:=PGstAnalyticsMtd(mtd);
end;

{ was #define dname def_expr }
function GST_ANALYTICS_RELATION_META_API_TYPE : longint; { return type might be wrong }
  begin
    GST_ANALYTICS_RELATION_META_API_TYPE:=gst_analytics_relation_meta_api_get_type;
  end;

{ was #define dname def_expr }
function GST_ANALYTICS_RELATION_META_INFO : longint; { return type might be wrong }
  begin
    GST_ANALYTICS_RELATION_META_INFO:=gst_analytics_relation_meta_get_info;
  end;


end.
