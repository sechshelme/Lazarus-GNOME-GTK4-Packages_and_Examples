/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_mpegts_pes_metadata_meta_api_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_pes_metadata_meta_get_info: PGstMetaInfo; cdecl; external libgstmpegts;

type
  TGstMpegtsPESMetadataMeta = record
    meta: TGstMeta;
    metadata_service_id: Tguint8;
    flags: Tguint8;
  end;
  PGstMpegtsPESMetadataMeta = ^TGstMpegtsPESMetadataMeta;

function gst_buffer_add_mpegts_pes_metadata_meta(buffer: PGstBuffer): PGstMpegtsPESMetadataMeta; cdecl; external libgstmpegts;

function GST_MPEGTS_PES_METADATA_META_API_TYPE: TGType;
function GST_MPEGTS_PES_METADATA_META_INFO: PGstMetaInfo;

// === Konventiert am: 6-10-24 16:39:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_MPEGTS_PES_METADATA_META_API_TYPE: TGType;
begin
  GST_MPEGTS_PES_METADATA_META_API_TYPE := gst_mpegts_pes_metadata_meta_api_get_type;
end;

function GST_MPEGTS_PES_METADATA_META_INFO: PGstMetaInfo;
begin
  GST_MPEGTS_PES_METADATA_META_INFO := gst_mpegts_pes_metadata_meta_get_info;
end;


{$ENDIF read_implementation}
