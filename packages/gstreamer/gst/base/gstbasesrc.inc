/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstBaseSrcFlags = ^TGstBaseSrcFlags;
  TGstBaseSrcFlags = longint;

const
  GST_BASE_SRC_FLAG_STARTING = GST_ELEMENT_FLAG_LAST shl 0;
  GST_BASE_SRC_FLAG_STARTED = GST_ELEMENT_FLAG_LAST shl 1;
  GST_BASE_SRC_FLAG_LAST = GST_ELEMENT_FLAG_LAST shl 6;

type
  TGstBaseSrcPrivate = record
  end;
  PGstBaseSrcPrivate = ^TGstBaseSrcPrivate;

  TGstBaseSrc = record
    element: TGstElement;
    srcpad: PGstPad;
    live_lock: TGMutex;
    live_cond: TGCond;
    is_live: Tgboolean;
    live_running: Tgboolean;
    blocksize: Tguint;
    can_activate_push: Tgboolean;
    random_access: Tgboolean;
    clock_id: TGstClockID;
    segment: TGstSegment;
    need_newsegment: Tgboolean;
    num_buffers: Tgint;
    num_buffers_left: Tgint;
    typefind: Tgboolean;
    running: Tgboolean;
    pending_seek: PGstEvent;
    priv: PGstBaseSrcPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstBaseSrc = ^TGstBaseSrc;

  TGstBaseSrcClass = record
    parent_class: TGstElementClass;
    get_caps: function(src: PGstBaseSrc; filter: PGstCaps): PGstCaps; cdecl;
    negotiate: function(src: PGstBaseSrc): Tgboolean; cdecl;
    fixate: function(src: PGstBaseSrc; caps: PGstCaps): PGstCaps; cdecl;
    set_caps: function(src: PGstBaseSrc; caps: PGstCaps): Tgboolean; cdecl;
    decide_allocation: function(src: PGstBaseSrc; query: PGstQuery): Tgboolean; cdecl;
    start: function(src: PGstBaseSrc): Tgboolean; cdecl;
    stop: function(src: PGstBaseSrc): Tgboolean; cdecl;
    get_times: procedure(src: PGstBaseSrc; buffer: PGstBuffer; start: PGstClockTime; end_: PGstClockTime); cdecl;
    get_size: function(src: PGstBaseSrc; size: Pguint64): Tgboolean; cdecl;
    is_seekable: function(src: PGstBaseSrc): Tgboolean; cdecl;
    prepare_seek_segment: function(src: PGstBaseSrc; seek: PGstEvent; segment: PGstSegment): Tgboolean; cdecl;
    do_seek: function(src: PGstBaseSrc; segment: PGstSegment): Tgboolean; cdecl;
    unlock: function(src: PGstBaseSrc): Tgboolean; cdecl;
    unlock_stop: function(src: PGstBaseSrc): Tgboolean; cdecl;
    query: function(src: PGstBaseSrc; query: PGstQuery): Tgboolean; cdecl;
    event: function(src: PGstBaseSrc; event: PGstEvent): Tgboolean; cdecl;
    Create: function(src: PGstBaseSrc; offset: Tguint64; size: Tguint; buf: PPGstBuffer): TGstFlowReturn; cdecl;
    alloc: function(src: PGstBaseSrc; offset: Tguint64; size: Tguint; buf: PPGstBuffer): TGstFlowReturn; cdecl;
    fill: function(src: PGstBaseSrc; offset: Tguint64; size: Tguint; buf: PGstBuffer): TGstFlowReturn; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstBaseSrcClass = ^TGstBaseSrcClass;

