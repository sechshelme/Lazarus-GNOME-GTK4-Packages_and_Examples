
{$IFDEF read_interface}

type
  TGstRTPBaseDepayloadPrivate = record
  end;
  PGstRTPBaseDepayloadPrivate = ^TGstRTPBaseDepayloadPrivate;

  TGstRTPBaseDepayload = record
    parent: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    clock_rate: Tguint;
    segment: TGstSegment;
    need_newsegment: Tgboolean;
    priv: PGstRTPBaseDepayloadPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstRTPBaseDepayload = ^TGstRTPBaseDepayload;

  PGstRTPBaseDepayloadClass = ^TGstRTPBaseDepayloadClass;

  TGstRTPBaseDepayloadClass = record
    parent_class: TGstElementClass;
    set_caps: function(filter: PGstRTPBaseDepayload; caps: PGstCaps): Tgboolean; cdecl;
    process: function(base: PGstRTPBaseDepayload; in_: PGstBuffer): PGstBuffer; cdecl;
    packet_lost: function(filter: PGstRTPBaseDepayload; event: PGstEvent): Tgboolean; cdecl;
    handle_event: function(filter: PGstRTPBaseDepayload; event: PGstEvent): Tgboolean; cdecl;
    process_rtp_packet: function(base: PGstRTPBaseDepayload; rtp_buffer: PGstRTPBuffer): PGstBuffer; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;


function gst_rtp_base_depayload_get_type: TGType; cdecl; external libgstrtp;
function gst_rtp_base_depayload_push(filter: PGstRTPBaseDepayload; out_buf: PGstBuffer): TGstFlowReturn; cdecl; external libgstrtp;
function gst_rtp_base_depayload_push_list(filter: PGstRTPBaseDepayload; out_list: PGstBufferList): TGstFlowReturn; cdecl; external libgstrtp;
function gst_rtp_base_depayload_is_source_info_enabled(depayload: PGstRTPBaseDepayload): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_base_depayload_set_source_info_enabled(depayload: PGstRTPBaseDepayload; enable: Tgboolean); cdecl; external libgstrtp;
procedure gst_rtp_base_depayload_dropped(depayload: PGstRTPBaseDepayload); cdecl; external libgstrtp;
procedure gst_rtp_base_depayload_delayed(depayload: PGstRTPBaseDepayload); cdecl; external libgstrtp;
procedure gst_rtp_base_depayload_flush(depayload: PGstRTPBaseDepayload; keep_current: Tgboolean); cdecl; external libgstrtp;
function gst_rtp_base_depayload_is_aggregate_hdrext_enabled(depayload: PGstRTPBaseDepayload): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtp_base_depayload_set_aggregate_hdrext_enabled(depayload: PGstRTPBaseDepayload; enable: Tgboolean); cdecl; external libgstrtp;

function GST_RTP_BASE_DEPAYLOAD_CAST(obj: Pointer): PGstRTPBaseDepayload;
function GST_RTP_BASE_DEPAYLOAD_SINKPAD(depayload: Pointer): PGstPad;
function GST_RTP_BASE_DEPAYLOAD_SRCPAD(depayload: Pointer): PGstPad;

// === Konventiert am: 7-10-24 16:09:03 ===

function GST_TYPE_RTP_BASE_DEPAYLOAD: TGType;
function GST_RTP_BASE_DEPAYLOAD(obj: Pointer): PGstRTPBaseDepayload;
function GST_RTP_BASE_DEPAYLOAD_CLASS(klass: Pointer): PGstRTPBaseDepayloadClass;
function GST_IS_RTP_BASE_DEPAYLOAD(obj: Pointer): Tgboolean;
function GST_IS_RTP_BASE_DEPAYLOAD_CLASS(klass: Pointer): Tgboolean;
function GST_RTP_BASE_DEPAYLOAD_GET_CLASS(obj: Pointer): PGstRTPBaseDepayloadClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTP_BASE_DEPAYLOAD: TGType;
begin
  GST_TYPE_RTP_BASE_DEPAYLOAD := gst_rtp_base_depayload_get_type;
end;

function GST_RTP_BASE_DEPAYLOAD(obj: Pointer): PGstRTPBaseDepayload;
begin
  Result := PGstRTPBaseDepayload(g_type_check_instance_cast(obj, GST_TYPE_RTP_BASE_DEPAYLOAD));
end;

function GST_RTP_BASE_DEPAYLOAD_CLASS(klass: Pointer): PGstRTPBaseDepayloadClass;
begin
  Result := PGstRTPBaseDepayloadClass(g_type_check_class_cast(klass, GST_TYPE_RTP_BASE_DEPAYLOAD));
end;

function GST_IS_RTP_BASE_DEPAYLOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTP_BASE_DEPAYLOAD);
end;

function GST_IS_RTP_BASE_DEPAYLOAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTP_BASE_DEPAYLOAD);
end;

function GST_RTP_BASE_DEPAYLOAD_GET_CLASS(obj: Pointer): PGstRTPBaseDepayloadClass;
begin
  Result := PGstRTPBaseDepayloadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_RTP_BASE_DEPAYLOAD_CAST(obj: Pointer): PGstRTPBaseDepayload;
begin
  GST_RTP_BASE_DEPAYLOAD_CAST := PGstRTPBaseDepayload(obj);
end;

function GST_RTP_BASE_DEPAYLOAD_SINKPAD(depayload: Pointer): PGstPad;
begin
  GST_RTP_BASE_DEPAYLOAD_SINKPAD := (GST_RTP_BASE_DEPAYLOAD_CAST(depayload))^.sinkpad;
end;

function GST_RTP_BASE_DEPAYLOAD_SRCPAD(depayload: Pointer): PGstPad;
begin
  GST_RTP_BASE_DEPAYLOAD_SRCPAD := (GST_RTP_BASE_DEPAYLOAD_CAST(depayload))^.srcpad;
end;


{$ENDIF read_implementation}
