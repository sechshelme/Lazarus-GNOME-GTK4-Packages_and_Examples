/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 13-10-2024   13:44                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstSctpSendMetaPartiallyReliability = ^TGstSctpSendMetaPartiallyReliability;
  TGstSctpSendMetaPartiallyReliability = longint;

const
  GST_SCTP_SEND_META_PARTIAL_RELIABILITY_NONE = 0;
  GST_SCTP_SEND_META_PARTIAL_RELIABILITY_TTL = 1;
  GST_SCTP_SEND_META_PARTIAL_RELIABILITY_BUF = 2;
  GST_SCTP_SEND_META_PARTIAL_RELIABILITY_RTX = 3;

type
  TGstSctpSendMeta = record
    meta: TGstMeta;
    ppid: Tguint32;
    ordered: Tgboolean;
    pr: TGstSctpSendMetaPartiallyReliability;
    pr_param: Tguint32;
  end;
  PGstSctpSendMeta = ^TGstSctpSendMeta;

function gst_sctp_send_meta_api_get_type: TGType; cdecl; external libgstsctp;
function gst_sctp_send_meta_get_info: PGstMetaInfo; cdecl; external libgstsctp;
function gst_sctp_buffer_add_send_meta(buffer: PGstBuffer; ppid: Tguint32; ordered: Tgboolean; pr: TGstSctpSendMetaPartiallyReliability; pr_param: Tguint32): PGstSctpSendMeta; cdecl; external libgstsctp;

function gst_sctp_buffer_get_send_meta(b: PGstBuffer): PGstSctpSendMeta;

function GST_SCTP_SEND_META_INFO: PGstMetaInfo;

// === Konventiert am: 13-10-24 13:02:21 ===

function GST_SCTP_SEND_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_SCTP_SEND_META_API_TYPE: TGType;
begin
  GST_SCTP_SEND_META_API_TYPE := gst_sctp_send_meta_api_get_type;
end;


function GST_SCTP_SEND_META_INFO: PGstMetaInfo;
begin
  GST_SCTP_SEND_META_INFO := gst_sctp_send_meta_get_info;
end;

function gst_sctp_buffer_get_send_meta(b: PGstBuffer): PGstSctpSendMeta;
begin
  gst_sctp_buffer_get_send_meta := PGstSctpSendMeta(gst_buffer_get_meta(b, GST_SCTP_SEND_META_API_TYPE));
end;


{$ENDIF read_implementation}