function gst_base_src_get_type: TGType; cdecl; external libgstbase;
function gst_base_src_wait_playing(src: PGstBaseSrc): TGstFlowReturn; cdecl; external libgstbase;
procedure gst_base_src_set_live(src: PGstBaseSrc; live: Tgboolean); cdecl; external libgstbase;
function gst_base_src_is_live(src: PGstBaseSrc): Tgboolean; cdecl; external libgstbase;
procedure gst_base_src_set_format(src: PGstBaseSrc; format: TGstFormat); cdecl; external libgstbase;
procedure gst_base_src_set_dynamic_size(src: PGstBaseSrc; dynamic: Tgboolean); cdecl; external libgstbase;
procedure gst_base_src_set_automatic_eos(src: PGstBaseSrc; automatic_eos: Tgboolean); cdecl; external libgstbase;
procedure gst_base_src_set_async(src: PGstBaseSrc; async: Tgboolean); cdecl; external libgstbase;
function gst_base_src_is_async(src: PGstBaseSrc): Tgboolean; cdecl; external libgstbase;
function gst_base_src_negotiate(src: PGstBaseSrc): Tgboolean; cdecl; external libgstbase;
procedure gst_base_src_start_complete(basesrc: PGstBaseSrc; ret: TGstFlowReturn); cdecl; external libgstbase;
function gst_base_src_start_wait(basesrc: PGstBaseSrc): TGstFlowReturn; cdecl; external libgstbase;
function gst_base_src_query_latency(src: PGstBaseSrc; live: Pgboolean; min_latency: PGstClockTime; max_latency: PGstClockTime): Tgboolean; cdecl; external libgstbase;
procedure gst_base_src_set_blocksize(src: PGstBaseSrc; blocksize: Tguint); cdecl; external libgstbase;
function gst_base_src_get_blocksize(src: PGstBaseSrc): Tguint; cdecl; external libgstbase;
procedure gst_base_src_set_do_timestamp(src: PGstBaseSrc; timestamp: Tgboolean); cdecl; external libgstbase;
function gst_base_src_get_do_timestamp(src: PGstBaseSrc): Tgboolean; cdecl; external libgstbase;
function gst_base_src_new_seamless_segment(src: PGstBaseSrc; start: Tgint64; stop: Tgint64; time: Tgint64): Tgboolean; cdecl; external libgstbase;
function gst_base_src_new_segment(src: PGstBaseSrc; segment: PGstSegment): Tgboolean; cdecl; external libgstbase;
function gst_base_src_set_caps(src: PGstBaseSrc; caps: PGstCaps): Tgboolean; cdecl; external libgstbase;
function gst_base_src_get_buffer_pool(src: PGstBaseSrc): PGstBufferPool; cdecl; external libgstbase;
procedure gst_base_src_get_allocator(src: PGstBaseSrc; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstbase;
procedure gst_base_src_submit_buffer_list(src: PGstBaseSrc; buffer_list: PGstBufferList); cdecl; external libgstbase;
function gst_base_src_push_segment(src: PGstBaseSrc; segment: PGstSegment): Tgboolean; cdecl; external libgstbase;

function GST_BASE_SRC_IS_STARTING(obj: Pointer): Tgboolean;
function GST_BASE_SRC_IS_STARTED(obj: Pointer): Tgboolean;
function GST_BASE_SRC_PAD(obj: Pointer): PGstPad;
function GST_BASE_SRC_CAST(obj: Pointer): PGstBaseSrc;

// === Konventiert am: 28-9-24 13:17:58 ===

function GST_TYPE_BASE_SRC: TGType;
function GST_BASE_SRC(obj: Pointer): PGstBaseSrc;
function GST_BASE_SRC_CLASS(klass: Pointer): PGstBaseSrcClass;
function GST_IS_BASE_SRC(obj: Pointer): Tgboolean;
function GST_IS_BASE_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_BASE_SRC_GET_CLASS(obj: Pointer): PGstBaseSrcClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_BASE_SRC: TGType;
begin
  GST_TYPE_BASE_SRC := gst_base_src_get_type;
end;

function GST_BASE_SRC(obj: Pointer): PGstBaseSrc;
begin
  Result := PGstBaseSrc(g_type_check_instance_cast(obj, GST_TYPE_BASE_SRC));
end;

function GST_BASE_SRC_CLASS(klass: Pointer): PGstBaseSrcClass;
begin
  Result := PGstBaseSrcClass(g_type_check_class_cast(klass, GST_TYPE_BASE_SRC));
end;

function GST_IS_BASE_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BASE_SRC);
end;

function GST_IS_BASE_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BASE_SRC);
end;

function GST_BASE_SRC_GET_CLASS(obj: Pointer): PGstBaseSrcClass;
begin
  Result := PGstBaseSrcClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_BASE_SRC_CAST(obj: Pointer): PGstBaseSrc;
begin
  GST_BASE_SRC_CAST := PGstBaseSrc(obj);
end;

function GST_BASE_SRC_IS_STARTING(obj: Pointer): Tgboolean;
begin
  GST_BASE_SRC_IS_STARTING := GST_OBJECT_FLAG_IS_SET(obj, GST_BASE_SRC_FLAG_STARTING);
end;

function GST_BASE_SRC_IS_STARTED(obj: Pointer): Tgboolean;
begin
  GST_BASE_SRC_IS_STARTED := GST_OBJECT_FLAG_IS_SET(obj, GST_BASE_SRC_FLAG_STARTED);
end;

function GST_BASE_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_BASE_SRC_PAD := (GST_BASE_SRC_CAST(obj))^.srcpad;
end;


{$ENDIF read_implementation}
