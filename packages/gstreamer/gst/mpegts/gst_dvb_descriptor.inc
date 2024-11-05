/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsDVBDescriptorType = ^TGstMpegtsDVBDescriptorType;
  TGstMpegtsDVBDescriptorType = longint;

const
  GST_MTS_DESC_DVB_NETWORK_NAME = $40;
  GST_MTS_DESC_DVB_SERVICE_LIST = $41;
  GST_MTS_DESC_DVB_STUFFING = $42;
  GST_MTS_DESC_DVB_SATELLITE_DELIVERY_SYSTEM = $43;
  GST_MTS_DESC_DVB_CABLE_DELIVERY_SYSTEM = $44;
  GST_MTS_DESC_DVB_VBI_DATA = $45;
  GST_MTS_DESC_DVB_VBI_TELETEXT = $46;
  GST_MTS_DESC_DVB_BOUQUET_NAME = $47;
  GST_MTS_DESC_DVB_SERVICE = $48;
  GST_MTS_DESC_DVB_COUNTRY_AVAILABILITY = $49;
  GST_MTS_DESC_DVB_LINKAGE = $4A;
  GST_MTS_DESC_DVB_NVOD_REFERENCE = $4B;
  GST_MTS_DESC_DVB_TIME_SHIFTED_SERVICE = $4C;
  GST_MTS_DESC_DVB_SHORT_EVENT = $4D;
  GST_MTS_DESC_DVB_EXTENDED_EVENT = $4E;
  GST_MTS_DESC_DVB_TIME_SHIFTED_EVENT = $4F;
  GST_MTS_DESC_DVB_COMPONENT = $50;
  GST_MTS_DESC_DVB_MOSAIC = $51;
  GST_MTS_DESC_DVB_STREAM_IDENTIFIER = $52;
  GST_MTS_DESC_DVB_CA_IDENTIFIER = $53;
  GST_MTS_DESC_DVB_CONTENT = $54;
  GST_MTS_DESC_DVB_PARENTAL_RATING = $55;
  GST_MTS_DESC_DVB_TELETEXT = $56;
  GST_MTS_DESC_DVB_TELEPHONE = $57;
  GST_MTS_DESC_DVB_LOCAL_TIME_OFFSET = $58;
  GST_MTS_DESC_DVB_SUBTITLING = $59;
  GST_MTS_DESC_DVB_TERRESTRIAL_DELIVERY_SYSTEM = $5A;
  GST_MTS_DESC_DVB_MULTILINGUAL_NETWORK_NAME = $5B;
  GST_MTS_DESC_DVB_MULTILINGUAL_BOUQUET_NAME = $5C;
  GST_MTS_DESC_DVB_MULTILINGUAL_SERVICE_NAME = $5D;
  GST_MTS_DESC_DVB_MULTILINGUAL_COMPONENT = $5E;
  GST_MTS_DESC_DVB_PRIVATE_DATA_SPECIFIER = $5F;
  GST_MTS_DESC_DVB_SERVICE_MOVE = $60;
  GST_MTS_DESC_DVB_SHORT_SMOOTHING_BUFFER = $61;
  GST_MTS_DESC_DVB_FREQUENCY_LIST = $62;
  GST_MTS_DESC_DVB_PARTIAL_TRANSPORT_STREAM = $63;
  GST_MTS_DESC_DVB_DATA_BROADCAST = $64;
  GST_MTS_DESC_DVB_SCRAMBLING = $65;
  GST_MTS_DESC_DVB_DATA_BROADCAST_ID = $66;
  GST_MTS_DESC_DVB_TRANSPORT_STREAM = $67;
  GST_MTS_DESC_DVB_DSNG = $68;
  GST_MTS_DESC_DVB_PDC = $69;
  GST_MTS_DESC_DVB_AC3 = $6A;
  GST_MTS_DESC_DVB_ANCILLARY_DATA = $6B;
  GST_MTS_DESC_DVB_CELL_LIST = $6C;
  GST_MTS_DESC_DVB_CELL_FREQUENCY_LINK = $6D;
  GST_MTS_DESC_DVB_ANNOUNCEMENT_SUPPORT = $6E;
  GST_MTS_DESC_DVB_APPLICATION_SIGNALLING = $6F;
  GST_MTS_DESC_DVB_ADAPTATION_FIELD_DATA = $70;
  GST_MTS_DESC_DVB_SERVICE_IDENTIFIER = $71;
  GST_MTS_DESC_DVB_SERVICE_AVAILABILITY = $72;
  GST_MTS_DESC_DVB_DEFAULT_AUTHORITY = $73;
  GST_MTS_DESC_DVB_RELATED_CONTENT = $74;
  GST_MTS_DESC_DVB_TVA_ID = $75;
  GST_MTS_DESC_DVB_CONTENT_IDENTIFIER = $76;
  GST_MTS_DESC_DVB_TIMESLICE_FEC_IDENTIFIER = $77;
  GST_MTS_DESC_DVB_ECM_REPETITION_RATE = $78;
  GST_MTS_DESC_DVB_S2_SATELLITE_DELIVERY_SYSTEM = $79;
  GST_MTS_DESC_DVB_ENHANCED_AC3 = $7A;
  GST_MTS_DESC_DVB_DTS = $7B;
  GST_MTS_DESC_DVB_AAC = $7C;
  GST_MTS_DESC_DVB_XAIT_LOCATION = $7D;
  GST_MTS_DESC_DVB_FTA_CONTENT_MANAGEMENT = $7E;
  GST_MTS_DESC_DVB_EXTENSION = $7F;

