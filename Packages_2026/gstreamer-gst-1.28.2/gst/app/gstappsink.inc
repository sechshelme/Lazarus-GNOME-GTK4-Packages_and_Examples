{$IFDEF read_interface}


type
  PGstAppSink = ^TGstAppSink;

  PGstAppSinkCallbacks = ^TGstAppSinkCallbacks;
  TGstAppSinkCallbacks = record
    eos: procedure(appsink: PGstAppSink; user_data: Tgpointer); cdecl;
    new_preroll: function(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn; cdecl;
    new_sample: function(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn; cdecl;
    new_event: function(appsink: PGstAppSink; user_data: Tgpointer): Tgboolean; cdecl;
    propose_allocation: function(appsink: PGstAppSink; query: PGstQuery; user_data: Tgpointer): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;

  PGstAppSinkSimpleCallbacks = type Pointer;
  PGstAppSinkPrivate = type Pointer;

  TGstAppSink = record
    basesink: TGstBaseSink;
    priv: PGstAppSinkPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstAppSinkClass = ^TGstAppSinkClass;
  TGstAppSinkClass = record
    basesink_class: TGstBaseSinkClass;
    eos: procedure(appsink: PGstAppSink); cdecl;
    new_preroll: function(appsink: PGstAppSink): TGstFlowReturn; cdecl;
    new_sample: function(appsink: PGstAppSink): TGstFlowReturn; cdecl;
    pull_preroll: function(appsink: PGstAppSink): PGstSample; cdecl;
    pull_sample: function(appsink: PGstAppSink): PGstSample; cdecl;
    try_pull_preroll: function(appsink: PGstAppSink; timeout: TGstClockTime): PGstSample; cdecl;
    try_pull_sample: function(appsink: PGstAppSink; timeout: TGstClockTime): PGstSample; cdecl;
    try_pull_object: function(appsink: PGstAppSink; timeout: TGstClockTime): PGstMiniObject; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 3) - 1] of Tgpointer;
  end;

