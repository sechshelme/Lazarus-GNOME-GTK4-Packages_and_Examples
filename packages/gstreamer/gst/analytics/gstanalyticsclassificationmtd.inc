
{$IFDEF read_interface}

type
  TGstAnalyticsClsMtd = TGstAnalyticsMtd;
  PGstAnalyticsClsMtd = ^TGstAnalyticsMtd;

function gst_analytics_cls_mtd_get_mtd_type: TGstAnalyticsMtdType; cdecl; external libgstanalytics;
function gst_analytics_cls_mtd_get_level(handle: PGstAnalyticsClsMtd; index: Tgsize): Tgfloat; cdecl; external libgstanalytics;
function gst_analytics_cls_mtd_get_index_by_quark(handle: PGstAnalyticsClsMtd; quark: TGQuark): Tgint; cdecl; external libgstanalytics;
function gst_analytics_cls_mtd_get_length(handle: PGstAnalyticsClsMtd): Tgsize; cdecl; external libgstanalytics;
function gst_analytics_cls_mtd_get_quark(handle: PGstAnalyticsClsMtd; index: Tgsize): TGQuark; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_cls_mtd(instance: PGstAnalyticsRelationMeta; length: Tgsize; confidence_levels: Pgfloat; class_quarks: PGQuark; cls_mtd: PGstAnalyticsClsMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_one_cls_mtd(instance: PGstAnalyticsRelationMeta; confidence_level: Tgfloat; class_quark: TGQuark; cls_mtd: PGstAnalyticsClsMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_cls_mtd(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; rlt: PGstAnalyticsClsMtd): Tgboolean; cdecl; external libgstanalytics;

// === Konventiert am: 1-10-24 19:26:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