type
  PGstMpegtsDVBExtendedDescriptorType = ^TGstMpegtsDVBExtendedDescriptorType;
  TGstMpegtsDVBExtendedDescriptorType = longint;

const
  GST_MTS_DESC_EXT_DVB_IMAGE_ICON = $00;
  GST_MTS_DESC_EXT_DVB_CPCM_DELIVERY_SIGNALLING = $01;
  GST_MTS_DESC_EXT_DVB_CP = $02;
  GST_MTS_DESC_EXT_DVB_CP_IDENTIFIER = $03;
  GST_MTS_DESC_EXT_DVB_T2_DELIVERY_SYSTEM = $04;
  GST_MTS_DESC_EXT_DVB_SH_DELIVERY_SYSTEM = $05;
  GST_MTS_DESC_EXT_DVB_SUPPLEMENTARY_AUDIO = $06;
  GST_MTS_DESC_EXT_DVB_NETWORK_CHANGE_NOTIFY = $07;
  GST_MTS_DESC_EXT_DVB_MESSAGE = $08;
  GST_MTS_DESC_EXT_DVB_TARGET_REGION = $09;
  GST_MTS_DESC_EXT_DVB_TARGET_REGION_NAME = $0A;
  GST_MTS_DESC_EXT_DVB_SERVICE_RELOCATED = $0B;
  GST_MTS_DESC_EXT_DVB_XAIT_PID = $0C;
  GST_MTS_DESC_EXT_DVB_C2_DELIVERY_SYSTEM = $0D;
  GST_MTS_DESC_EXT_DVB_DTS_HD_AUDIO_STREAM = $0E;
  GST_MTS_DESC_EXT_DVB_DTS_NEUTRAL = $0F;
  GST_MTS_DESC_EXT_DVB_VIDEO_DEPTH_RANGE = $10;
  GST_MTS_DESC_EXT_DVB_T2MI = $11;
  GST_MTS_DESC_EXT_DVB_URI_LINKAGE = $13;
  GST_MTS_DESC_EXT_DVB_AC4 = $15;
  GST_MTS_DESC_EXT_DVB_AUDIO_PRESELECTION = $19;

function gst_mpegts_descriptor_parse_dvb_network_name(descriptor: PGstMpegtsDescriptor; Name: PPgchar): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_dvb_network_name(Name: Pgchar): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_stuffing(descriptor: PGstMpegtsDescriptor; stuffing_bytes: PPguint8): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsModulationType = ^TGstMpegtsModulationType;
  TGstMpegtsModulationType = longint;

const
  GST_MPEGTS_MODULATION_QPSK = 0;
  GST_MPEGTS_MODULATION_QAM_16 = 1;
  GST_MPEGTS_MODULATION_QAM_32 = 2;
  GST_MPEGTS_MODULATION_QAM_64 = 3;
  GST_MPEGTS_MODULATION_QAM_128 = 4;
  GST_MPEGTS_MODULATION_QAM_256 = 5;
  GST_MPEGTS_MODULATION_QAM_AUTO = 6;
  GST_MPEGTS_MODULATION_VSB_8 = 7;
  GST_MPEGTS_MODULATION_VSB_16 = 8;
  GST_MPEGTS_MODULATION_PSK_8 = 9;
  GST_MPEGTS_MODULATION_APSK_16 = 10;
  GST_MPEGTS_MODULATION_APSK_32 = 11;
  GST_MPEGTS_MODULATION_DQPSK = 12;
  GST_MPEGTS_MODULATION_QAM_4_NR_ = 13;
  GST_MPEGTS_MODULATION_NONE = 14;

type
  PGstMpegtsDVBCodeRate = ^TGstMpegtsDVBCodeRate;
  TGstMpegtsDVBCodeRate = longint;

const
  GST_MPEGTS_FEC_NONE = 0;
  GST_MPEGTS_FEC_1_2 = 1;
  GST_MPEGTS_FEC_2_3 = 2;
  GST_MPEGTS_FEC_3_4 = 3;
  GST_MPEGTS_FEC_4_5 = 4;
  GST_MPEGTS_FEC_5_6 = 5;
  GST_MPEGTS_FEC_6_7 = 6;
  GST_MPEGTS_FEC_7_8 = 7;
  GST_MPEGTS_FEC_8_9 = 8;
  GST_MPEGTS_FEC_AUTO = 9;
  GST_MPEGTS_FEC_3_5 = 10;
  GST_MPEGTS_FEC_9_10 = 11;
  GST_MPEGTS_FEC_2_5 = 12;

type
  PGstMpegtsSatelliteRolloff = ^TGstMpegtsSatelliteRolloff;
  TGstMpegtsSatelliteRolloff = longint;

const
  GST_MPEGTS_ROLLOFF_35 = 0;
  GST_MPEGTS_ROLLOFF_20 = 1;
  GST_MPEGTS_ROLLOFF_25 = 2;
  GST_MPEGTS_ROLLOFF_RESERVED = 3;
  GST_MPEGTS_ROLLOFF_AUTO = 4;

type
  PGstMpegtsSatellitePolarizationType = ^TGstMpegtsSatellitePolarizationType;
  TGstMpegtsSatellitePolarizationType = longint;

