
{$IFDEF read_interface}

type
  PGstAppStreamType = ^TGstAppStreamType;
  TGstAppStreamType = longint;

const
  GST_APP_STREAM_TYPE_STREAM = 0;
  GST_APP_STREAM_TYPE_SEEKABLE = 1;
  GST_APP_STREAM_TYPE_RANDOM_ACCESS = 2;

type
  PGstAppLeakyType = ^TGstAppLeakyType;
  TGstAppLeakyType = longint;

const
  GST_APP_LEAKY_TYPE_NONE = 0;
  GST_APP_LEAKY_TYPE_UPSTREAM = 1;
  GST_APP_LEAKY_TYPE_DOWNSTREAM = 2;

type
  TGstAppSrcPrivate = record
  end;
  PGstAppSrcPrivate = ^TGstAppSrcPrivate;

  TGstAppSrc = record
    basesrc: TGstBaseSrc;
    priv: PGstAppSrcPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAppSrc = ^TGstAppSrc;

  TGstAppSrcClass = record
    basesrc_class: TGstBaseSrcClass;
    need_data: procedure(appsrc: PGstAppSrc; length: Tguint); cdecl;
    enough_data: procedure(appsrc: PGstAppSrc); cdecl;
    seek_data: function(appsrc: PGstAppSrc; offset: Tguint64): Tgboolean; cdecl;
    push_buffer: function(appsrc: PGstAppSrc; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    end_of_stream: function(appsrc: PGstAppSrc): TGstFlowReturn; cdecl;
    push_sample: function(appsrc: PGstAppSrc; sample: PGstSample): TGstFlowReturn; cdecl;
    push_buffer_list: function(appsrc: PGstAppSrc; buffer_list: PGstBufferList): TGstFlowReturn; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  PGstAppSrcClass = ^TGstAppSrcClass;

  TGstAppSrcCallbacks = record
    need_data: procedure(src: PGstAppSrc; length: Tguint; user_data: Tgpointer); cdecl;
    enough_data: procedure(src: PGstAppSrc; user_data: Tgpointer); cdecl;
    seek_data: function(src: PGstAppSrc; offset: Tguint64; user_data: Tgpointer): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAppSrcCallbacks = ^TGstAppSrcCallbacks;


function gst_app_src_get_type: TGType; cdecl; external libgstapp;
procedure gst_app_src_set_caps(appsrc: PGstAppSrc; caps: PGstCaps); cdecl; external libgstapp;
function gst_app_src_get_caps(appsrc: PGstAppSrc): PGstCaps; cdecl; external libgstapp;
procedure gst_app_src_set_size(appsrc: PGstAppSrc; size: Tgint64); cdecl; external libgstapp;
function gst_app_src_get_size(appsrc: PGstAppSrc): Tgint64; cdecl; external libgstapp;
procedure gst_app_src_set_duration(appsrc: PGstAppSrc; duration: TGstClockTime); cdecl; external libgstapp;
function gst_app_src_get_duration(appsrc: PGstAppSrc): TGstClockTime; cdecl; external libgstapp;
procedure gst_app_src_set_stream_type(appsrc: PGstAppSrc; _type: TGstAppStreamType); cdecl; external libgstapp;
function gst_app_src_get_stream_type(appsrc: PGstAppSrc): TGstAppStreamType; cdecl; external libgstapp;
procedure gst_app_src_set_max_bytes(appsrc: PGstAppSrc; max: Tguint64); cdecl; external libgstapp;
function gst_app_src_get_max_bytes(appsrc: PGstAppSrc): Tguint64; cdecl; external libgstapp;
function gst_app_src_get_current_level_bytes(appsrc: PGstAppSrc): Tguint64; cdecl; external libgstapp;
procedure gst_app_src_set_max_buffers(appsrc: PGstAppSrc; max: Tguint64); cdecl; external libgstapp;
function gst_app_src_get_max_buffers(appsrc: PGstAppSrc): Tguint64; cdecl; external libgstapp;
function gst_app_src_get_current_level_buffers(appsrc: PGstAppSrc): Tguint64; cdecl; external libgstapp;
procedure gst_app_src_set_max_time(appsrc: PGstAppSrc; max: TGstClockTime); cdecl; external libgstapp;
function gst_app_src_get_max_time(appsrc: PGstAppSrc): TGstClockTime; cdecl; external libgstapp;
function gst_app_src_get_current_level_time(appsrc: PGstAppSrc): TGstClockTime; cdecl; external libgstapp;
procedure gst_app_src_set_leaky_type(appsrc: PGstAppSrc; leaky: TGstAppLeakyType); cdecl; external libgstapp;
function gst_app_src_get_leaky_type(appsrc: PGstAppSrc): TGstAppLeakyType; cdecl; external libgstapp;
procedure gst_app_src_set_latency(appsrc: PGstAppSrc; min: Tguint64; max: Tguint64); cdecl; external libgstapp;
procedure gst_app_src_get_latency(appsrc: PGstAppSrc; min: Pguint64; max: Pguint64); cdecl; external libgstapp;
procedure gst_app_src_set_emit_signals(appsrc: PGstAppSrc; emit: Tgboolean); cdecl; external libgstapp;
function gst_app_src_get_emit_signals(appsrc: PGstAppSrc): Tgboolean; cdecl; external libgstapp;
function gst_app_src_push_buffer(appsrc: PGstAppSrc; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstapp;
function gst_app_src_push_buffer_list(appsrc: PGstAppSrc; buffer_list: PGstBufferList): TGstFlowReturn; cdecl; external libgstapp;
function gst_app_src_end_of_stream(appsrc: PGstAppSrc): TGstFlowReturn; cdecl; external libgstapp;
function gst_app_src_push_sample(appsrc: PGstAppSrc; sample: PGstSample): TGstFlowReturn; cdecl; external libgstapp;
procedure gst_app_src_set_callbacks(appsrc: PGstAppSrc; callbacks: PGstAppSrcCallbacks; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstapp;

function GST_APP_SRC_CAST(obj: Pointer): PGstAppSrc;

// === Konventiert am: 12-10-24 15:03:03 ===

function GST_TYPE_APP_SRC: TGType;
function GST_APP_SRC(obj: Pointer): PGstAppSrc;
function GST_APP_SRC_CLASS(klass: Pointer): PGstAppSrcClass;
function GST_IS_APP_SRC(obj: Pointer): Tgboolean;
function GST_IS_APP_SRC_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_APP_SRC: TGType;
begin
  GST_TYPE_APP_SRC := gst_app_src_get_type;
end;

function GST_APP_SRC(obj: Pointer): PGstAppSrc;
begin
  Result := PGstAppSrc(g_type_check_instance_cast(obj, GST_TYPE_APP_SRC));
end;

function GST_APP_SRC_CLASS(klass: Pointer): PGstAppSrcClass;
begin
  Result := PGstAppSrcClass(g_type_check_class_cast(klass, GST_TYPE_APP_SRC));
end;

function GST_IS_APP_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_APP_SRC);
end;

function GST_IS_APP_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_APP_SRC);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_APP_SRC_CAST(obj: Pointer): PGstAppSrc;
begin
  GST_APP_SRC_CAST := PGstAppSrc(obj);
end;


{$ENDIF read_implementation}
