/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsSectionATSCTableID = ^TGstMpegtsSectionATSCTableID;
  TGstMpegtsSectionATSCTableID = longint;

const
  GST_MTS_TABLE_ID_ATSC_MASTER_GUIDE = $C7;
  GST_MTS_TABLE_ID_ATSC_TERRESTRIAL_VIRTUAL_CHANNEL = $C8;
  GST_MTS_TABLE_ID_ATSC_CABLE_VIRTUAL_CHANNEL = $C9;
  GST_MTS_TABLE_ID_ATSC_RATING_REGION = $CA;
  GST_MTS_TABLE_ID_ATSC_EVENT_INFORMATION = $CB;
  GST_MTS_TABLE_ID_ATSC_CHANNEL_OR_EVENT_EXTENDED_TEXT = $CC;
  GST_MTS_TABLE_ID_ATSC_SYSTEM_TIME = $CD;
  GST_MTS_TABLE_ID_ATSC_DATA_EVENT = $CE;
  GST_MTS_TABLE_ID_ATSC_DATA_SERVICE = $CF;
  GST_MTS_TABLE_ID_ATSC_PROGRAM_IDENTIFIER = $D0;
  GST_MTS_TABLE_ID_ATSC_NETWORK_RESOURCE = $D1;
  GST_MTS_TABLE_ID_ATSC_LONG_TERM_SERVICE = $D2;
  GST_MTS_TABLE_ID_ATSC_DIRECTED_CHANNEL_CHANGE = $D3;
  GST_MTS_TABLE_ID_ATSC_DIRECTED_CHANNEL_CHANGE_SECTION_CODE = $D4;
  GST_MTS_TABLE_ID_ATSC_AGGREGATE_EVENT_INFORMATION = $D6;
  GST_MTS_TABLE_ID_ATSC_AGGREGATE_EXTENDED_TEXT = $D7;
  GST_MTS_TABLE_ID_ATSC_AGGREGATE_DATA_EVENT = $D9;
  GST_MTS_TABLE_ID_ATSC_SATELLITE_VIRTUAL_CHANNEL = $DA;

type
  PGstMpegtsATSCStreamType = ^TGstMpegtsATSCStreamType;
  TGstMpegtsATSCStreamType = longint;

const
  GST_MPEGTS_STREAM_TYPE_ATSC_DCII_VIDEO = $80;
  GST_MPEGTS_STREAM_TYPE_ATSC_AUDIO_AC3 = $81;
  GST_MPEGTS_STREAM_TYPE_ATSC_SUBTITLING = $82;
  GST_MPEGTS_STREAM_TYPE_ATSC_ISOCH_DATA = $83;
  GST_MPEGTS_STREAM_TYPE_ATSC_SIT = $86;
  GST_MPEGTS_STREAM_TYPE_ATSC_AUDIO_EAC3 = $87;
  GST_MPEGTS_STREAM_TYPE_ATSC_AUDIO_DTS_HD = $88;

type
  TGstMpegtsAtscVCTSource = record
    short_name: Pgchar;
    major_channel_number: Tguint16;
    minor_channel_number: Tguint16;
    modulation_mode: Tguint8;
    carrier_frequency: Tguint32;
    channel_TSID: Tguint16;
    program_number: Tguint16;
    ETM_location: Tguint8;
    access_controlled: Tgboolean;
    hidden: Tgboolean;
    path_select: Tgboolean;
    out_of_band: Tgboolean;
    hide_guide: Tgboolean;
    service_type: Tguint8;
    source_id: Tguint16;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsAtscVCTSource = ^TGstMpegtsAtscVCTSource;

  TGstMpegtsAtscVCT = record
    transport_stream_id: Tguint16;
    protocol_version: Tguint8;
    sources: PGPtrArray;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsAtscVCT = ^TGstMpegtsAtscVCT;


function gst_mpegts_atsc_vct_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_atsc_vct_source_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_tvct(section: PGstMpegtsSection): PGstMpegtsAtscVCT; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_cvct(section: PGstMpegtsSection): PGstMpegtsAtscVCT; cdecl; external libgstmpegts;

type
  PGstMpegtsAtscMGTTableType = ^TGstMpegtsAtscMGTTableType;
  TGstMpegtsAtscMGTTableType = longint;

