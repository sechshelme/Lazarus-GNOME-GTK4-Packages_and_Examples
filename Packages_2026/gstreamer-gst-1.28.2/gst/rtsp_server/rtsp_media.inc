
  {$IFDEF read_enum}

type
  PGstRTSPMediaStatus = ^TGstRTSPMediaStatus;
  TGstRTSPMediaStatus = longint;
const
  GST_RTSP_MEDIA_STATUS_UNPREPARED = 0;
  GST_RTSP_MEDIA_STATUS_UNPREPARING = 1;
  GST_RTSP_MEDIA_STATUS_PREPARING = 2;
  GST_RTSP_MEDIA_STATUS_PREPARED = 3;
  GST_RTSP_MEDIA_STATUS_SUSPENDED = 4;
  GST_RTSP_MEDIA_STATUS_ERROR = 5;

type
  PGstRTSPSuspendMode = ^TGstRTSPSuspendMode;
  TGstRTSPSuspendMode = longint;
const
  GST_RTSP_SUSPEND_MODE_NONE = 0;
  GST_RTSP_SUSPEND_MODE_PAUSE = 1;
  GST_RTSP_SUSPEND_MODE_RESET = 2;

type
  PGstRTSPTransportMode = ^TGstRTSPTransportMode;
  TGstRTSPTransportMode = longint;
const
  GST_RTSP_TRANSPORT_MODE_PLAY = 1;
  GST_RTSP_TRANSPORT_MODE_RECORD = 2;

type
  PGstRTSPPublishClockMode = ^TGstRTSPPublishClockMode;
  TGstRTSPPublishClockMode = longint;
const
  GST_RTSP_PUBLISH_CLOCK_MODE_NONE = 0;
  GST_RTSP_PUBLISH_CLOCK_MODE_CLOCK = 1;
  GST_RTSP_PUBLISH_CLOCK_MODE_CLOCK_AND_OFFSET = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstRTSPMediaPrivate = type Pointer;

  PGstRTSPMedia = ^TGstRTSPMedia;
  TGstRTSPMedia = record
    parent: TGObject;
    priv: PGstRTSPMediaPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPMediaClass = ^TGstRTSPMediaClass;
  TGstRTSPMediaClass = record
    parent_class: TGObjectClass;
    handle_message: function(media: PGstRTSPMedia; message: PGstMessage): Tgboolean; cdecl;
    prepare: function(media: PGstRTSPMedia; thread: PGstRTSPThread): Tgboolean; cdecl;
    unprepare: function(media: PGstRTSPMedia): Tgboolean; cdecl;
    suspend: function(media: PGstRTSPMedia): Tgboolean; cdecl;
    unsuspend: function(media: PGstRTSPMedia): Tgboolean; cdecl;
    convert_range: function(media: PGstRTSPMedia; range: PGstRTSPTimeRange; unit_: TGstRTSPRangeUnit): Tgboolean; cdecl;
    query_position: function(media: PGstRTSPMedia; position: Pgint64): Tgboolean; cdecl;
    query_stop: function(media: PGstRTSPMedia; stop: Pgint64): Tgboolean; cdecl;
    create_rtpbin: function(media: PGstRTSPMedia): PGstElement; cdecl;
    setup_rtpbin: function(media: PGstRTSPMedia; rtpbin: PGstElement): Tgboolean; cdecl;
    setup_sdp: function(media: PGstRTSPMedia; sdp: PGstSDPMessage; info: PGstSDPInfo): Tgboolean; cdecl;
    new_stream: procedure(media: PGstRTSPMedia; stream: PGstRTSPStream); cdecl;
    removed_stream: procedure(media: PGstRTSPMedia; stream: PGstRTSPStream); cdecl;
    prepared: procedure(media: PGstRTSPMedia); cdecl;
    unprepared: procedure(media: PGstRTSPMedia); cdecl;
    target_state: procedure(media: PGstRTSPMedia; state: TGstState); cdecl;
    new_state: procedure(media: PGstRTSPMedia; state: TGstState); cdecl;
    handle_sdp: function(media: PGstRTSPMedia; sdp: PGstSDPMessage): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 1) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_transport_mode_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_suspend_mode_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_publish_clock_mode_get_type: TGType; cdecl; external libgstrtspserver;