const
  GST_MPEGTS_POLARIZATION_LINEAR_HORIZONTAL = 0;
  GST_MPEGTS_POLARIZATION_LINEAR_VERTICAL = 1;
  GST_MPEGTS_POLARIZATION_CIRCULAR_LEFT = 2;
  GST_MPEGTS_POLARIZATION_CIRCULAR_RIGHT = 3;

type
  PGstMpegtsSatelliteDeliverySystemDescriptor = ^TGstMpegtsSatelliteDeliverySystemDescriptor;

  TGstMpegtsSatelliteDeliverySystemDescriptor = record
    frequency: Tguint32;
    orbital_position: Tgfloat;
    west_east: Tgboolean;
    polarization: TGstMpegtsSatellitePolarizationType;
    roll_off: TGstMpegtsSatelliteRolloff;
    modulation_system: Tgboolean;
    modulation_type: TGstMpegtsModulationType;
    symbol_rate: Tguint32;
    fec_inner: TGstMpegtsDVBCodeRate;
  end;

function gst_mpegts_satellite_delivery_system_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_satellite_delivery_system(descriptor: PGstMpegtsDescriptor; res: PGstMpegtsSatelliteDeliverySystemDescriptor): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsCableOuterFECScheme = ^TGstMpegtsCableOuterFECScheme;
  TGstMpegtsCableOuterFECScheme = longint;

const
  GST_MPEGTS_CABLE_OUTER_FEC_UNDEFINED = 0;
  GST_MPEGTS_CABLE_OUTER_FEC_NONE = 1;
  GST_MPEGTS_CABLE_OUTER_FEC_RS_204_188 = 2;

type
  TGstMpegtsCableDeliverySystemDescriptor = record
    frequency: Tguint32;
    outer_fec: TGstMpegtsCableOuterFECScheme;
    modulation: TGstMpegtsModulationType;
    symbol_rate: Tguint32;
    fec_inner: TGstMpegtsDVBCodeRate;
  end;
  PGstMpegtsCableDeliverySystemDescriptor = ^TGstMpegtsCableDeliverySystemDescriptor;