const
  GST_MPEGTS_ATSC_MGT_TABLE_TYPE_EIT0 = $0100;
  GST_MPEGTS_ATSC_MGT_TABLE_TYPE_EIT127 = $017F;
  GST_MPEGTS_ATSC_MGT_TABLE_TYPE_ETT0 = $0200;
  GST_MPEGTS_ATSC_MGT_TABLE_TYPE_ETT127 = $027F;

type
  TGstMpegtsAtscMGTTable = record
    table_type: Tguint16;
    pid: Tguint16;
    version_number: Tguint8;
    number_bytes: Tguint32;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsAtscMGTTable = ^TGstMpegtsAtscMGTTable;

  TGstMpegtsAtscMGT = record
    protocol_version: Tguint8;
    tables_defined: Tguint16;
    tables: PGPtrArray;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsAtscMGT = ^TGstMpegtsAtscMGT;

function gst_mpegts_atsc_mgt_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_atsc_mgt_table_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_mgt(section: PGstMpegtsSection): PGstMpegtsAtscMGT; cdecl; external libgstmpegts;
function gst_mpegts_section_from_atsc_mgt(mgt: PGstMpegtsAtscMGT): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_atsc_mgt_new: PGstMpegtsAtscMGT; cdecl; external libgstmpegts;

type
  TGstMpegtsAtscStringSegment = record
    compression_type: Tguint8;
    mode: Tguint8;
    compressed_data_size: Tguint8;
    compressed_data: Pguint8;
    cached_string: Pgchar;
  end;
  PGstMpegtsAtscStringSegment = ^TGstMpegtsAtscStringSegment;

function gst_mpegts_atsc_string_segment_get_string(seg: PGstMpegtsAtscStringSegment): Pgchar; cdecl; external libgstmpegts;
function gst_mpegts_atsc_string_segment_set_string(seg: PGstMpegtsAtscStringSegment; _string: Pgchar; compression_type: Tguint8; mode: Tguint8): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsAtscMultString = record
    iso_639_langcode: array[0..3] of Tgchar;
    segments: PGPtrArray;
  end;
  PGstMpegtsAtscMultString = ^TGstMpegtsAtscMultString;

function gst_mpegts_atsc_string_segment_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_atsc_mult_string_get_type: TGType; cdecl; external libgstmpegts;

type
  TGstMpegtsAtscEITEvent = record
    event_id: Tguint16;
    start_time: Tguint32;
    etm_location: Tguint8;
    length_in_seconds: Tguint32;
    titles: PGPtrArray;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsAtscEITEvent = ^TGstMpegtsAtscEITEvent;

  TGstMpegtsAtscEIT = record
    source_id: Tguint16;
    protocol_version: Tguint8;
    events: PGPtrArray;
  end;
  PGstMpegtsAtscEIT = ^TGstMpegtsAtscEIT;

function gst_mpegts_atsc_eit_event_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_atsc_eit_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_eit(section: PGstMpegtsSection): PGstMpegtsAtscEIT; cdecl; external libgstmpegts;

type
  TGstMpegtsAtscETT = record
    ett_table_id_extension: Tguint16;
    protocol_version: Tguint16;
    etm_id: Tguint32;
    Messages: PGPtrArray;
  end;
  PGstMpegtsAtscETT = ^TGstMpegtsAtscETT;

function gst_mpegts_atsc_ett_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_ett(section: PGstMpegtsSection): PGstMpegtsAtscETT; cdecl; external libgstmpegts;

type
  TGstMpegtsAtscSTT = record
    protocol_version: Tguint8;
    system_time: Tguint32;
    gps_utc_offset: Tguint8;
    ds_status: Tgboolean;
    ds_dayofmonth: Tguint8;
    ds_hour: Tguint8;
    descriptors: PGPtrArray;
    utc_datetime: PGstDateTime;
  end;
  PGstMpegtsAtscSTT = ^TGstMpegtsAtscSTT;

function gst_mpegts_atsc_stt_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_stt(section: PGstMpegtsSection): PGstMpegtsAtscSTT; cdecl; external libgstmpegts;
function gst_mpegts_atsc_stt_get_datetime_utc(stt: PGstMpegtsAtscSTT): PGstDateTime; cdecl; external libgstmpegts;
function gst_mpegts_section_from_atsc_stt(stt: PGstMpegtsAtscSTT): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_atsc_stt_new: PGstMpegtsAtscSTT; cdecl; external libgstmpegts;

