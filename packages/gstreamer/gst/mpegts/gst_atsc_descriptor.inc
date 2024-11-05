/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstMpegtsATSCDescriptorType = ^TGstMpegtsATSCDescriptorType;
  TGstMpegtsATSCDescriptorType = longint;

const
  GST_MTS_DESC_ATSC_STUFFING = $80;
  GST_MTS_DESC_ATSC_AC3 = $81;
  GST_MTS_DESC_ATSC_CAPTION_SERVICE = $86;
  GST_MTS_DESC_ATSC_CONTENT_ADVISORY = $87;
  GST_MTS_DESC_ATSC_EXTENDED_CHANNEL_NAME = $A0;
  GST_MTS_DESC_ATSC_SERVICE_LOCATION = $A1;
  GST_MTS_DESC_ATSC_TIME_SHIFTED_SERVICE = $A2;
  GST_MTS_DESC_ATSC_COMPONENT_NAME = $A3;
  GST_MTS_DESC_ATSC_DCC_DEPARTING_REQUEST = $A8;
  GST_MTS_DESC_ATSC_DCC_ARRIVING_REQUEST = $A9;
  GST_MTS_DESC_ATSC_REDISTRIBUTION_CONTROL = $AA;
  GST_MTS_DESC_ATSC_GENRE = $AB;
  GST_MTS_DESC_ATSC_PRIVATE_INFORMATION = $AD;
  GST_MTS_DESC_ATSC_EAC3 = $CC;
  GST_MTS_DESC_ATSC_ENHANCED_SIGNALING = $B2;
  GST_MTS_DESC_ATSC_DATA_SERVICE = $A4;
  GST_MTS_DESC_ATSC_PID_COUNT = $A5;
  GST_MTS_DESC_ATSC_DOWNLOAD_DESCRIPTOR = $A6;
  GST_MTS_DESC_ATSC_MULTIPROTOCOL_ENCAPSULATION = $A7;
  GST_MTS_DESC_ATSC_MODULE_LINK = $B4;
  GST_MTS_DESC_ATSC_CRC32 = $B5;
  GST_MTS_DESC_ATSC_GROUP_LINK = $B8;
  GST_MTS_DESC_AC3_AUDIO_STREAM = GST_MTS_DESC_ATSC_AC3;

  // === Konventiert am: 6-10-24 16:39:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