function gst_mpegts_dvb_cable_delivery_system_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_cable_delivery_system(descriptor: PGstMpegtsDescriptor; res: PGstMpegtsCableDeliverySystemDescriptor): Tgboolean; cdecl; external libgstmpegts;
procedure gst_mpegts_dvb_cable_delivery_system_descriptor_free(Source: PGstMpegtsCableDeliverySystemDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_bouquet_name(descriptor: PGstMpegtsDescriptor; bouquet_name: PPgchar): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsDVBServiceType = ^TGstMpegtsDVBServiceType;
  TGstMpegtsDVBServiceType = longint;

const
  GST_DVB_SERVICE_RESERVED_00 = $00;
  GST_DVB_SERVICE_DIGITAL_TELEVISION = 1;
  GST_DVB_SERVICE_DIGITAL_RADIO_SOUND = 2;
  GST_DVB_SERVICE_TELETEXT = 3;
  GST_DVB_SERVICE_NVOD_REFERENCE = 4;
  GST_DVB_SERVICE_NVOD_TIME_SHIFTED = 5;
  GST_DVB_SERVICE_MOSAIC = 6;
  GST_DVB_SERVICE_FM_RADIO = 7;
  GST_DVB_SERVICE_DVB_SRM = 8;
  GST_DVB_SERVICE_RESERVED_09 = 9;
  GST_DVB_SERVICE_ADVANCED_CODEC_DIGITAL_RADIO_SOUND = 10;
  GST_DVB_SERVICE_ADVANCED_CODEC_MOSAIC = 11;
  GST_DVB_SERVICE_DATA_BROADCAST = 12;
  GST_DVB_SERVICE_RESERVED_0D_COMMON_INTERFACE = 13;
  GST_DVB_SERVICE_RCS_MAP = 14;
  GST_DVB_SERVICE_RCS_FLS = 15;
  GST_DVB_SERVICE_DVB_MHP = 16;
  GST_DVB_SERVICE_MPEG2_HD_DIGITAL_TELEVISION = 17;
  GST_DVB_SERVICE_ADVANCED_CODEC_SD_DIGITAL_TELEVISION = $16;
  GST_DVB_SERVICE_ADVANCED_CODEC_SD_NVOD_TIME_SHIFTED = 23;
  GST_DVB_SERVICE_ADVANCED_CODEC_SD_NVOD_REFERENCE = 24;
  GST_DVB_SERVICE_ADVANCED_CODEC_HD_DIGITAL_TELEVISION = 25;
  GST_DVB_SERVICE_ADVANCED_CODEC_HD_NVOD_TIME_SHIFTED = 26;
  GST_DVB_SERVICE_ADVANCED_CODEC_HD_NVOD_REFERENCE = 27;
  GST_DVB_SERVICE_ADVANCED_CODEC_STEREO_HD_DIGITAL_TELEVISION = 28;
  GST_DVB_SERVICE_ADVANCED_CODEC_STEREO_HD_NVOD_TIME_SHIFTED = 29;
  GST_DVB_SERVICE_ADVANCED_CODEC_STEREO_HD_NVOD_REFERENCE = 30;
  GST_DVB_SERVICE_RESERVED_FF = 31;

function gst_mpegts_descriptor_parse_dvb_service(descriptor: PGstMpegtsDescriptor; service_type: PGstMpegtsDVBServiceType; service_name: PPgchar; provider_name: PPgchar): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_dvb_service(service_type: TGstMpegtsDVBServiceType; service_name: Pgchar; service_provider: Pgchar): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

type
  TGstMpegtsDVBServiceListItem = record
    service_id: Tguint16;
    _type: TGstMpegtsDVBServiceType;
  end;
  PGstMpegtsDVBServiceListItem = ^TGstMpegtsDVBServiceListItem;

function gst_mpegts_dvb_service_list_item_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_service_list(descriptor: PGstMpegtsDescriptor; list: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsDVBLinkageType = ^TGstMpegtsDVBLinkageType;
  TGstMpegtsDVBLinkageType = longint;

const
  GST_MPEGTS_DVB_LINKAGE_RESERVED_00 = $00;
  GST_MPEGTS_DVB_LINKAGE_INFORMATION = $01;
  GST_MPEGTS_DVB_LINKAGE_EPG = $02;
  GST_MPEGTS_DVB_LINKAGE_CA_REPLACEMENT = $03;
  GST_MPEGTS_DVB_LINKAGE_TS_CONTAINING_COMPLETE_SI = $04;
  GST_MPEGTS_DVB_LINKAGE_SERVICE_REPLACEMENT = $05;
  GST_MPEGTS_DVB_LINKAGE_DATA_BROADCAST = $06;
  GST_MPEGTS_DVB_LINKAGE_RCS_MAP = $07;
  GST_MPEGTS_DVB_LINKAGE_MOBILE_HAND_OVER = $08;
  GST_MPEGTS_DVB_LINKAGE_SYSTEM_SOFTWARE_UPDATE = $09;
  GST_MPEGTS_DVB_LINKAGE_TS_CONTAINING_SSU = $0A;
  GST_MPEGTS_DVB_LINKAGE_IP_MAC_NOTIFICATION = $0B;
  GST_MPEGTS_DVB_LINKAGE_TS_CONTAINING_INT = $0C;
  GST_MPEGTS_DVB_LINKAGE_EVENT = $0D;
  GST_MPEGTS_DVB_LINKAGE_EXTENDED_EVENT = $0E;

type
  PGstMpegtsDVBLinkageHandOverType = ^TGstMpegtsDVBLinkageHandOverType;
  TGstMpegtsDVBLinkageHandOverType = longint;

const
  GST_MPEGTS_DVB_LINKAGE_HAND_OVER_RESERVED = $00;
  GST_MPEGTS_DVB_LINKAGE_HAND_OVER_IDENTICAL = $01;
  GST_MPEGTS_DVB_LINKAGE_HAND_OVER_LOCAL_VARIATION = $02;
  GST_MPEGTS_DVB_LINKAGE_HAND_OVER_ASSOCIATED = $03;

type
  TGstMpegtsDVBLinkageMobileHandOver = record
    hand_over_type: TGstMpegtsDVBLinkageHandOverType;
    origin_type: Tgboolean;
    network_id: Tguint16;
    initial_service_id: Tguint16;
  end;
  PGstMpegtsDVBLinkageMobileHandOver = ^TGstMpegtsDVBLinkageMobileHandOver;

  TGstMpegtsDVBLinkageEvent = record
    target_event_id: Tguint16;
    target_listed: Tgboolean;
    event_simulcast: Tgboolean;
  end;
  PGstMpegtsDVBLinkageEvent = ^TGstMpegtsDVBLinkageEvent;

  TGstMpegtsDVBLinkageExtendedEvent = record
    target_event_id: Tguint16;
    target_listed: Tgboolean;
    event_simulcast: Tgboolean;
    link_type: Tguint8;
    target_id_type: Tguint8;
    original_network_id_flag: Tgboolean;
    service_id_flag: Tgboolean;
    user_defined_id: Tguint16;
    target_transport_stream_id: Tguint16;
    target_original_network_id: Tguint16;
    target_service_id: Tguint16;
  end;
  PGstMpegtsDVBLinkageExtendedEvent = ^TGstMpegtsDVBLinkageExtendedEvent;

  TGstMpegtsDVBLinkageDescriptor = record
    transport_stream_id: Tguint16;
    original_network_id: Tguint16;
    service_id: Tguint16;
    linkage_type: TGstMpegtsDVBLinkageType;
    linkage_data: Tgpointer;
    private_data_length: Tguint8;
    private_data_bytes: Pguint8;
  end;
  PGstMpegtsDVBLinkageDescriptor = ^TGstMpegtsDVBLinkageDescriptor;
  PPGstMpegtsDVBLinkageDescriptor = ^PGstMpegtsDVBLinkageDescriptor;

function gst_mpegts_dvb_linkage_descriptor_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_dvb_linkage_descriptor_free(Source: PGstMpegtsDVBLinkageDescriptor); cdecl; external libgstmpegts;

function gst_mpegts_dvb_linkage_mobile_hand_over_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_dvb_linkage_descriptor_get_mobile_hand_over(desc: PGstMpegtsDVBLinkageDescriptor): PGstMpegtsDVBLinkageMobileHandOver; cdecl; external libgstmpegts;

function gst_mpegts_dvb_linkage_event_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_dvb_linkage_descriptor_get_event(desc: PGstMpegtsDVBLinkageDescriptor): PGstMpegtsDVBLinkageEvent; cdecl; external libgstmpegts;

function gst_mpegts_dvb_linkage_extended_event_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_dvb_linkage_descriptor_get_extended_event(desc: PGstMpegtsDVBLinkageDescriptor): PGPtrArray; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_linkage(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsDVBLinkageDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_short_event(descriptor: PGstMpegtsDescriptor; language_code: PPgchar; event_name: PPgchar; Text: PPgchar): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsExtendedEventItem = record
    item_description: Pgchar;
    item: Pgchar;
  end;
  PGstMpegtsExtendedEventItem = ^TGstMpegtsExtendedEventItem;

function gst_mpegts_extended_event_item_get_type: TGType; cdecl; external libgstmpegts;

type
  TGstMpegtsExtendedEventDescriptor = record
    descriptor_number: Tguint8;
    last_descriptor_number: Tguint8;
    language_code: Pgchar;
    items: PGPtrArray;
    Text: Pgchar;
  end;
  PGstMpegtsExtendedEventDescriptor = ^TGstMpegtsExtendedEventDescriptor;
  PPGstMpegtsExtendedEventDescriptor = ^PGstMpegtsExtendedEventDescriptor;

function gst_mpegts_extended_event_descriptor_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_extended_event_descriptor_free(Source: PGstMpegtsExtendedEventDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_extended_event(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsExtendedEventDescriptor): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsComponentStreamContent = ^TGstMpegtsComponentStreamContent;
  TGstMpegtsComponentStreamContent = longint;

const
  GST_MPEGTS_STREAM_CONTENT_MPEG2_VIDEO = $01;
  GST_MPEGTS_STREAM_CONTENT_MPEG1_LAYER2_AUDIO = $02;
  GST_MPEGTS_STREAM_CONTENT_TELETEXT_OR_SUBTITLE = $03;
  GST_MPEGTS_STREAM_CONTENT_AC_3 = $04;
  GST_MPEGTS_STREAM_CONTENT_AVC = $05;
  GST_MPEGTS_STREAM_CONTENT_AAC = $06;
  GST_MPEGTS_STREAM_CONTENT_DTS = $07;
  GST_MPEGTS_STREAM_CONTENT_SRM_CPCM = $08;

type
  TGstMpegtsComponentDescriptor = record
    stream_content: Tguint8;
    component_type: Tguint8;
    component_tag: Tguint8;
    language_code: Pgchar;
    Text: Pgchar;
  end;
  PGstMpegtsComponentDescriptor = ^TGstMpegtsComponentDescriptor;
  PPGstMpegtsComponentDescriptor = ^PGstMpegtsComponentDescriptor;

function gst_mpegts_component_descriptor_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_dvb_component_descriptor_free(Source: PGstMpegtsComponentDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_component(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsComponentDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_stream_identifier(descriptor: PGstMpegtsDescriptor; component_tag: Pguint8): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_ca_identifier(descriptor: PGstMpegtsDescriptor; list: PPGArray): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsContentNibbleHi = ^TGstMpegtsContentNibbleHi;
  TGstMpegtsContentNibbleHi = longint;

const
  GST_MPEGTS_CONTENT_MOVIE_DRAMA = $01;
  GST_MPEGTS_CONTENT_NEWS_CURRENT_AFFAIRS = $02;
  GST_MPEGTS_CONTENT_SHOW_GAME_SHOW = $03;
  GST_MPEGTS_CONTENT_SPORTS = $04;
  GST_MPEGTS_CONTENT_CHILDREN_YOUTH_PROGRAM = $05;
  GST_MPEGTS_CONTENT_MUSIC_BALLET_DANCE = $06;
  GST_MPEGTS_CONTENT_ARTS_CULTURE = $07;
  GST_MPEGTS_CONTENT_SOCIAL_POLITICAL_ECONOMICS = $08;
  GST_MPEGTS_CONTENT_EDUCATION_SCIENCE_FACTUAL = $09;
  GST_MPEGTS_CONTENT_LEISURE_HOBBIES = $0A;
  GST_MPEGTS_CONTENT_SPECIAL_CHARACTERISTICS = $0B;

type
  TGstMpegtsContent = record
    content_nibble_1: TGstMpegtsContentNibbleHi;
    content_nibble_2: Tguint8;
    user_byte: Tguint8;
  end;
  PGstMpegtsContent = ^TGstMpegtsContent;

function gst_mpegts_content_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_content(descriptor: PGstMpegtsDescriptor; content: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_dvb_parental_rating_item_get_type: TGType; cdecl; external libgstmpegts;

type
  TGstMpegtsDVBParentalRatingItem = record
    country_code: Pgchar;
    rating: Tguint8;
  end;
  PGstMpegtsDVBParentalRatingItem = ^TGstMpegtsDVBParentalRatingItem;

function gst_mpegts_descriptor_parse_dvb_parental_rating(descriptor: PGstMpegtsDescriptor; rating: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsDVBTeletextType = ^TGstMpegtsDVBTeletextType;
  TGstMpegtsDVBTeletextType = longint;

const
  INITIAL_PAGE = $01;
  SUBTITLE_PAGE = 2;
  ADDITIONAL_INFO_PAGE = 3;
  PROGRAMME_SCHEDULE_PAGE = 4;
  HEARING_IMPAIRED_PAGE = 5;

function gst_mpegts_descriptor_parse_dvb_teletext_idx(descriptor: PGstMpegtsDescriptor; idx: Tguint; language_code: PPgchar; teletext_type: PGstMpegtsDVBTeletextType; magazine_number: Pguint8;
  page_number: Pguint8): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_teletext_nb(descriptor: PGstMpegtsDescriptor): Tguint; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_subtitling_idx(descriptor: PGstMpegtsDescriptor; idx: Tguint; lang: PPgchar; _type: Pguint8; composition_page_id: Pguint16;
  ancillary_page_id: Pguint16): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_subtitling_nb(descriptor: PGstMpegtsDescriptor): Tguint; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_dvb_subtitling(lang: Pgchar; _type: Tguint8; composition: Tguint16; ancillary: Tguint16): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

type

  PGstMpegtsTerrestrialTransmissionMode = ^TGstMpegtsTerrestrialTransmissionMode;
  TGstMpegtsTerrestrialTransmissionMode = longint;

const
  GST_MPEGTS_TRANSMISSION_MODE_2K = 0;
  GST_MPEGTS_TRANSMISSION_MODE_8K = 1;
  GST_MPEGTS_TRANSMISSION_MODE_AUTO = 2;
  GST_MPEGTS_TRANSMISSION_MODE_4K = 3;
  GST_MPEGTS_TRANSMISSION_MODE_1K = 4;
  GST_MPEGTS_TRANSMISSION_MODE_16K = 5;
  GST_MPEGTS_TRANSMISSION_MODE_32K = 6;
  GST_MPEGTS_TRANSMISSION_MODE_C1 = 7;
  GST_MPEGTS_TRANSMISSION_MODE_C3780 = 8;

type
  PGstMpegtsTerrestrialGuardInterval = ^TGstMpegtsTerrestrialGuardInterval;
  TGstMpegtsTerrestrialGuardInterval = longint;

const
  GST_MPEGTS_GUARD_INTERVAL_1_32 = 0;
  GST_MPEGTS_GUARD_INTERVAL_1_16 = 1;
  GST_MPEGTS_GUARD_INTERVAL_1_8 = 2;
  GST_MPEGTS_GUARD_INTERVAL_1_4 = 3;
  GST_MPEGTS_GUARD_INTERVAL_AUTO = 4;
  GST_MPEGTS_GUARD_INTERVAL_1_128 = 5;
  GST_MPEGTS_GUARD_INTERVAL_19_128 = 6;
  GST_MPEGTS_GUARD_INTERVAL_19_256 = 7;
  GST_MPEGTS_GUARD_INTERVAL_PN420 = 8;
  GST_MPEGTS_GUARD_INTERVAL_PN595 = 9;
  GST_MPEGTS_GUARD_INTERVAL_PN945 = 10;

type
  PGstMpegtsTerrestrialHierarchy = ^TGstMpegtsTerrestrialHierarchy;
  TGstMpegtsTerrestrialHierarchy = longint;

const
  GST_MPEGTS_HIERARCHY_NONE = 0;
  GST_MPEGTS_HIERARCHY_1 = 1;
  GST_MPEGTS_HIERARCHY_2 = 2;
  GST_MPEGTS_HIERARCHY_4 = 3;
  GST_MPEGTS_HIERARCHY_AUTO = 4;

type
  TGstMpegtsTerrestrialDeliverySystemDescriptor = record
    frequency: Tguint32;
    bandwidth: Tguint32;
    priority: Tgboolean;
    time_slicing: Tgboolean;
    mpe_fec: Tgboolean;
    constellation: TGstMpegtsModulationType;
    hierarchy: TGstMpegtsTerrestrialHierarchy;
    code_rate_hp: TGstMpegtsDVBCodeRate;
    code_rate_lp: TGstMpegtsDVBCodeRate;
    guard_interval: TGstMpegtsTerrestrialGuardInterval;
    transmission_mode: TGstMpegtsTerrestrialTransmissionMode;
    other_frequency: Tgboolean;
  end;
  PGstMpegtsTerrestrialDeliverySystemDescriptor = ^TGstMpegtsTerrestrialDeliverySystemDescriptor;

function gst_mpegts_terrestrial_delivery_system_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_terrestrial_delivery_system(descriptor: PGstMpegtsDescriptor; res: PGstMpegtsTerrestrialDeliverySystemDescriptor): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsDvbMultilingualNetworkNameItem = record
    language_code: Pgchar;
    network_name: Pgchar;
  end;
  PGstMpegtsDvbMultilingualNetworkNameItem = ^TGstMpegtsDvbMultilingualNetworkNameItem;

function gst_mpegts_dvb_multilingual_network_name_item_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_multilingual_network_name(descriptor: PGstMpegtsDescriptor; network_name_items: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsDvbMultilingualBouquetNameItem = record
    language_code: Pgchar;
    bouquet_name: Pgchar;
  end;
  PGstMpegtsDvbMultilingualBouquetNameItem = ^TGstMpegtsDvbMultilingualBouquetNameItem;

function gst_mpegts_dvb_multilingual_bouquet_name_item_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_multilingual_bouquet_name(descriptor: PGstMpegtsDescriptor; bouquet_name_items: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsDvbMultilingualServiceNameItem = record
    language_code: Pgchar;
    provider_name: Pgchar;
    service_name: Pgchar;
  end;
  PGstMpegtsDvbMultilingualServiceNameItem = ^TGstMpegtsDvbMultilingualServiceNameItem;

function gst_mpegts_dvb_multilingual_service_name_item_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_multilingual_service_name(descriptor: PGstMpegtsDescriptor; service_name_items: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsDvbMultilingualComponentItem = record
    language_code: Pgchar;
    description: Pgchar;
  end;
  PGstMpegtsDvbMultilingualComponentItem = ^TGstMpegtsDvbMultilingualComponentItem;


function gst_mpegts_dvb_multilingual_component_item_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_multilingual_component(descriptor: PGstMpegtsDescriptor; component_tag: Pguint8; component_description_items: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_private_data_specifier(descriptor: PGstMpegtsDescriptor; private_data_specifier: Pguint32; private_data: PPguint8; length: Pguint8): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_frequency_list(descriptor: PGstMpegtsDescriptor; offset: Pgboolean; list: PPGArray): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsDataBroadcastDescriptor = record
    data_broadcast_id: Tguint16;
    component_tag: Tguint8;
    length: Tguint8;
    selector_bytes: Pguint8;
    language_code: Pgchar;
    Text: Pgchar;
  end;
  PGstMpegtsDataBroadcastDescriptor = ^TGstMpegtsDataBroadcastDescriptor;
  PPGstMpegtsDataBroadcastDescriptor = ^PGstMpegtsDataBroadcastDescriptor;

function gst_mpegts_dvb_data_broadcast_descriptor_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_dvb_data_broadcast_descriptor_free(Source: PGstMpegtsDataBroadcastDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_data_broadcast(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsDataBroadcastDescriptor): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsDVBScramblingModeType = ^TGstMpegtsDVBScramblingModeType;
  TGstMpegtsDVBScramblingModeType = longint;

const
  GST_MPEGTS_DVB_SCRAMBLING_MODE_RESERVED = $00;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_CSA1 = $01;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_CSA2 = $02;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_CSA3_STANDARD = $03;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_CSA3_MINIMAL_ENHANCED = $04;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_CSA3_FULL_ENHANCED = $05;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_CISSA = $10;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_ATIS_0 = $70;
  GST_MPEGTS_DVB_SCRAMBLING_MODE_ATIS_F = $7f;

function gst_mpegts_descriptor_parse_dvb_scrambling(descriptor: PGstMpegtsDescriptor; scrambling_mode: PGstMpegtsDVBScramblingModeType): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_data_broadcast_id(descriptor: PGstMpegtsDescriptor; data_broadcast_id: Pguint16; id_selector_bytes: PPguint8; len: Pguint8): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsT2DeliverySystemCellExtension = record
    cell_id_extension: Tguint8;
    transposer_frequency: Tguint32;
  end;
  PGstMpegtsT2DeliverySystemCellExtension = ^TGstMpegtsT2DeliverySystemCellExtension;

function gst_mpegts_t2_delivery_system_cell_extension_get_type: TGType; cdecl; external libgstmpegts;

type
  TGstMpegtsT2DeliverySystemCell = record
    cell_id: Tguint16;
    centre_frequencies: PGArray;
    sub_cells: PGPtrArray;
  end;
  PGstMpegtsT2DeliverySystemCell = ^TGstMpegtsT2DeliverySystemCell;

function gst_mpegts_t2_delivery_system_cell_get_type: TGType; cdecl; external libgstmpegts;

type
  TGstMpegtsT2DeliverySystemDescriptor = record
    plp_id: Tguint8;
    t2_system_id: Tguint16;
    siso_miso: Tguint8;
    bandwidth: Tguint32;
    guard_interval: TGstMpegtsTerrestrialGuardInterval;
    transmission_mode: TGstMpegtsTerrestrialTransmissionMode;
    other_frequency: Tgboolean;
    tfs: Tgboolean;
    cells: PGPtrArray;
  end;
  PGstMpegtsT2DeliverySystemDescriptor = ^TGstMpegtsT2DeliverySystemDescriptor;
  PPGstMpegtsT2DeliverySystemDescriptor = ^PGstMpegtsT2DeliverySystemDescriptor;

function gst_mpegts_t2_delivery_system_descriptor_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_t2_delivery_system_descriptor_free(Source: PGstMpegtsT2DeliverySystemDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_dvb_t2_delivery_system(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsT2DeliverySystemDescriptor): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsAudioPreselectionDescriptor = record
    preselection_id: Tguint8;
    audio_rendering_indication: Tguint8;
    audio_description: Tgboolean;
    spoken_subtitles: Tgboolean;
    dialogue_enhancement: Tgboolean;
    interactivity_enabled: Tgboolean;
    language_code_present: Tgboolean;
    text_label_present: Tgboolean;
    multi_stream_info_present: Tgboolean;
    future_extension: Tgboolean;
    language_code: Pgchar;
    message_id: Tguint8;
  end;
  PGstMpegtsAudioPreselectionDescriptor = ^TGstMpegtsAudioPreselectionDescriptor;

function gst_mpegts_descriptor_parse_audio_preselection_list(descriptor: PGstMpegtsDescriptor; list: PPGPtrArray): Tgboolean; cdecl; external libgstmpegts;
procedure gst_mpegts_descriptor_parse_audio_preselection_free(Source: PGstMpegtsAudioPreselectionDescriptor); cdecl; external libgstmpegts;
procedure gst_mpegts_descriptor_parse_audio_preselection_dump(Source: PGstMpegtsAudioPreselectionDescriptor); cdecl; external libgstmpegts;

function GST_TYPE_MPEGTS_SATELLITE_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_DVB_CABLE_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_DVB_SERVICE_LIST_ITEM: TGType;
function GST_TYPE_MPEGTS_DVB_LINKAGE_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_DVB_LINKAGE_MOBILE_HAND_OVER: TGType;
function GST_TYPE_MPEGTS_DVB_LINKAGE_EVENT: TGType;
function GST_TYPE_MPEGTS_DVB_LINKAGE_EXTENDED_EVENT: TGType;
function GST_TYPE_MPEGTS_EXTENDED_EVENT_ITEM: TGType;
function GST_TYPE_MPEGTS_EXTENDED_EVENT_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_COMPONENT_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_CONTENT: TGType;
function GST_TYPE_MPEGTS_DVB_PARENTAL_RATING_ITEM: TGType;
function GST_TYPE_MPEGTS_TERRESTRIAL_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_NETWORK_NAME_ITEM: TGType;
function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_BOUQUET_NAME_ITEM: TGType;
function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_SERVICE_NAME_ITEM: TGType;
function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_COMPONENT_ITEM: TGType;
function GST_TYPE_MPEGTS_DVB_DATA_BROADCAST_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_CELL_EXTENSION: TGType;
function GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_CELL: TGType;
function GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_DESCRIPTOR: TGType;

// === Konventiert am: 6-10-24 16:39:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_MPEGTS_SATELLITE_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_SATELLITE_DELIVERY_SYSTEM_DESCRIPTOR := gst_mpegts_satellite_delivery_system_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_DVB_CABLE_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
begin
  // im C-Header verdreht
//  GST_TYPE_MPEGTS_DVB_CABLE_DELIVERY_SYSTEM_DESCRIPTOR := gst_mpegts_dvb_cable_system_delivery_descriptor_get_type;
  GST_TYPE_MPEGTS_DVB_CABLE_DELIVERY_SYSTEM_DESCRIPTOR := gst_mpegts_dvb_cable_delivery_system_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_DVB_SERVICE_LIST_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_DVB_SERVICE_LIST_ITEM := gst_mpegts_dvb_service_list_item_get_type;
end;

function GST_TYPE_MPEGTS_DVB_LINKAGE_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_DVB_LINKAGE_DESCRIPTOR := gst_mpegts_dvb_linkage_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_DVB_LINKAGE_MOBILE_HAND_OVER: TGType;
begin
  GST_TYPE_MPEGTS_DVB_LINKAGE_MOBILE_HAND_OVER := gst_mpegts_dvb_linkage_mobile_hand_over_get_type;
end;

function GST_TYPE_MPEGTS_DVB_LINKAGE_EVENT: TGType;
begin
  GST_TYPE_MPEGTS_DVB_LINKAGE_EVENT := gst_mpegts_dvb_linkage_event_get_type;
end;

function GST_TYPE_MPEGTS_DVB_LINKAGE_EXTENDED_EVENT: TGType;
begin
  GST_TYPE_MPEGTS_DVB_LINKAGE_EXTENDED_EVENT := gst_mpegts_dvb_linkage_extended_event_get_type;
end;

function GST_TYPE_MPEGTS_EXTENDED_EVENT_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_EXTENDED_EVENT_ITEM := gst_mpegts_extended_event_item_get_type;
end;

function GST_TYPE_MPEGTS_EXTENDED_EVENT_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_EXTENDED_EVENT_DESCRIPTOR := gst_mpegts_extended_event_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_COMPONENT_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_COMPONENT_DESCRIPTOR := gst_mpegts_component_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_CONTENT: TGType;
begin
  GST_TYPE_MPEGTS_CONTENT := gst_mpegts_content_get_type;
end;

function GST_TYPE_MPEGTS_DVB_PARENTAL_RATING_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_DVB_PARENTAL_RATING_ITEM := gst_mpegts_dvb_parental_rating_item_get_type;
end;

function GST_TYPE_MPEGTS_TERRESTRIAL_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_TERRESTRIAL_DELIVERY_SYSTEM_DESCRIPTOR := gst_mpegts_terrestrial_delivery_system_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_NETWORK_NAME_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_DVB_MULTILINGUAL_NETWORK_NAME_ITEM := gst_mpegts_dvb_multilingual_network_name_item_get_type;
end;

function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_BOUQUET_NAME_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_DVB_MULTILINGUAL_BOUQUET_NAME_ITEM := gst_mpegts_dvb_multilingual_bouquet_name_item_get_type;
end;

function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_SERVICE_NAME_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_DVB_MULTILINGUAL_SERVICE_NAME_ITEM := gst_mpegts_dvb_multilingual_service_name_item_get_type;
end;

function GST_TYPE_MPEGTS_DVB_MULTILINGUAL_COMPONENT_ITEM: TGType;
begin
  GST_TYPE_MPEGTS_DVB_MULTILINGUAL_COMPONENT_ITEM := gst_mpegts_dvb_multilingual_component_item_get_type;
end;

function GST_TYPE_MPEGTS_DVB_DATA_BROADCAST_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_DVB_DATA_BROADCAST_DESCRIPTOR := gst_mpegts_dvb_data_broadcast_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_CELL_EXTENSION: TGType;
begin
  GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_CELL_EXTENSION := gst_mpegts_t2_delivery_system_cell_extension_get_type;
end;

function GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_CELL: TGType;
begin
  GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_CELL := gst_mpegts_t2_delivery_system_cell_get_type;
end;

function GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_T2_DELIVERY_SYSTEM_DESCRIPTOR := gst_mpegts_t2_delivery_system_descriptor_get_type;
end;


{$ENDIF read_implementation}
