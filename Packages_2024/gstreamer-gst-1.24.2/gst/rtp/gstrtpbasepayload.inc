
{$IFDEF read_interface}

type
  TGstRTPBasePayloadPrivate=record
        end;
  PGstRTPBasePayloadPrivate=^TGstRTPBasePayloadPrivate;

  TGstRTPBasePayload = record
      element : TGstElement;
      sinkpad : PGstPad;
      srcpad : PGstPad;
      ts_base : Tguint32;
      seqnum_base : Tguint16;
      media : Pgchar;
      encoding_name : Pgchar;
      dynamic : Tgboolean;
      clock_rate : Tguint32;
      ts_offset : Tgint32;
      timestamp : Tguint32;
      seqnum_offset : Tgint16;
      seqnum : Tguint16;
      max_ptime : Tgint64;
      pt : Tguint;
      ssrc : Tguint;
      current_ssrc : Tguint;
      mtu : Tguint;
      segment : TGstSegment;
      min_ptime : Tguint64;
      ptime : Tguint64;
      ptime_multiple : Tguint64;
      priv : PGstRTPBasePayloadPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstRTPBasePayload = ^TGstRTPBasePayload;

  TGstRTPBasePayloadClass = record
      parent_class : TGstElementClass;
      get_caps : function (payload:PGstRTPBasePayload; pad:PGstPad; filter:PGstCaps):PGstCaps;cdecl;
      set_caps : function (payload:PGstRTPBasePayload; caps:PGstCaps):Tgboolean;cdecl;
      handle_buffer : function (payload:PGstRTPBasePayload; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      sink_event : function (payload:PGstRTPBasePayload; event:PGstEvent):Tgboolean;cdecl;
      src_event : function (payload:PGstRTPBasePayload; event:PGstEvent):Tgboolean;cdecl;
      query : function (payload:PGstRTPBasePayload; pad:PGstPad; query:PGstQuery):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstRTPBasePayloadClass = ^TGstRTPBasePayloadClass;


function gst_rtp_base_payload_get_type: TGType; cdecl; external libgstrtp;
procedure gst_rtp_base_payload_set_options(payload: PGstRTPBasePayload; media: Pgchar; dynamic: Tgboolean; encoding_name: Pgchar; clock_rate: Tguint32); cdecl; external libgstrtp;
function gst_rtp_base_payload_set_outcaps(payload: PGstRTPBasePayload; fieldname: Pgchar): Tgboolean; varargs; cdecl; external libgstrtp;
function gst_rtp_base_payload_set_outcaps_structure(payload: PGstRTPBasePayload; s: PGstStructure): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_base_payload_is_filled(payload: PGstRTPBasePayload; size: Tguint; duration: TGstClockTime): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_base_payload_push(payload: PGstRTPBasePayload; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstrtp;
function gst_rtp_base_payload_push_list(payload: PGstRTPBasePayload; list: PGstBufferList): TGstFlowReturn; cdecl; external libgstrtp;
function gst_rtp_base_payload_allocate_output_buffer(payload: PGstRTPBasePayload; payload_len: Tguint; pad_len: Tguint8; csrc_count: Tguint8): PGstBuffer; cdecl; external libgstrtp;
procedure gst_rtp_base_payload_set_source_info_enabled(payload: PGstRTPBasePayload; enable: Tgboolean); cdecl; external libgstrtp;
function gst_rtp_base_payload_is_source_info_enabled(payload: PGstRTPBasePayload): Tgboolean; cdecl; external libgstrtp;
function gst_rtp_base_payload_get_source_count(payload: PGstRTPBasePayload; buffer: PGstBuffer): Tguint; cdecl; external libgstrtp;

function GST_RTP_BASE_PAYLOAD_CAST(obj : Pointer) : PGstRTPBasePayload;
function GST_RTP_BASE_PAYLOAD_SINKPAD(payload : Pointer) : PGstPad;
function GST_RTP_BASE_PAYLOAD_SRCPAD(payload : Pointer) : PGstPad;
function GST_RTP_BASE_PAYLOAD_PT(payload : Pointer) : Tguint;
function GST_RTP_BASE_PAYLOAD_MTU(payload : Pointer) : Tguint;

// === Konventiert am: 7-10-24 16:09:24 ===

function GST_TYPE_RTP_BASE_PAYLOAD : TGType;
function GST_RTP_BASE_PAYLOAD(obj : Pointer) : PGstRTPBasePayload;
function GST_RTP_BASE_PAYLOAD_CLASS(klass : Pointer) : PGstRTPBasePayloadClass;
function GST_IS_RTP_BASE_PAYLOAD(obj : Pointer) : Tgboolean;
function GST_IS_RTP_BASE_PAYLOAD_CLASS(klass : Pointer) : Tgboolean;
function GST_RTP_BASE_PAYLOAD_GET_CLASS(obj : Pointer) : PGstRTPBasePayloadClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTP_BASE_PAYLOAD : TGType;
  begin
    GST_TYPE_RTP_BASE_PAYLOAD:=gst_rtp_base_payload_get_type;
  end;

function GST_RTP_BASE_PAYLOAD(obj : Pointer) : PGstRTPBasePayload;
begin
  Result := PGstRTPBasePayload(g_type_check_instance_cast(obj, GST_TYPE_RTP_BASE_PAYLOAD));
end;

function GST_RTP_BASE_PAYLOAD_CLASS(klass : Pointer) : PGstRTPBasePayloadClass;
begin
  Result := PGstRTPBasePayloadClass(g_type_check_class_cast(klass, GST_TYPE_RTP_BASE_PAYLOAD));
end;

function GST_IS_RTP_BASE_PAYLOAD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_RTP_BASE_PAYLOAD);
end;

function GST_IS_RTP_BASE_PAYLOAD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_RTP_BASE_PAYLOAD);
end;

function GST_RTP_BASE_PAYLOAD_GET_CLASS(obj : Pointer) : PGstRTPBasePayloadClass;
begin
  Result := PGstRTPBasePayloadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_RTP_BASE_PAYLOAD_CAST(obj: Pointer): PGstRTPBasePayload;
begin
  GST_RTP_BASE_PAYLOAD_CAST:=PGstRTPBasePayload(obj);
end;

function GST_RTP_BASE_PAYLOAD_SINKPAD(payload: Pointer): PGstPad;
begin
  GST_RTP_BASE_PAYLOAD_SINKPAD:=GST_RTP_BASE_PAYLOAD(payload)^.sinkpad;
end;

function GST_RTP_BASE_PAYLOAD_SRCPAD(payload: Pointer): PGstPad;
begin
  GST_RTP_BASE_PAYLOAD_SRCPAD:=(GST_RTP_BASE_PAYLOAD(payload))^.srcpad;
end;

function GST_RTP_BASE_PAYLOAD_PT(payload: Pointer): Tguint;
begin
  GST_RTP_BASE_PAYLOAD_PT:=(GST_RTP_BASE_PAYLOAD(payload))^.pt;
end;

function GST_RTP_BASE_PAYLOAD_MTU(payload: Pointer): Tguint;
begin
  GST_RTP_BASE_PAYLOAD_MTU:=(GST_RTP_BASE_PAYLOAD(payload))^.mtu;
end;


{$ENDIF read_implementation}
