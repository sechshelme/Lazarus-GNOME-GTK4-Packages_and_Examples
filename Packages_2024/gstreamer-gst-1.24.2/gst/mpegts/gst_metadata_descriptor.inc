
{$IFDEF read_interface}

type
  PGstMpegtsMetadataFormat = ^TGstMpegtsMetadataFormat;
  TGstMpegtsMetadataFormat = longint;

const
  GST_MPEGTS_METADATA_FORMAT_TEM = $10;
  GST_MPEGTS_METADATA_FORMAT_BIM = $11;
  GST_MPEGTS_METADATA_FORMAT_APPLICATION_FORMAT = $3f;
  GST_MPEGTS_METADATA_FORMAT_IDENTIFIER_FIELD = $ff;

type
  TGstMpegtsMetadataDescriptor = record
    metadata_application_format: Tguint16;
    metadata_format: TGstMpegtsMetadataFormat;
    metadata_format_identifier: Tguint32;
    metadata_service_id: Tguint8;
    decoder_config_flags: Tguint8;
    dsm_cc_flag: Tgboolean;
  end;
  PGstMpegtsMetadataDescriptor = ^TGstMpegtsMetadataDescriptor;
  PPGstMpegtsMetadataDescriptor = ^PGstMpegtsMetadataDescriptor;

function gst_mpegts_metadata_descriptor_get_type: TGType; cdecl; external libgstmpegts;

function GST_TYPE_MPEGTS_METADATA_DESCRIPTOR: TGType;

// === Konventiert am: 6-10-24 16:39:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_MPEGTS_METADATA_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_METADATA_DESCRIPTOR := gst_mpegts_metadata_descriptor_get_type;
end;


{$ENDIF read_implementation}