function gst_rtsp_media_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_media_new(element: PGstElement): PGstRTSPMedia; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_element(media: PGstRTSPMedia): PGstElement; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_take_pipeline(media: PGstRTSPMedia; pipeline: PGstPipeline); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_status(media: PGstRTSPMedia): TGstRTSPMediaStatus; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_permissions(media: PGstRTSPMedia; permissions: PGstRTSPPermissions); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_permissions(media: PGstRTSPMedia): PGstRTSPPermissions; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_shared(media: PGstRTSPMedia; shared: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_is_shared(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_can_be_shared(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_stop_on_disconnect(media: PGstRTSPMedia; stop_on_disconnect: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_is_stop_on_disconnect(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_transport_mode(media: PGstRTSPMedia; mode: TGstRTSPTransportMode); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_transport_mode(media: PGstRTSPMedia): TGstRTSPTransportMode; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_reusable(media: PGstRTSPMedia; reusable: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_is_reusable(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_profiles(media: PGstRTSPMedia; profiles: TGstRTSPProfile); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_profiles(media: PGstRTSPMedia): TGstRTSPProfile; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_protocols(media: PGstRTSPMedia; protocols: TGstRTSPLowerTrans); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_protocols(media: PGstRTSPMedia): TGstRTSPLowerTrans; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_eos_shutdown(media: PGstRTSPMedia; eos_shutdown: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_is_eos_shutdown(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_address_pool(media: PGstRTSPMedia; pool: PGstRTSPAddressPool); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_address_pool(media: PGstRTSPMedia): PGstRTSPAddressPool; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_multicast_iface(media: PGstRTSPMedia; multicast_iface: Pgchar); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_multicast_iface(media: PGstRTSPMedia): Pgchar; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_buffer_size(media: PGstRTSPMedia; size: Tguint); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_buffer_size(media: PGstRTSPMedia): Tguint; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_ensure_keyunit_on_start(media: PGstRTSPMedia; ensure_keyunit_on_start: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_ensure_keyunit_on_start(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_ensure_keyunit_on_start_timeout(media: PGstRTSPMedia; timeout: Tguint); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_ensure_keyunit_on_start_timeout(media: PGstRTSPMedia): Tguint; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_retransmission_time(media: PGstRTSPMedia; time: TGstClockTime); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_retransmission_time(media: PGstRTSPMedia): TGstClockTime; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_do_retransmission(media: PGstRTSPMedia; do_retransmission: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_do_retransmission(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_latency(media: PGstRTSPMedia; latency: Tguint); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_latency(media: PGstRTSPMedia): Tguint; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_use_time_provider(media: PGstRTSPMedia; time_provider: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_is_time_provider(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_time_provider(media: PGstRTSPMedia; address: Pgchar; port: Tguint16): PGstNetTimeProvider; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_clock(media: PGstRTSPMedia; clock: PGstClock); cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_publish_clock_mode(media: PGstRTSPMedia; mode: TGstRTSPPublishClockMode); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_publish_clock_mode(media: PGstRTSPMedia): TGstRTSPPublishClockMode; cdecl; external libgstrtspserver;
function gst_rtsp_media_set_max_mcast_ttl(media: PGstRTSPMedia; ttl: Tguint): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_max_mcast_ttl(media: PGstRTSPMedia): Tguint; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_bind_mcast_address(media: PGstRTSPMedia; bind_mcast_addr: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_is_bind_mcast_address(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_dscp_qos(media: PGstRTSPMedia; dscp_qos: Tgint); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_dscp_qos(media: PGstRTSPMedia): Tgint; cdecl; external libgstrtspserver;
function gst_rtsp_media_prepare(media: PGstRTSPMedia; thread: PGstRTSPThread): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_unprepare(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_suspend_mode(media: PGstRTSPMedia; mode: TGstRTSPSuspendMode); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_suspend_mode(media: PGstRTSPMedia): TGstRTSPSuspendMode; cdecl; external libgstrtspserver;
function gst_rtsp_media_suspend(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_unsuspend(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_setup_sdp(media: PGstRTSPMedia; sdp: PGstSDPMessage; info: PGstSDPInfo): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_handle_sdp(media: PGstRTSPMedia; sdp: PGstSDPMessage): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_collect_streams(media: PGstRTSPMedia); cdecl; external libgstrtspserver;
function gst_rtsp_media_create_stream(media: PGstRTSPMedia; payloader: PGstElement; pad: PGstPad): PGstRTSPStream; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_lock(media: PGstRTSPMedia); cdecl; external libgstrtspserver;
procedure gst_rtsp_media_unlock(media: PGstRTSPMedia); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_clock(media: PGstRTSPMedia): PGstClock; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_base_time(media: PGstRTSPMedia): TGstClockTime; cdecl; external libgstrtspserver;
function gst_rtsp_media_n_streams(media: PGstRTSPMedia): Tguint; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_stream(media: PGstRTSPMedia; idx: Tguint): PGstRTSPStream; cdecl; external libgstrtspserver;
function gst_rtsp_media_find_stream(media: PGstRTSPMedia; control: Pgchar): PGstRTSPStream; cdecl; external libgstrtspserver;
function gst_rtsp_media_seek(media: PGstRTSPMedia; range: PGstRTSPTimeRange): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_seek_full(media: PGstRTSPMedia; range: PGstRTSPTimeRange; flags: TGstSeekFlags): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_seek_trickmode(media: PGstRTSPMedia; range: PGstRTSPTimeRange; flags: TGstSeekFlags; rate: Tgdouble; trickmode_interval: TGstClockTime): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_seekable(media: PGstRTSPMedia): TGstClockTimeDiff; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_range_string(media: PGstRTSPMedia; play: Tgboolean; unit_: TGstRTSPRangeUnit): Pgchar; cdecl; external libgstrtspserver;
function gst_rtsp_media_get_rates(media: PGstRTSPMedia; rate: Pgdouble; applied_rate: Pgdouble): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_set_state(media: PGstRTSPMedia; state: TGstState; transports: PGPtrArray): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_pipeline_state(media: PGstRTSPMedia; state: TGstState); cdecl; external libgstrtspserver;
function gst_rtsp_media_complete_pipeline(media: PGstRTSPMedia; transports: PGPtrArray): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_is_receive_only(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_media_has_completed_sender(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_media_set_rate_control(media: PGstRTSPMedia; enabled: Tgboolean); cdecl; external libgstrtspserver;
function gst_rtsp_media_get_rate_control(media: PGstRTSPMedia): Tgboolean; cdecl; external libgstrtspserver;

// === Konventiert am: 20-7-26 13:45:36 ===

function GST_TYPE_RTSP_MEDIA: TGType;
function GST_RTSP_MEDIA(obj: Pointer): PGstRTSPMedia;
function GST_RTSP_MEDIA_CLASS(klass: Pointer): PGstRTSPMediaClass;
function GST_IS_RTSP_MEDIA(obj: Pointer): Tgboolean;
function GST_IS_RTSP_MEDIA_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_MEDIA_GET_CLASS(obj: Pointer): PGstRTSPMediaClass;
function GST_RTSP_MEDIA_CAST(obj: Pointer): PGstRTSPMedia;
function GST_RTSP_MEDIA_CLASS_CAST(klass: Pointer): PGstRTSPMediaClass;

function GST_TYPE_RTSP_TRANSPORT_MODE: TGType;
function GST_TYPE_RTSP_SUSPEND_MODE: TGType;
function GST_TYPE_RTSP_PUBLISH_CLOCK_MODE: TGType;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_MEDIA: TGType;
begin
  Result := gst_rtsp_media_get_type;
end;

function GST_RTSP_MEDIA(obj: Pointer): PGstRTSPMedia;
begin
  Result := PGstRTSPMedia(g_type_check_instance_cast(obj, GST_TYPE_RTSP_MEDIA));
end;

function GST_RTSP_MEDIA_CLASS(klass: Pointer): PGstRTSPMediaClass;
begin
  Result := PGstRTSPMediaClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_MEDIA));
end;

function GST_IS_RTSP_MEDIA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_MEDIA);
end;

function GST_IS_RTSP_MEDIA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_MEDIA);
end;

function GST_RTSP_MEDIA_GET_CLASS(obj: Pointer): PGstRTSPMediaClass;
begin
  Result := PGstRTSPMediaClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_MEDIA_CAST(obj: Pointer): PGstRTSPMedia;
begin
  Result := PGstRTSPMedia(obj);
end;

function GST_RTSP_MEDIA_CLASS_CAST(klass: Pointer): PGstRTSPMediaClass;
begin
  Result := PGstRTSPMediaClass(klass);
end;


function GST_TYPE_RTSP_TRANSPORT_MODE: TGType;
begin
  Result := gst_rtsp_transport_mode_get_type;
end;

function GST_TYPE_RTSP_SUSPEND_MODE: TGType;
begin
  Result := gst_rtsp_suspend_mode_get_type;
end;

function GST_TYPE_RTSP_PUBLISH_CLOCK_MODE: TGType;
begin
  Result := gst_rtsp_publish_clock_mode_get_type;
end;

{$ENDIF read_implementation}
