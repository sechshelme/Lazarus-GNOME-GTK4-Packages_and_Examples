
{$IFDEF read_interface}

const
  GST_INF_RELATION_SPAN = -(1);

type
  PGstAnalyticsMtdType = ^TGstAnalyticsMtdType;
  TGstAnalyticsMtdType = Tguintptr;

const
  GST_ANALYTICS_MTD_TYPE_ANY = 0;

type
  TGstAnalyticsRelationMeta = record
  end;
  PGstAnalyticsRelationMeta = ^TGstAnalyticsRelationMeta;

  TGstAnalyticsMtd = record
    id: Tguint;
    meta: PGstAnalyticsRelationMeta;
  end;
  PGstAnalyticsMtd = ^TGstAnalyticsMtd;

  TGstAnalyticsMtdImpl = record
    Name: pchar;
    mtd_meta_transform: function(transbuf: PGstBuffer; transmtd: PGstAnalyticsMtd; buffer: PGstBuffer; _type: TGQuark; Data: Tgpointer): Tgboolean; cdecl;
    _reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstAnalyticsMtdImpl = ^TGstAnalyticsMtdImpl;

function gst_analytics_mtd_get_mtd_type(instance: PGstAnalyticsMtd): TGstAnalyticsMtdType; cdecl; external libgstanalytics;
function gst_analytics_mtd_get_id(instance: PGstAnalyticsMtd): Tguint; cdecl; external libgstanalytics;
function gst_analytics_mtd_get_size(instance: PGstAnalyticsMtd): Tgsize; cdecl; external libgstanalytics;
function gst_analytics_mtd_type_get_name(_type: TGstAnalyticsMtdType): Pgchar; cdecl; external libgstanalytics;

type
  PGstAnalyticsRelTypes = ^TGstAnalyticsRelTypes;
  TGstAnalyticsRelTypes = longint;

const
  GST_ANALYTICS_REL_TYPE_NONE = 0;
  GST_ANALYTICS_REL_TYPE_IS_PART_OF = 1 shl 1;
  GST_ANALYTICS_REL_TYPE_CONTAIN = 1 shl 2;
  GST_ANALYTICS_REL_TYPE_RELATE_TO = 1 shl 3;
  GST_ANALYTICS_REL_TYPE_LAST = 1 shl 4;
  GST_ANALYTICS_REL_TYPE_ANY = G_MAXINT;

type
  TGstAnalyticsRelationMetaInitParams = record
    initial_relation_order: Tgsize;
    initial_buf_size: Tgsize;
  end;
  PGstAnalyticsRelationMetaInitParams = ^TGstAnalyticsRelationMetaInitParams;

function gst_analytics_relation_meta_api_get_type: TGType; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_info: PGstMetaInfo; cdecl; external libgstanalytics;
function gst_analytics_relation_get_length(instance: PGstAnalyticsRelationMeta): Tgsize; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_relation(meta: PGstAnalyticsRelationMeta; an_meta_first_id: Tguint; an_meta_second_id: Tguint): TGstAnalyticsRelTypes; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_set_relation(meta: PGstAnalyticsRelationMeta; _type: TGstAnalyticsRelTypes; an_meta_first_id: Tguint; an_meta_second_id: Tguint): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_exist(rmeta: PGstAnalyticsRelationMeta; an_meta_first_id: Tguint; an_meta_second_id: Tguint; max_relation_span: Tgint; cond_types: TGstAnalyticsRelTypes;
  relations_path: PPGArray): Tgboolean; cdecl; external libgstanalytics;
function gst_buffer_add_analytics_relation_meta(buffer: PGstBuffer): PGstAnalyticsRelationMeta; cdecl; external libgstanalytics;
function gst_buffer_add_analytics_relation_meta_full(buffer: PGstBuffer; init_params: PGstAnalyticsRelationMetaInitParams): PGstAnalyticsRelationMeta; cdecl; external libgstanalytics;
function gst_buffer_get_analytics_relation_meta(buffer: PGstBuffer): PGstAnalyticsRelationMeta; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_mtd(meta: PGstAnalyticsRelationMeta; impl: PGstAnalyticsMtdImpl; size: Tgsize; rlt_mtd: PGstAnalyticsMtd): Tgpointer; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_mtd(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; _type: TGstAnalyticsMtdType; rlt: PGstAnalyticsMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_mtd_data(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint): Tgpointer; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_iterate(meta: PGstAnalyticsRelationMeta; state: Pgpointer; _type: TGstAnalyticsMtdType; rlt_mtd: PGstAnalyticsMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_direct_related(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; relation_type: TGstAnalyticsRelTypes; _type: TGstAnalyticsMtdType; state: Pgpointer;
  rlt_mtd: PGstAnalyticsMtd): Tgboolean; cdecl; external libgstanalytics;

function GST_ANALYTICS_MTD_CAST(mtd: longint): PGstAnalyticsMtd;
function GST_ANALYTICS_RELATION_META_API_TYPE: TGType;
function GST_ANALYTICS_RELATION_META_INFO: PGstMetaInfo;

// === Konventiert am: 1-10-24 19:26:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_ANALYTICS_MTD_CAST(mtd: longint): PGstAnalyticsMtd;
begin
  GST_ANALYTICS_MTD_CAST := PGstAnalyticsMtd(mtd);
end;

function GST_ANALYTICS_RELATION_META_API_TYPE: TGType;
begin
  GST_ANALYTICS_RELATION_META_API_TYPE := gst_analytics_relation_meta_api_get_type;
end;

function GST_ANALYTICS_RELATION_META_INFO: PGstMetaInfo;
begin
  GST_ANALYTICS_RELATION_META_INFO := gst_analytics_relation_meta_get_info;
end;


{$ENDIF read_implementation}
