/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 13-10-2024   13:44                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstSctpReceiveMeta = ^TGstSctpReceiveMeta;

  TGstSctpReceiveMeta = record
    meta: TGstMeta;
    ppid: Tguint32;
  end;


function gst_sctp_receive_meta_api_get_type: TGType; cdecl; external libgstsctp;
function gst_sctp_receive_meta_get_info: PGstMetaInfo; cdecl; external libgstsctp;
function gst_sctp_buffer_add_receive_meta(buffer: PGstBuffer; ppid: Tguint32): PGstSctpReceiveMeta; cdecl; external libgstsctp;

function GST_SCTP_RECEIVE_META_INFO: PGstMetaInfo;
function gst_sctp_buffer_get_receive_meta(b: PGstBuffer): PGstSctpReceiveMeta;

// === Konventiert am: 13-10-24 13:02:16 ===

function GST_SCTP_RECEIVE_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_SCTP_RECEIVE_META_API_TYPE: TGType;
begin
  GST_SCTP_RECEIVE_META_API_TYPE := gst_sctp_receive_meta_api_get_type;
end;

function GST_SCTP_RECEIVE_META_INFO: PGstMetaInfo;
begin
  GST_SCTP_RECEIVE_META_INFO := gst_sctp_receive_meta_get_info;
end;

function gst_sctp_buffer_get_receive_meta(b: PGstBuffer): PGstSctpReceiveMeta;
begin
  gst_sctp_buffer_get_receive_meta := PGstSctpReceiveMeta(gst_buffer_get_meta(b, GST_SCTP_RECEIVE_META_API_TYPE));
end;


{$ENDIF read_implementation}
