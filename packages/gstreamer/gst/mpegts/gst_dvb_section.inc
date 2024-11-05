/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsSectionDVBTableID = ^TGstMpegtsSectionDVBTableID;
  TGstMpegtsSectionDVBTableID = longint;

const
  GST_MTS_TABLE_ID_NETWORK_INFORMATION_ACTUAL_NETWORK = $40;
  GST_MTS_TABLE_ID_NETWORK_INFORMATION_OTHER_NETWORK = $41;
  GST_MTS_TABLE_ID_SERVICE_DESCRIPTION_ACTUAL_TS = $42;
  GST_MTS_TABLE_ID_SERVICE_DESCRIPTION_OTHER_TS = $46;
  GST_MTS_TABLE_ID_BOUQUET_ASSOCIATION = $4A;
  GST_MTS_TABLE_ID_UPDATE_NOTIFICATION = $4B;
  GST_MTS_TABLE_ID_DOWNLOADABLE_FONT_INFO = $4C;
  GST_MTS_TABLE_ID_EVENT_INFORMATION_ACTUAL_TS_PRESENT = $4E;
  GST_MTS_TABLE_ID_EVENT_INFORMATION_OTHER_TS_PRESENT = $4F;
  GST_MTS_TABLE_ID_EVENT_INFORMATION_ACTUAL_TS_SCHEDULE_1 = $50;
  GST_MTS_TABLE_ID_EVENT_INFORMATION_ACTUAL_TS_SCHEDULE_N = $5F;
  GST_MTS_TABLE_ID_EVENT_INFORMATION_OTHER_TS_SCHEDULE_1 = $60;
  GST_MTS_TABLE_ID_EVENT_INFORMATION_OTHER_TS_SCHEDULE_N = $6F;
  GST_MTS_TABLE_ID_TIME_DATE = $70;
  GST_MTS_TABLE_ID_RUNNING_STATUS = $71;
  GST_MTS_TABLE_ID_STUFFING = $72;
  GST_MTS_TABLE_ID_TIME_OFFSET = $73;
  GST_MTS_TABLE_ID_APPLICATION_INFORMATION_TABLE = $74;
  GST_MTS_TABLE_ID_CONTAINER = $75;
  GST_MTS_TABLE_ID_RELATED_CONTENT = $76;
  GST_MTS_TABLE_ID_CONTENT_IDENTIFIER = $77;
  GST_MTS_TABLE_ID_MPE_FEC = $78;
  GST_MTS_TABLE_ID_RESOLUTION_NOTIFICATION = $79;
  GST_MTS_TABLE_ID_MPE_IFEC = $7A;
  GST_MTS_TABLE_ID_PROTECTION_MESSAGE = $7B;
  GST_MTS_TABLE_ID_DISCONTINUITY_INFORMATION = $7E;
  GST_MTS_TABLE_ID_SELECTION_INFORMATION = $7F;
  GST_MTS_TABLE_ID_CA_MESSAGE_ECM_0 = $80;
  GST_MTS_TABLE_ID_CA_MESSAGE_ECM_1 = $81;
  GST_MTS_TABLE_ID_CA_MESSAGE_SYSTEM_PRIVATE_1 = $82;
  GST_MTS_TABLE_ID_CA_MESSAGE_SYSTEM_PRIVATE_N = $8F;
  GST_MTS_TABLE_ID_SCT = $A0;
  GST_MTS_TABLE_ID_FCT = $A1;
  GST_MTS_TABLE_ID_TCT = $A2;
  GST_MTS_TABLE_ID_SPT = $A3;
  GST_MTS_TABLE_ID_CMT = $A4;
  GST_MTS_TABLE_ID_TBTP = $A5;
  GST_MTS_TABLE_ID_PCR_PACKET_PAYLOAD = $A6;
  GST_MTS_TABLE_ID_TRANSMISSION_MODE_SUPPORT_PAYLOAD = $AA;
  GST_MTS_TABLE_ID_TIM = $B0;
  GST_MTS_TABLE_ID_LL_FEC_PARITY_DATA_TABLE = $B1;

