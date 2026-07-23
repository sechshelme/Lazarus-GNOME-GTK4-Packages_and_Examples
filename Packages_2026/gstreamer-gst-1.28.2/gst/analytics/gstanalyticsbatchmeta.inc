{$IFDEF read_interface}


type
  PGstAnalyticsBatchStream = ^TGstAnalyticsBatchStream;
  TGstAnalyticsBatchStream = record
    index: Tguint;
    sticky_events: ^PGstEvent;
    n_sticky_events: Tgsize;
    objects: ^PGstMiniObject;
    n_objects: Tgsize;
    padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstAnalyticsBatchMeta = ^TGstAnalyticsBatchMeta;
  TGstAnalyticsBatchMeta = record
    meta: TGstMeta;
    streams: PGstAnalyticsBatchStream;
    n_streams: Tgsize;
  end;

const
  GST_CAPS_FEATURE_META_GST_ANALYTICS_BATCH_META = 'meta:GstAnalyticsBatchMeta';

function gst_analytics_batch_meta_api_get_type: TGType; cdecl; external libgstanalytics;
function gst_analytics_batch_meta_get_info: PGstMetaInfo; cdecl; external libgstanalytics;
function gst_buffer_add_analytics_batch_meta(buffer: PGstBuffer): PGstAnalyticsBatchMeta; cdecl; external libgstanalytics;
function gst_buffer_get_analytics_batch_meta(buffer: PGstBuffer): PGstAnalyticsBatchMeta; cdecl; external libgstanalytics;
function gst_analytics_batch_stream_get_stream_id(stream: PGstAnalyticsBatchStream): Pgchar; cdecl; external libgstanalytics;
function gst_analytics_batch_stream_get_caps(stream: PGstAnalyticsBatchStream): PGstCaps; cdecl; external libgstanalytics;
function gst_analytics_batch_stream_get_segment(stream: PGstAnalyticsBatchStream): PGstSegment; cdecl; external libgstanalytics;

// === Konventiert am: 22-7-26 19:37:28 ===

function GST_ANALYTICS_BATCH_META_API_TYPE: TGType;
function GST_ANALYTICS_BATCH_META_INFO: PGstMetaInfo;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_ANALYTICS_BATCH_META_API_TYPE: TGType;
begin
  GST_ANALYTICS_BATCH_META_API_TYPE := gst_analytics_batch_meta_api_get_type;
end;

function GST_ANALYTICS_BATCH_META_INFO: PGstMetaInfo;
begin
  GST_ANALYTICS_BATCH_META_INFO := gst_analytics_batch_meta_get_info;
end;

{$ENDIF read_implementation}
