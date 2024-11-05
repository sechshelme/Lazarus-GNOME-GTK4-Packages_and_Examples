/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 12-10-2024   19:09                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAppSinkPrivate = record
  end;
  PGstAppSinkPrivate = ^TGstAppSinkPrivate;

  TGstAppSink = record
    basesink: TGstBaseSink;
    priv: PGstAppSinkPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAppSink = ^TGstAppSink;

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
  PGstAppSinkClass = ^TGstAppSinkClass;

  TGstAppSinkCallbacks = record
    eos: procedure(appsink: PGstAppSink; user_data: Tgpointer); cdecl;
    new_preroll: function(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn; cdecl;
    new_sample: function(appsink: PGstAppSink; user_data: Tgpointer): TGstFlowReturn; cdecl;
    new_event: function(appsink: PGstAppSink; user_data: Tgpointer): Tgboolean; cdecl;
    propose_allocation: function(appsink: PGstAppSink; query: PGstQuery; user_data: Tgpointer): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  PGstAppSinkCallbacks = ^TGstAppSinkCallbacks;

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
procedure gst_app_sink_set_drop(appsink: PGstAppSink; drop: Tgboolean); cdecl; external libgstapp;
function gst_app_sink_get_drop(appsink: PGstAppSink): Tgboolean; cdecl; external libgstapp;
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

function GST_APP_SINK_CAST(obj: Pointer): PGstAppSink;

// === Konventiert am: 12-10-24 15:03:06 ===

function GST_TYPE_APP_SINK: TGType;
function GST_APP_SINK(obj: Pointer): PGstAppSink;
function GST_APP_SINK_CLASS(klass: Pointer): PGstAppSinkClass;
function GST_IS_APP_SINK(obj: Pointer): Tgboolean;
function GST_IS_APP_SINK_CLASS(klass: Pointer): Tgboolean;

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

// ====

function GST_APP_SINK_CAST(obj: Pointer): PGstAppSink;
begin
  GST_APP_SINK_CAST := PGstAppSink(obj);
end;


{$ENDIF read_implementation}