type
  PGstMpegtsRunningStatus = ^TGstMpegtsRunningStatus;
  TGstMpegtsRunningStatus = longint;

const
  GST_MPEGTS_RUNNING_STATUS_UNDEFINED = 0;
  GST_MPEGTS_RUNNING_STATUS_NOT_RUNNING = 1;
  GST_MPEGTS_RUNNING_STATUS_STARTS_IN_FEW_SECONDS = 2;
  GST_MPEGTS_RUNNING_STATUS_PAUSING = 3;
  GST_MPEGTS_RUNNING_STATUS_RUNNING = 4;
  GST_MPEGTS_RUNNING_STATUS_OFF_AIR = 5;

type
  TGstMpegtsNITStream = record
    transport_stream_id: Tguint16;
    original_network_id: Tguint16;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsNITStream = ^TGstMpegtsNITStream;

  TGstMpegtsNIT = record
    actual_network: Tgboolean;
    network_id: Tguint16;
    descriptors: PGPtrArray;
    streams: PGPtrArray;
  end;
  PGstMpegtsNIT = ^TGstMpegtsNIT;

function gst_mpegts_nit_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_nit_stream_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_nit(section: PGstMpegtsSection): PGstMpegtsNIT; cdecl; external libgstmpegts;
function gst_mpegts_section_from_nit(nit: PGstMpegtsNIT): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_nit_new: PGstMpegtsNIT; cdecl; external libgstmpegts;
function gst_mpegts_nit_stream_new: PGstMpegtsNITStream; cdecl; external libgstmpegts;

type
  TGstMpegtsBATStream = record
    transport_stream_id: Tguint16;
    original_network_id: Tguint16;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsBATStream = ^TGstMpegtsBATStream;

  TGstMpegtsBAT = record
    descriptors: PGPtrArray;
    streams: PGPtrArray;
  end;
  PGstMpegtsBAT = ^TGstMpegtsBAT;


function gst_mpegts_bat_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_bat_stream_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_bat(section: PGstMpegtsSection): PGstMpegtsBAT; cdecl; external libgstmpegts;

type
  TGstMpegtsSDTService = record
    service_id: Tguint16;
    EIT_schedule_flag: Tgboolean;
    EIT_present_following_flag: Tgboolean;
    running_status: TGstMpegtsRunningStatus;
    free_CA_mode: Tgboolean;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsSDTService = ^TGstMpegtsSDTService;

  TGstMpegtsSDT = record
    original_network_id: Tguint16;
    actual_ts: Tgboolean;
    transport_stream_id: Tguint16;
    services: PGPtrArray;
  end;
  PGstMpegtsSDT = ^TGstMpegtsSDT;

function gst_mpegts_sdt_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_sdt_service_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_sdt(section: PGstMpegtsSection): PGstMpegtsSDT; cdecl; external libgstmpegts;
function gst_mpegts_section_from_sdt(sdt: PGstMpegtsSDT): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_sdt_new: PGstMpegtsSDT; cdecl; external libgstmpegts;
function gst_mpegts_sdt_service_new: PGstMpegtsSDTService; cdecl; external libgstmpegts;


type
  TGstMpegtsEITEvent = record
    event_id: Tguint16;
    start_time: PGstDateTime;
    duration: Tguint32;
    running_status: TGstMpegtsRunningStatus;
    free_CA_mode: Tgboolean;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsEITEvent = ^TGstMpegtsEITEvent;

  TGstMpegtsEIT = record
    transport_stream_id: Tguint16;
    original_network_id: Tguint16;
    segment_last_section_number: Tguint8;
    last_table_id: Tguint8;
    actual_stream: Tgboolean;
    present_following: Tgboolean;
    events: PGPtrArray;
  end;
  PGstMpegtsEIT = ^TGstMpegtsEIT;