function gst_app_sink_get_type: TGType; cdecl; external libgstapp;
procedure gst_app_sink_set_caps(appsink: PGstAppSink; caps: PGstCaps); cdecl; external libgstapp;
function gst_app_sink_get_caps(appsink: PGstAppSink): PGstCaps; cdecl; external libgstapp;
function gst_app_sink_is_eos(appsink: PGstAppSink): Tgboolean; cdecl; external libgstapp;
procedure gst_app_sink_set_emit_signals(appsink: PGstAppSink; emit: Tgboolean); cdecl; external libgstapp;
function gst_app_sink_get_emit_signals(appsink: PGstAppSink): Tgboolean; cdecl; external libgstapp;
procedure gst_app_sink_set_max_buffers(appsink: PGstAppSink; max: Tguint); cdecl; external libgstapp;
function gst_app_sink_get_max_buffers(appsink: PGstAppSink): Tguint; cdecl; external libgstapp;
procedure gst_app_sink_set_max_time(appsink: PGstAppSink; max: TGstClockTime); cdecl; external libgstapp;
function gst_app_sink_get_max_time(appsink: PGstAppSink): TGstClockTime; cdecl; external libgstapp;
procedure gst_app_sink_set_max_bytes(appsink: PGstAppSink; max: Tguint64); cdecl; external libgstapp;
function gst_app_sink_get_max_bytes(appsink: PGstAppSink): Tguint64; cdecl; external libgstapp;
function gst_app_sink_get_current_level_bytes(appsink: PGstAppSink): Tguint64; cdecl; external libgstapp;
function gst_app_sink_get_current_level_buffers(appsink: PGstAppSink): Tguint64; cdecl; external libgstapp;
function gst_app_sink_get_current_level_time(appsink: PGstAppSink): TGstClockTime; cdecl; external libgstapp;
procedure gst_app_sink_set_drop(appsink: PGstAppSink; drop: Tgboolean); cdecl; external libgstapp; deprecated;
function gst_app_sink_get_drop(appsink: PGstAppSink): Tgboolean; cdecl; external libgstapp; deprecated;
procedure gst_app_sink_set_leaky_type(appsink: PGstAppSink; leaky: TGstAppLeakyType); cdecl; external libgstapp;
function gst_app_sink_get_leaky_type(appsink: PGstAppSink): TGstAppLeakyType; cdecl; external libgstapp;
procedure gst_app_sink_set_buffer_list_support(appsink: PGstAppSink; enable_lists: Tgboolean); cdecl; external libgstapp;
function gst_app_sink_get_buffer_list_support(appsink: PGstAppSink): Tgboolean; cdecl; external libgstapp;
procedure gst_app_sink_set_wait_on_eos(appsink: PGstAppSink; wait: Tgboolean); cdecl; external libgstapp;
function gst_app_sink_get_wait_on_eos(appsink: PGstAppSink): Tgboolean; cdecl; external libgstapp;
function gst_app_sink_pull_preroll(appsink: PGstAppSink): PGstSample; cdecl; external libgstapp;
function gst_app_sink_pull_sample(appsink: PGstAppSink): PGstSample; cdecl; external libgstapp;
function gst_app_sink_pull_object(appsink: PGstAppSink): PGstMiniObject; cdecl; external libgstapp;
function gst_app_sink_try_pull_preroll(appsink: PGstAppSink; timeout: TGstClockTime): PGstSample; cdecl; external libgstapp;
function gst_app_sink_try_pull_sample(appsink: PGstAppSink; timeout: TGstClockTime): PGstSample; cdecl; external libgstapp;
function gst_app_sink_try_pull_object(appsink: PGstAppSink; timeout: TGstClockTime): PGstMiniObject; cdecl; external libgstapp;
procedure gst_app_sink_set_callbacks(appsink: PGstAppSink; callbacks: PGstAppSinkCallbacks; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstapp;
procedure gst_app_sink_set_simple_callbacks(appsink: PGstAppSink; cb: PGstAppSinkSimpleCallbacks); cdecl; external libgstapp;
function gst_app_sink_simple_callbacks_get_type: TGType; cdecl; external libgstapp;

function gst_app_sink_simple_callbacks_new: PGstAppSinkSimpleCallbacks; cdecl; external libgstapp;
function gst_app_sink_simple_callbacks_ref(cb: PGstAppSinkSimpleCallbacks): PGstAppSinkSimpleCallbacks; cdecl; external libgstapp;
procedure gst_app_sink_simple_callbacks_unref(cb: PGstAppSinkSimpleCallbacks); cdecl; external libgstapp;

type
  TGstAppSinkEosCallback = procedure(appsink: PGstAppSink; user_data: Tgpointer); cdecl;

procedure gst_app_sink_simple_callbacks_set_eos(cb: PGstAppSinkSimpleCallbacks; eos_cb: TGstAppSinkEosCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstapp;
type
  TGstAppSinkNewPrerollCallback = function(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn; cdecl;

procedure gst_app_sink_simple_callbacks_set_new_preroll(cb: PGstAppSinkSimpleCallbacks; new_preroll_cb: TGstAppSinkNewPrerollCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstapp;

type
  TGstAppSinkNewSampleCallback = function(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn; cdecl;

procedure gst_app_sink_simple_callbacks_set_new_sample(cb: PGstAppSinkSimpleCallbacks; new_sample_cb: TGstAppSinkNewSampleCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstapp;

type
  TGstAppSinkNewEventCallback = function(appsink: PGstAppSink; user_data: Tgpointer): Tgboolean; cdecl;

procedure gst_app_sink_simple_callbacks_set_new_event(cb: PGstAppSinkSimpleCallbacks; new_event_cb: TGstAppSinkNewEventCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstapp;
type
  TGstAppSinkProposeAllocationCallback = function(appsink: PGstAppSink; query: PGstQuery; user_data: Tgpointer): Tgboolean; cdecl;

procedure gst_app_sink_simple_callbacks_set_propose_allocation(cb: PGstAppSinkSimpleCallbacks; propose_allocation_cb: TGstAppSinkProposeAllocationCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstapp;

// === Konventiert am: 26-7-26 20:05:29 ===

function GST_TYPE_APP_SINK: TGType;
function GST_APP_SINK(obj: Pointer): PGstAppSink;
function GST_APP_SINK_CLASS(klass: Pointer): PGstAppSinkClass;
function GST_IS_APP_SINK(obj: Pointer): Tgboolean;
function GST_IS_APP_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_APP_SINK_CAST(obj: Pointer): PGstAppSink;

function GST_TYPE_APP_SINK_SIMPLE_CALLBACKS: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_APP_SINK: TGType;
begin
  GST_TYPE_APP_SINK := gst_app_sink_get_type;
end;

function GST_APP_SINK(obj: Pointer): PGstAppSink;
begin
  Result := PGstAppSink(g_type_check_instance_cast(obj, GST_TYPE_APP_SINK));
end;

function GST_APP_SINK_CLASS(klass: Pointer): PGstAppSinkClass;
begin
  Result := PGstAppSinkClass(g_type_check_class_cast(klass, GST_TYPE_APP_SINK));
end;

function GST_IS_APP_SINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_APP_SINK);
end;

function GST_IS_APP_SINK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_APP_SINK);
end;

function GST_APP_SINK_CAST(obj: Pointer): PGstAppSink;
begin
  GST_APP_SINK_CAST := PGstAppSink(obj);
end;

function GST_TYPE_APP_SINK_SIMPLE_CALLBACKS: TGType;
begin
  GST_TYPE_APP_SINK_SIMPLE_CALLBACKS := gst_app_sink_simple_callbacks_get_type;
end;

{$ENDIF read_implementation}
