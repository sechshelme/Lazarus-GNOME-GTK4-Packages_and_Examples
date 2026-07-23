{$IFDEF read_interface}


type
  PGstAnalyticsSegmentationMtd = PGstAnalyticsMtd;

type
  PGstSegmentationType = ^TGstSegmentationType;
  TGstSegmentationType = longint;
const
  GST_SEGMENTATION_TYPE_SEMANTIC = 0;
  GST_SEGMENTATION_TYPE_INSTANCE = 1;

function gst_analytics_segmentation_mtd_get_mtd_type: TGstAnalyticsMtdType; cdecl; external libgstanalytics;
function gst_analytics_segmentation_mtd_get_mask(handle: PGstAnalyticsSegmentationMtd; masks_loc_x: Pgint; masks_loc_y: Pgint; masks_loc_w: Pguint; masks_loc_h: Pguint): PGstBuffer; cdecl; external libgstanalytics;
function gst_analytics_segmentation_mtd_get_region_index(handle: PGstAnalyticsSegmentationMtd; index: Pgsize; id: Tguint): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_segmentation_mtd_get_region_id(handle: PGstAnalyticsSegmentationMtd; index: Tgsize): Tguint; cdecl; external libgstanalytics;
function gst_analytics_segmentation_mtd_get_region_count(handle: PGstAnalyticsSegmentationMtd): Tgsize; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_segmentation_mtd(instance: PGstAnalyticsRelationMeta; buffer: PGstBuffer; segmentation_type: TGstSegmentationType; region_count: Tgsize; region_ids: Pguint;
  masks_loc_x: Tgint; masks_loc_y: Tgint; masks_loc_w: Tguint; masks_loc_h: Tguint; segmentation_mtd: PGstAnalyticsSegmentationMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_segmentation_mtd(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; rlt: PGstAnalyticsSegmentationMtd): Tgboolean; cdecl; external libgstanalytics;

// === Konventiert am: 22-7-26 19:36:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
