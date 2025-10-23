
{$IFDEF read_interface}

type
  TGstRTPBaseAudioPayloadPrivate = record
  end;
  PGstRTPBaseAudioPayloadPrivate = ^TGstRTPBaseAudioPayloadPrivate;

  TGstRTPBaseAudioPayload = record
    payload: TGstRTPBasePayload;
    priv: PGstRTPBaseAudioPayloadPrivate;
    base_ts: TGstClockTime;
    frame_size: Tgint;
    frame_duration: Tgint;
    sample_size: Tgint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstRTPBaseAudioPayload = ^TGstRTPBaseAudioPayload;

  TGstRTPBaseAudioPayloadClass = record
    parent_class: TGstRTPBasePayloadClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstRTPBaseAudioPayloadClass = ^TGstRTPBaseAudioPayloadClass;

function gst_rtp_base_audio_payload_get_type: TGType; cdecl; external libgstrtp;
procedure gst_rtp_base_audio_payload_set_frame_based(rtpbaseaudiopayload: PGstRTPBaseAudioPayload); cdecl; external libgstrtp;
procedure gst_rtp_base_audio_payload_set_frame_options(rtpbaseaudiopayload: PGstRTPBaseAudioPayload; frame_duration: Tgint; frame_size: Tgint); cdecl; external libgstrtp;
procedure gst_rtp_base_audio_payload_set_sample_based(rtpbaseaudiopayload: PGstRTPBaseAudioPayload); cdecl; external libgstrtp;
procedure gst_rtp_base_audio_payload_set_sample_options(rtpbaseaudiopayload: PGstRTPBaseAudioPayload; sample_size: Tgint); cdecl; external libgstrtp;
procedure gst_rtp_base_audio_payload_set_samplebits_options(rtpbaseaudiopayload: PGstRTPBaseAudioPayload; sample_size: Tgint); cdecl; external libgstrtp;
function gst_rtp_base_audio_payload_get_adapter(rtpbaseaudiopayload: PGstRTPBaseAudioPayload): PGstAdapter; cdecl; external libgstrtp;
function gst_rtp_base_audio_payload_push(baseaudiopayload: PGstRTPBaseAudioPayload; Data: Pguint8; payload_len: Tguint; timestamp: TGstClockTime): TGstFlowReturn; cdecl; external libgstrtp;
function gst_rtp_base_audio_payload_flush(baseaudiopayload: PGstRTPBaseAudioPayload; payload_len: Tguint; timestamp: TGstClockTime): TGstFlowReturn; cdecl; external libgstrtp;

function GST_RTP_BASE_AUDIO_PAYLOAD_CAST(obj: Pointer): PGstRTPBaseAudioPayload;

// === Konventiert am: 7-10-24 16:08:43 ===

function GST_TYPE_RTP_BASE_AUDIO_PAYLOAD: TGType;
function GST_RTP_BASE_AUDIO_PAYLOAD(obj: Pointer): PGstRTPBaseAudioPayload;
function GST_RTP_BASE_AUDIO_PAYLOAD_CLASS(klass: Pointer): PGstRTPBaseAudioPayloadClass;
function GST_IS_RTP_BASE_AUDIO_PAYLOAD(obj: Pointer): Tgboolean;
function GST_IS_RTP_BASE_AUDIO_PAYLOAD_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTP_BASE_AUDIO_PAYLOAD: TGType;
begin
  GST_TYPE_RTP_BASE_AUDIO_PAYLOAD := gst_rtp_base_audio_payload_get_type;
end;

function GST_RTP_BASE_AUDIO_PAYLOAD(obj: Pointer): PGstRTPBaseAudioPayload;
begin
  Result := PGstRTPBaseAudioPayload(g_type_check_instance_cast(obj, GST_TYPE_RTP_BASE_AUDIO_PAYLOAD));
end;

function GST_RTP_BASE_AUDIO_PAYLOAD_CLASS(klass: Pointer): PGstRTPBaseAudioPayloadClass;
begin
  Result := PGstRTPBaseAudioPayloadClass(g_type_check_class_cast(klass, GST_TYPE_RTP_BASE_AUDIO_PAYLOAD));
end;

function GST_IS_RTP_BASE_AUDIO_PAYLOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTP_BASE_AUDIO_PAYLOAD);
end;

function GST_IS_RTP_BASE_AUDIO_PAYLOAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTP_BASE_AUDIO_PAYLOAD);
end;

// Pointer

function GST_RTP_BASE_AUDIO_PAYLOAD_CAST(obj: Pointer): PGstRTPBaseAudioPayload;
begin
  GST_RTP_BASE_AUDIO_PAYLOAD_CAST := PGstRTPBaseAudioPayload(obj);
end;


{$ENDIF read_implementation}
