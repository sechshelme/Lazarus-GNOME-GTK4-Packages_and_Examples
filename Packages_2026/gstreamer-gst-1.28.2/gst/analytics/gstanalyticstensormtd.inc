{$IFDEF read_interface}


type
  PGstAnalyticsTensorMtd = PGstAnalyticsMtd;

function gst_analytics_tensor_mtd_get_mtd_type: TGstAnalyticsMtdType; cdecl; external libgstanalytics;
function gst_analytics_tensor_mtd_get_tensor(instance: PGstAnalyticsTensorMtd): PGstTensor; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_tensor_mtd(instance: PGstAnalyticsRelationMeta; num_dims: Tgsize; tensor_mtd: PGstAnalyticsTensorMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_tensor_mtd_simple(instance: PGstAnalyticsRelationMeta; id: TGQuark; data_type: TGstTensorDataType; data: PGstBuffer; dims_order: TGstTensorDimOrder;
  num_dims: Tgsize; dims: Pgsize; tensor_mtd: PGstAnalyticsTensorMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_tensor_mtd(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; rlt: PGstAnalyticsTensorMtd): Tgboolean; cdecl; external libgstanalytics;

// === Konventiert am: 22-7-26 19:36:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