type
  TGstMpegtsAtscRRTDimensionValue = record
    abbrev_ratings: PGPtrArray;
    ratings: PGPtrArray;
  end;
  PGstMpegtsAtscRRTDimensionValue = ^TGstMpegtsAtscRRTDimensionValue;

  TGstMpegtsAtscRRTDimension = record
    names: PGPtrArray;
    graduated_scale: Tgboolean;
    values_defined: Tguint8;
    values: PGPtrArray;
  end;
  PGstMpegtsAtscRRTDimension = ^TGstMpegtsAtscRRTDimension;

  TGstMpegtsAtscRRT = record
    protocol_version: Tguint8;
    names: PGPtrArray;
    dimensions_defined: Tguint8;
    dimensions: PGPtrArray;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsAtscRRT = ^TGstMpegtsAtscRRT;

function gst_mpegts_atsc_rrt_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_atsc_rrt_dimension_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_atsc_rrt_dimension_value_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_atsc_rrt(section: PGstMpegtsSection): PGstMpegtsAtscRRT; cdecl; external libgstmpegts;
function gst_mpegts_section_from_atsc_rrt(rrt: PGstMpegtsAtscRRT): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_atsc_rrt_new: PGstMpegtsAtscRRT; cdecl; external libgstmpegts;
function gst_mpegts_atsc_rrt_dimension_new: PGstMpegtsAtscRRTDimension; cdecl; external libgstmpegts;
function gst_mpegts_atsc_rrt_dimension_value_new: PGstMpegtsAtscRRTDimensionValue; cdecl; external libgstmpegts;

function GST_TYPE_MPEGTS_ATSC_VCT: TGType;
function GST_TYPE_MPEGTS_ATSC_VCT_SOURCE: TGType;
function GST_TYPE_MPEGTS_ATSC_MGT: TGType;
function GST_TYPE_MPEGTS_ATSC_MGT_TABLE: TGType;
function GST_TYPE_MPEGTS_ATSC_STRING_SEGMENT: TGType;
function GST_TYPE_MPEGTS_ATSC_MULT_STRING: TGType;
function GST_TYPE_MPEGTS_ATSC_EIT_EVENT: TGType;
function GST_TYPE_MPEGTS_ATSC_EIT: TGType;
function GST_TYPE_MPEGTS_ATSC_ETT: TGType;
function GST_TYPE_MPEGTS_ATSC_STT: TGType;
function GST_TYPE_MPEGTS_ATSC_RRT: TGType;
function GST_TYPE_MPEGTS_ATSC_RRT_DIMENSION: TGType;
function GST_TYPE_MPEGTS_ATSC_RRT_DIMENSION_VALUE: TGType;

// === Konventiert am: 6-10-24 16:39:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_MPEGTS_ATSC_VCT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_VCT := gst_mpegts_atsc_vct_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_VCT_SOURCE: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_VCT_SOURCE := gst_mpegts_atsc_vct_source_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_MGT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_MGT := gst_mpegts_atsc_mgt_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_MGT_TABLE: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_MGT_TABLE := gst_mpegts_atsc_mgt_table_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_STRING_SEGMENT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_STRING_SEGMENT := gst_mpegts_atsc_string_segment_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_MULT_STRING: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_MULT_STRING := gst_mpegts_atsc_mult_string_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_EIT_EVENT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_EIT_EVENT := gst_mpegts_atsc_eit_event_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_EIT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_EIT := gst_mpegts_atsc_eit_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_ETT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_ETT := gst_mpegts_atsc_ett_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_STT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_STT := gst_mpegts_atsc_stt_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_RRT: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_RRT := gst_mpegts_atsc_rrt_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_RRT_DIMENSION: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_RRT_DIMENSION := gst_mpegts_atsc_rrt_dimension_get_type;
end;

function GST_TYPE_MPEGTS_ATSC_RRT_DIMENSION_VALUE: TGType;
begin
  GST_TYPE_MPEGTS_ATSC_RRT_DIMENSION_VALUE := gst_mpegts_atsc_rrt_dimension_value_get_type;
end;


{$ENDIF read_implementation}
