/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 02-10-2024   16:26                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAnalyticsODMtd = TGstAnalyticsMtd;
  PGstAnalyticsODMtd = ^TGstAnalyticsMtd;

function gst_analytics_od_mtd_get_mtd_type: TGstAnalyticsMtdType; cdecl; external libgstanalytics;
function gst_analytics_od_mtd_get_location(instance: PGstAnalyticsODMtd; x: Pgint; y: Pgint; w: Pgint; h: Pgint;
  loc_conf_lvl: Pgfloat): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_od_mtd_get_confidence_lvl(instance: PGstAnalyticsODMtd; loc_conf_lvl: Pgfloat): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_od_mtd_get_obj_type(handle: PGstAnalyticsODMtd): TGQuark; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_add_od_mtd(instance: PGstAnalyticsRelationMeta; _type: TGQuark; x: Tgint; y: Tgint; w: Tgint;
  h: Tgint; loc_conf_lvl: Tgfloat; od_mtd: PGstAnalyticsODMtd): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_relation_meta_get_od_mtd(meta: PGstAnalyticsRelationMeta; an_meta_id: Tguint; rlt: PGstAnalyticsODMtd): Tgboolean; cdecl; external libgstanalytics;

{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