function gst_mpegts_eit_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_eit_event_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_eit(section: PGstMpegtsSection): PGstMpegtsEIT; cdecl; external libgstmpegts;
function gst_mpegts_section_get_tdt(section: PGstMpegtsSection): PGstDateTime; cdecl; external libgstmpegts;

type
  TGstMpegtsTOT = record
    utc_time: PGstDateTime;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsTOT = ^TGstMpegtsTOT;

function gst_mpegts_tot_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_tot(section: PGstMpegtsSection): PGstMpegtsTOT; cdecl; external libgstmpegts;

type
  TGstMpegtsSITService = record
    service_id: Tguint16;
    running_status: TGstMpegtsRunningStatus;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsSITService = ^TGstMpegtsSITService;

  TGstMpegtsSIT = record
    descriptors: PGPtrArray;
    services: PGPtrArray;
  end;
  PGstMpegtsSIT = ^TGstMpegtsSIT;

function gst_mpegts_sit_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_sit_service_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_section_get_sit(section: PGstMpegtsSection): PGstMpegtsSIT; cdecl; external libgstmpegts;

function GST_TYPE_MPEGTS_NIT: TGType;
function GST_TYPE_MPEGTS_NIT_STREAM: TGType;
function GST_TYPE_MPEGTS_BAT: TGType;
function GST_TYPE_MPEGTS_BAT_STREAM: TGType;
function GST_TYPE_MPEGTS_SDT: TGType;
function GST_TYPE_MPEGTS_SDT_SERVICE: TGType;
function GST_TYPE_MPEGTS_EIT: TGType;
function GST_TYPE_MPEGTS_EIT_EVENT: TGType;
function GST_TYPE_MPEGTS_TOT: TGType;
function GST_TYPE_MPEGTS_SIT_SERVICE: TGType;
function GST_TYPE_MPEGTS_SIT: TGType;

// === Konventiert am: 6-10-24 16:39:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_MPEGTS_NIT: TGType;
begin
  GST_TYPE_MPEGTS_NIT := gst_mpegts_nit_get_type;
end;

function GST_TYPE_MPEGTS_NIT_STREAM: TGType;
begin
  GST_TYPE_MPEGTS_NIT_STREAM := gst_mpegts_nit_stream_get_type;
end;

function GST_TYPE_MPEGTS_BAT: TGType;
begin
  GST_TYPE_MPEGTS_BAT := gst_mpegts_bat_get_type;
end;

function GST_TYPE_MPEGTS_BAT_STREAM: TGType;
begin
  GST_TYPE_MPEGTS_BAT_STREAM := gst_mpegts_bat_get_type;
end;

function GST_TYPE_MPEGTS_SDT: TGType;
begin
  GST_TYPE_MPEGTS_SDT := gst_mpegts_sdt_get_type;
end;

function GST_TYPE_MPEGTS_SDT_SERVICE: TGType;
begin
  GST_TYPE_MPEGTS_SDT_SERVICE := gst_mpegts_sdt_service_get_type;
end;

function GST_TYPE_MPEGTS_EIT: TGType;
begin
  GST_TYPE_MPEGTS_EIT := gst_mpegts_eit_get_type;
end;

function GST_TYPE_MPEGTS_EIT_EVENT: TGType;
begin
  GST_TYPE_MPEGTS_EIT_EVENT := gst_mpegts_eit_event_get_type;
end;

function GST_TYPE_MPEGTS_TOT: TGType;
begin
  GST_TYPE_MPEGTS_TOT := gst_mpegts_tot_get_type;
end;

function GST_TYPE_MPEGTS_SIT_SERVICE: TGType;
begin
  GST_TYPE_MPEGTS_SIT_SERVICE := gst_mpegts_sit_service_get_type;
end;

function GST_TYPE_MPEGTS_SIT: TGType;
begin
  GST_TYPE_MPEGTS_SIT := gst_mpegts_sit_get_type;
end;


{$ENDIF read_implementation}
