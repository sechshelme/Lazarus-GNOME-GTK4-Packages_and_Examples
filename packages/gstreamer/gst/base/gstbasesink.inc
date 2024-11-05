/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_BASE_SINK_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS;

type
  TGstBaseSinkPrivate = record
  end;
  PGstBaseSinkPrivate = ^TGstBaseSinkPrivate;

  TGstBaseSink = record
    element: TGstElement;
    sinkpad: PGstPad;
    pad_mode: TGstPadMode;
    offset: Tguint64;
    can_activate_pull: Tgboolean;
    can_activate_push: Tgboolean;
    preroll_lock: TGMutex;
    preroll_cond: TGCond;
    eos: Tgboolean;
    need_preroll: Tgboolean;
    have_preroll: Tgboolean;
    playing_async: Tgboolean;
    have_newsegment: Tgboolean;
    segment: TGstSegment;
    clock_id: TGstClockID;
    sync: Tgboolean;
    flushing: Tgboolean;
    running: Tgboolean;
    max_lateness: Tgint64;
    priv: PGstBaseSinkPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstBaseSink = ^TGstBaseSink;

  TGstBaseSinkClass = record
    parent_class: TGstElementClass;
    get_caps: function(sink: PGstBaseSink; filter: PGstCaps): PGstCaps; cdecl;
    set_caps: function(sink: PGstBaseSink; caps: PGstCaps): Tgboolean; cdecl;
    fixate: function(sink: PGstBaseSink; caps: PGstCaps): PGstCaps; cdecl;
    activate_pull: function(sink: PGstBaseSink; active: Tgboolean): Tgboolean; cdecl;
    get_times: procedure(sink: PGstBaseSink; buffer: PGstBuffer; start: PGstClockTime; end_: PGstClockTime); cdecl;
    propose_allocation: function(sink: PGstBaseSink; query: PGstQuery): Tgboolean; cdecl;
    start: function(sink: PGstBaseSink): Tgboolean; cdecl;
    stop: function(sink: PGstBaseSink): Tgboolean; cdecl;
    unlock: function(sink: PGstBaseSink): Tgboolean; cdecl;
    unlock_stop: function(sink: PGstBaseSink): Tgboolean; cdecl;
    query: function(sink: PGstBaseSink; query: PGstQuery): Tgboolean; cdecl;
    event: function(sink: PGstBaseSink; event: PGstEvent): Tgboolean; cdecl;
    wait_event: function(sink: PGstBaseSink; event: PGstEvent): TGstFlowReturn; cdecl;
    prepare: function(sink: PGstBaseSink; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    prepare_list: function(sink: PGstBaseSink; buffer_list: PGstBufferList): TGstFlowReturn; cdecl;
    preroll: function(sink: PGstBaseSink; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    render: function(sink: PGstBaseSink; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    render_list: function(sink: PGstBaseSink; buffer_list: PGstBufferList): TGstFlowReturn; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstBaseSinkClass = ^TGstBaseSinkClass;


function gst_base_sink_get_type: TGType; cdecl; external libgstbase;
function gst_base_sink_do_preroll(sink: PGstBaseSink; obj: PGstMiniObject): TGstFlowReturn; cdecl; external libgstbase;
function gst_base_sink_wait_preroll(sink: PGstBaseSink): TGstFlowReturn; cdecl; external libgstbase;
procedure gst_base_sink_set_sync(sink: PGstBaseSink; sync: Tgboolean); cdecl; external libgstbase;
function gst_base_sink_get_sync(sink: PGstBaseSink): Tgboolean; cdecl; external libgstbase;
procedure gst_base_sink_set_drop_out_of_segment(sink: PGstBaseSink; drop_out_of_segment: Tgboolean); cdecl; external libgstbase;
function gst_base_sink_get_drop_out_of_segment(sink: PGstBaseSink): Tgboolean; cdecl; external libgstbase;
procedure gst_base_sink_set_max_lateness(sink: PGstBaseSink; max_lateness: Tgint64); cdecl; external libgstbase;
function gst_base_sink_get_max_lateness(sink: PGstBaseSink): Tgint64; cdecl; external libgstbase;
procedure gst_base_sink_set_qos_enabled(sink: PGstBaseSink; Enabled: Tgboolean); cdecl; external libgstbase;
function gst_base_sink_is_qos_enabled(sink: PGstBaseSink): Tgboolean; cdecl; external libgstbase;
procedure gst_base_sink_set_async_enabled(sink: PGstBaseSink; Enabled: Tgboolean); cdecl; external libgstbase;
function gst_base_sink_is_async_enabled(sink: PGstBaseSink): Tgboolean; cdecl; external libgstbase;
procedure gst_base_sink_set_ts_offset(sink: PGstBaseSink; offset: TGstClockTimeDiff); cdecl; external libgstbase;
function gst_base_sink_get_ts_offset(sink: PGstBaseSink): TGstClockTimeDiff; cdecl; external libgstbase;
function gst_base_sink_get_last_sample(sink: PGstBaseSink): PGstSample; cdecl; external libgstbase;
procedure gst_base_sink_set_last_sample_enabled(sink: PGstBaseSink; Enabled: Tgboolean); cdecl; external libgstbase;
function gst_base_sink_is_last_sample_enabled(sink: PGstBaseSink): Tgboolean; cdecl; external libgstbase;
function gst_base_sink_query_latency(sink: PGstBaseSink; live: Pgboolean; upstream_live: Pgboolean; min_latency: PGstClockTime; max_latency: PGstClockTime): Tgboolean; cdecl; external libgstbase;
function gst_base_sink_get_latency(sink: PGstBaseSink): TGstClockTime; cdecl; external libgstbase;
procedure gst_base_sink_set_render_delay(sink: PGstBaseSink; delay: TGstClockTime); cdecl; external libgstbase;
function gst_base_sink_get_render_delay(sink: PGstBaseSink): TGstClockTime; cdecl; external libgstbase;
procedure gst_base_sink_set_blocksize(sink: PGstBaseSink; blocksize: Tguint); cdecl; external libgstbase;
function gst_base_sink_get_blocksize(sink: PGstBaseSink): Tguint; cdecl; external libgstbase;
procedure gst_base_sink_set_throttle_time(sink: PGstBaseSink; throttle: Tguint64); cdecl; external libgstbase;
function gst_base_sink_get_throttle_time(sink: PGstBaseSink): Tguint64; cdecl; external libgstbase;
procedure gst_base_sink_set_max_bitrate(sink: PGstBaseSink; max_bitrate: Tguint64); cdecl; external libgstbase;
function gst_base_sink_get_max_bitrate(sink: PGstBaseSink): Tguint64; cdecl; external libgstbase;
procedure gst_base_sink_set_processing_deadline(sink: PGstBaseSink; processing_deadline: TGstClockTime); cdecl; external libgstbase;
function gst_base_sink_get_processing_deadline(sink: PGstBaseSink): TGstClockTime; cdecl; external libgstbase;
function gst_base_sink_wait_clock(sink: PGstBaseSink; time: TGstClockTime; jitter: PGstClockTimeDiff): TGstClockReturn; cdecl; external libgstbase;
function gst_base_sink_wait(sink: PGstBaseSink; time: TGstClockTime; jitter: PGstClockTimeDiff): TGstFlowReturn; cdecl; external libgstbase;
function gst_base_sink_get_stats(sink: PGstBaseSink): PGstStructure; cdecl; external libgstbase;

function GST_BASE_SINK_CAST(obj: Pointer): PGstBaseSink;
function GST_BASE_SINK_PAD(obj: Pointer): PGstPad;
function GST_BASE_SINK_GET_PREROLL_LOCK(obj: Pointer): PGMutex;
procedure GST_BASE_SINK_PREROLL_LOCK(obj: Pointer);
function GST_BASE_SINK_PREROLL_TRYLOCK(obj: Pointer): Tgboolean;
procedure GST_BASE_SINK_PREROLL_UNLOCK(obj: Pointer);
function GST_BASE_SINK_GET_PREROLL_COND(obj: Pointer): PGCond;
procedure GST_BASE_SINK_PREROLL_WAIT(obj: Pointer);
function GST_BASE_SINK_PREROLL_WAIT_UNTIL(obj: Pointer; end_time: longint): Tgboolean;
procedure GST_BASE_SINK_PREROLL_SIGNAL(obj: Pointer);
procedure GST_BASE_SINK_PREROLL_BROADCAST(obj: Pointer);


// === Konventiert am: 28-9-24 14:31:18 ===

function GST_TYPE_BASE_SINK: TGType;
function GST_BASE_SINK(obj: Pointer): PGstBaseSink;
function GST_BASE_SINK_CLASS(klass: Pointer): PGstBaseSinkClass;
function GST_IS_BASE_SINK(obj: Pointer): Tgboolean;
function GST_IS_BASE_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_BASE_SINK_GET_CLASS(obj: Pointer): PGstBaseSinkClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_BASE_SINK: TGType;
begin
  GST_TYPE_BASE_SINK := gst_base_sink_get_type;
end;

function GST_BASE_SINK(obj: Pointer): PGstBaseSink;
begin
  Result := PGstBaseSink(g_type_check_instance_cast(obj, GST_TYPE_BASE_SINK));
end;

function GST_BASE_SINK_CLASS(klass: Pointer): PGstBaseSinkClass;
begin
  Result := PGstBaseSinkClass(g_type_check_class_cast(klass, GST_TYPE_BASE_SINK));
end;

function GST_IS_BASE_SINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BASE_SINK);
end;

function GST_IS_BASE_SINK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BASE_SINK);
end;

function GST_BASE_SINK_GET_CLASS(obj: Pointer): PGstBaseSinkClass;
begin
  Result := PGstBaseSinkClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_BASE_SINK_CAST(obj: Pointer): PGstBaseSink;
begin
  GST_BASE_SINK_CAST := PGstBaseSink(obj);
end;

function GST_BASE_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_BASE_SINK_PAD := (GST_BASE_SINK_CAST(obj))^.sinkpad;
end;

function GST_BASE_SINK_GET_PREROLL_LOCK(obj: Pointer): PGMutex;
begin
  GST_BASE_SINK_GET_PREROLL_LOCK := @((GST_BASE_SINK_CAST(obj))^.preroll_lock);
end;

procedure GST_BASE_SINK_PREROLL_LOCK(obj: Pointer);
begin
  g_mutex_lock(GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

function GST_BASE_SINK_PREROLL_TRYLOCK(obj: Pointer): Tgboolean;
begin
  GST_BASE_SINK_PREROLL_TRYLOCK := g_mutex_trylock(GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

procedure GST_BASE_SINK_PREROLL_UNLOCK(obj: Pointer);
begin
  g_mutex_unlock(GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

function GST_BASE_SINK_GET_PREROLL_COND(obj: Pointer): PGCond;
begin
  GST_BASE_SINK_GET_PREROLL_COND := @((GST_BASE_SINK_CAST(obj))^.preroll_cond);
end;

procedure GST_BASE_SINK_PREROLL_WAIT(obj: Pointer);
begin
  g_cond_wait(GST_BASE_SINK_GET_PREROLL_COND(obj), GST_BASE_SINK_GET_PREROLL_LOCK(obj));
end;

function GST_BASE_SINK_PREROLL_WAIT_UNTIL(obj: Pointer; end_time: longint): Tgboolean;
begin
  GST_BASE_SINK_PREROLL_WAIT_UNTIL := g_cond_wait_until(GST_BASE_SINK_GET_PREROLL_COND(obj), GST_BASE_SINK_GET_PREROLL_LOCK(obj), end_time);
end;

procedure GST_BASE_SINK_PREROLL_SIGNAL(obj: Pointer);
begin
  g_cond_signal(GST_BASE_SINK_GET_PREROLL_COND(obj));
end;

procedure GST_BASE_SINK_PREROLL_BROADCAST(obj: Pointer);
begin
  g_cond_broadcast(GST_BASE_SINK_GET_PREROLL_COND(obj));
end;


{$ENDIF read_implementation}
