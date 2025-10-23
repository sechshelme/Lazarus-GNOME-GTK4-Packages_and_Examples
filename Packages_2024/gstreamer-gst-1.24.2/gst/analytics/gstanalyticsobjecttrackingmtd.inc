
{$IFDEF read_interface}

type
  TGstAnalyticsTrackingMtd = TGstAnalyticsMtd;
  PGstAnalyticsTrackingMtd = ^TGstAnalyticsMtd;

function gst_analytics_tracking_mtd_get_mtd_type:TGstAnalyticsMtdType;cdecl;external libgstanalytics;
function gst_analytics_tracking_mtd_update_last_seen(instance:PGstAnalyticsTrackingMtd; last_seen:TGstClockTime):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_tracking_mtd_set_lost(instance:PGstAnalyticsTrackingMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_tracking_mtd_get_info(instance:PGstAnalyticsTrackingMtd; tracking_id:Pguint64; tracking_first_seen:PGstClockTime; tracking_last_seen:PGstClockTime; tracking_lost:Pgboolean):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_add_tracking_mtd(instance:PGstAnalyticsRelationMeta; tracking_id:Tguint64; tracking_first_seen:TGstClockTime; trk_mtd:PGstAnalyticsTrackingMtd):Tgboolean;cdecl;external libgstanalytics;
function gst_analytics_relation_meta_get_tracking_mtd(meta:PGstAnalyticsRelationMeta; an_meta_id:Tguint; rlt:PGstAnalyticsTrackingMtd):Tgboolean;cdecl;external libgstanalytics;

// === Konventiert am: 1-10-24 19:26:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
