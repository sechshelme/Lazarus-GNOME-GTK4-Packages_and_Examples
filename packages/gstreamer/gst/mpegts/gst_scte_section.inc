/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsScteStreamType = ^TGstMpegtsScteStreamType;
  TGstMpegtsScteStreamType = longint;

const
  GST_MPEGTS_STREAM_TYPE_SCTE_SUBTITLING = $82;
  GST_MPEGTS_STREAM_TYPE_SCTE_ISOCH_DATA = $83;
  GST_MPEGTS_STREAM_TYPE_SCTE_SIT = $86;
  GST_MPEGTS_STREAM_TYPE_SCTE_DST_NRT = $95;
  GST_MPEGTS_STREAM_TYPE_SCTE_DSMCC_DCB = $b0;
  GST_MPEGTS_STREAM_TYPE_SCTE_SIGNALING = $c0;
  GST_MPEGTS_STREAM_TYPE_SCTE_SYNC_DATA = $c2;
  GST_MPEGTS_STREAM_TYPE_SCTE_ASYNC_DATA = $c3;

type
  PGstMpegtsSectionSCTETableID = ^TGstMpegtsSectionSCTETableID;
  TGstMpegtsSectionSCTETableID = longint;

const
  GST_MTS_TABLE_ID_SCTE_EAS = $d8;
  GST_MTS_TABLE_ID_SCTE_EBIF = $E0;
  GST_MTS_TABLE_ID_SCTE_RESERVED = $E1;
  GST_MTS_TABLE_ID_SCTE_EISS = $E2;
  GST_MTS_TABLE_ID_SCTE_DII = $E3;
  GST_MTS_TABLE_ID_SCTE_DDB = $E4;
  GST_MTS_TABLE_ID_SCTE_SPLICE = $fc;

type
  TGstMpegtsSCTESpliceComponent = record
    tag: Tguint8;
    splice_time_specified: Tgboolean;
    splice_time: Tguint64;
    utc_splice_time: Tguint32;
  end;
  PGstMpegtsSCTESpliceComponent = ^TGstMpegtsSCTESpliceComponent;

type
  TGstMpegtsSCTESpliceEvent = record
    insert_event: Tgboolean;
    splice_event_id: Tguint32;
    splice_event_cancel_indicator: Tgboolean;
    out_of_network_indicator: Tgboolean;
    program_splice_flag: Tgboolean;
    duration_flag: Tgboolean;
    splice_immediate_flag: Tgboolean;
    program_splice_time_specified: Tgboolean;
    program_splice_time: Tguint64;
    utc_splice_time: Tguint32;
    Components: PGPtrArray;
    break_duration_auto_return: Tgboolean;
    break_duration: Tguint64;
    unique_program_id: Tguint16;
    avail_num: Tguint8;
    avails_expected: Tguint8;
  end;
  PGstMpegtsSCTESpliceEvent = ^TGstMpegtsSCTESpliceEvent;

  PGstMpegtsSCTESpliceDescriptor = ^TGstMpegtsSCTESpliceDescriptor;
  TGstMpegtsSCTESpliceDescriptor = longint;

const
  GST_MTS_SCTE_DESC_AVAIL = $00;
  GST_MTS_SCTE_DESC_DTMF = $01;
  GST_MTS_SCTE_DESC_SEGMENTATION = $02;
  GST_MTS_SCTE_DESC_TIME = $03;
  GST_MTS_SCTE_DESC_AUDIO = $04;

type
  PGstMpegtsSCTESpliceCommandType = ^TGstMpegtsSCTESpliceCommandType;
  TGstMpegtsSCTESpliceCommandType = longint;

const
  GST_MTS_SCTE_SPLICE_COMMAND_NULL = $00;
  GST_MTS_SCTE_SPLICE_COMMAND_SCHEDULE = $04;
  GST_MTS_SCTE_SPLICE_COMMAND_INSERT = $05;
  GST_MTS_SCTE_SPLICE_COMMAND_TIME = $06;
  GST_MTS_SCTE_SPLICE_COMMAND_BANDWIDTH = $07;
  GST_MTS_SCTE_SPLICE_COMMAND_PRIVATE = $ff;

type
  TGstMpegtsSCTESIT = record
    encrypted_packet: Tgboolean;
    encryption_algorithm: Tguint8;
    pts_adjustment: Tguint64;
    cw_index: Tguint8;
    tier: Tguint16;
    splice_command_length: Tguint16;
    splice_command_type: TGstMpegtsSCTESpliceCommandType;
    splice_time_specified: Tgboolean;
    splice_time: Tguint64;
    splices: PGPtrArray;
    descriptors: PGPtrArray;
    fully_parsed: Tgboolean;
    is_running_time: Tgboolean;
  end;
  PGstMpegtsSCTESIT = ^TGstMpegtsSCTESIT;

function gst_mpegts_scte_sit_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_scte_sit_new: PGstMpegtsSCTESIT; cdecl; external libgstmpegts;
function gst_mpegts_scte_null_new: PGstMpegtsSCTESIT; cdecl; external libgstmpegts;
function gst_mpegts_scte_cancel_new(event_id: Tguint32): PGstMpegtsSCTESIT; cdecl; external libgstmpegts;
function gst_mpegts_scte_splice_in_new(event_id: Tguint32; splice_time: TGstClockTime): PGstMpegtsSCTESIT; cdecl; external libgstmpegts;
function gst_mpegts_scte_splice_out_new(event_id: Tguint32; splice_time: TGstClockTime; duration: TGstClockTime): PGstMpegtsSCTESIT; cdecl; external libgstmpegts;
function gst_mpegts_scte_splice_event_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_scte_splice_event_new: PGstMpegtsSCTESpliceEvent; cdecl; external libgstmpegts;
function gst_mpegts_section_get_scte_sit(section: PGstMpegtsSection): PGstMpegtsSCTESIT; cdecl; external libgstmpegts;
function gst_mpegts_section_from_scte_sit(sit: PGstMpegtsSCTESIT; pid: Tguint16): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_scte_splice_component_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_scte_splice_component_new(tag: Tguint8): PGstMpegtsSCTESpliceComponent; cdecl; external libgstmpegts;

function GST_MPEGTS_TYPE_SCTE_SPLICE_COMPONENT: TGType;
function GST_TYPE_MPEGTS_SCTE_SPLICE_EVENT: TGType;
function GST_TYPE_MPEGTS_SCTE_SIT: TGType;


// === Konventiert am: 6-10-24 16:40:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_MPEGTS_TYPE_SCTE_SPLICE_COMPONENT: TGType;
begin
  GST_MPEGTS_TYPE_SCTE_SPLICE_COMPONENT := gst_mpegts_scte_splice_component_get_type;
end;

function GST_TYPE_MPEGTS_SCTE_SPLICE_EVENT: TGType;
begin
  GST_TYPE_MPEGTS_SCTE_SPLICE_EVENT := gst_mpegts_scte_splice_event_get_type;
end;

function GST_TYPE_MPEGTS_SCTE_SIT: TGType;
begin
  GST_TYPE_MPEGTS_SCTE_SIT := gst_mpegts_scte_sit_get_type;
end;


{$ENDIF read_implementation}
