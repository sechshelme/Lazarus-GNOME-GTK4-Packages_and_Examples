
{$IFDEF read_interface}

const
  GST_BASE_TRANSFORM_SINK_NAME = 'sink';
  GST_BASE_TRANSFORM_SRC_NAME = 'src';

const
  GST_BASE_TRANSFORM_FLOW_DROPPED = GST_FLOW_CUSTOM_SUCCESS;

type
  TGstBaseTransformPrivate = record
  end;
  PGstBaseTransformPrivate = ^TGstBaseTransformPrivate;

  TGstBaseTransform = record
    element: TGstElement;
    sinkpad: PGstPad;
    srcpad: PGstPad;
    have_segment: Tgboolean;
    segment: TGstSegment;
    queued_buf: PGstBuffer;
    priv: PGstBaseTransformPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 1) - 1] of Tgpointer;
  end;
  PGstBaseTransform = ^TGstBaseTransform;

  TGstBaseTransformClass = record
    parent_class: TGstElementClass;
    passthrough_on_same_caps: Tgboolean;
    transform_ip_on_passthrough: Tgboolean;
    transform_caps: function(trans: PGstBaseTransform; direction: TGstPadDirection; caps: PGstCaps; filter: PGstCaps): PGstCaps; cdecl;
    fixate_caps: function(trans: PGstBaseTransform; direction: TGstPadDirection; caps: PGstCaps; othercaps: PGstCaps): PGstCaps; cdecl;
    accept_caps: function(trans: PGstBaseTransform; direction: TGstPadDirection; caps: PGstCaps): Tgboolean; cdecl;
    set_caps: function(trans: PGstBaseTransform; incaps: PGstCaps; outcaps: PGstCaps): Tgboolean; cdecl;
    query: function(trans: PGstBaseTransform; direction: TGstPadDirection; query: PGstQuery): Tgboolean; cdecl;
    decide_allocation: function(trans: PGstBaseTransform; query: PGstQuery): Tgboolean; cdecl;
    filter_meta: function(trans: PGstBaseTransform; query: PGstQuery; api: TGType; params: PGstStructure): Tgboolean; cdecl;
    propose_allocation: function(trans: PGstBaseTransform; decide_query: PGstQuery; query: PGstQuery): Tgboolean; cdecl;
    transform_size: function(trans: PGstBaseTransform; direction: TGstPadDirection; caps: PGstCaps; size: Tgsize; othercaps: PGstCaps;
      othersize: Pgsize): Tgboolean; cdecl;
    get_unit_size: function(trans: PGstBaseTransform; caps: PGstCaps; size: Pgsize): Tgboolean; cdecl;
    start: function(trans: PGstBaseTransform): Tgboolean; cdecl;
    stop: function(trans: PGstBaseTransform): Tgboolean; cdecl;
    sink_event: function(trans: PGstBaseTransform; event: PGstEvent): Tgboolean; cdecl;
    src_event: function(trans: PGstBaseTransform; event: PGstEvent): Tgboolean; cdecl;
    prepare_output_buffer: function(trans: PGstBaseTransform; input: PGstBuffer; outbuf: PPGstBuffer): TGstFlowReturn; cdecl;
    copy_metadata: function(trans: PGstBaseTransform; input: PGstBuffer; outbuf: PGstBuffer): Tgboolean; cdecl;
    transform_meta: function(trans: PGstBaseTransform; outbuf: PGstBuffer; meta: PGstMeta; inbuf: PGstBuffer): Tgboolean; cdecl;
    before_transform: procedure(trans: PGstBaseTransform; buffer: PGstBuffer); cdecl;
    transform: function(trans: PGstBaseTransform; inbuf: PGstBuffer; outbuf: PGstBuffer): TGstFlowReturn; cdecl;
    transform_ip: function(trans: PGstBaseTransform; buf: PGstBuffer): TGstFlowReturn; cdecl;
    submit_input_buffer: function(trans: PGstBaseTransform; is_discont: Tgboolean; input: PGstBuffer): TGstFlowReturn; cdecl;
    generate_output: function(trans: PGstBaseTransform; outbuf: PPGstBuffer): TGstFlowReturn; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 2) - 1] of Tgpointer;
  end;
  PGstBaseTransformClass = ^TGstBaseTransformClass;

function gst_base_transform_get_type: TGType; cdecl; external libgstbase;
procedure gst_base_transform_set_passthrough(trans: PGstBaseTransform; passthrough: Tgboolean); cdecl; external libgstbase;
function gst_base_transform_is_passthrough(trans: PGstBaseTransform): Tgboolean; cdecl; external libgstbase;
procedure gst_base_transform_set_in_place(trans: PGstBaseTransform; in_place: Tgboolean); cdecl; external libgstbase;
function gst_base_transform_is_in_place(trans: PGstBaseTransform): Tgboolean; cdecl; external libgstbase;
procedure gst_base_transform_update_qos(trans: PGstBaseTransform; proportion: Tgdouble; diff: TGstClockTimeDiff; timestamp: TGstClockTime); cdecl; external libgstbase;
procedure gst_base_transform_set_qos_enabled(trans: PGstBaseTransform; Enabled: Tgboolean); cdecl; external libgstbase;
function gst_base_transform_is_qos_enabled(trans: PGstBaseTransform): Tgboolean; cdecl; external libgstbase;
procedure gst_base_transform_set_gap_aware(trans: PGstBaseTransform; gap_aware: Tgboolean); cdecl; external libgstbase;
procedure gst_base_transform_set_prefer_passthrough(trans: PGstBaseTransform; prefer_passthrough: Tgboolean); cdecl; external libgstbase;
function gst_base_transform_get_buffer_pool(trans: PGstBaseTransform): PGstBufferPool; cdecl; external libgstbase;
procedure gst_base_transform_get_allocator(trans: PGstBaseTransform; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstbase;
procedure gst_base_transform_reconfigure_sink(trans: PGstBaseTransform); cdecl; external libgstbase;
procedure gst_base_transform_reconfigure_src(trans: PGstBaseTransform); cdecl; external libgstbase;
function gst_base_transform_update_src_caps(trans: PGstBaseTransform; updated_caps: PGstCaps): Tgboolean; cdecl; external libgstbase;
function gst_base_transform_reconfigure(trans: PGstBaseTransform): Tgboolean; cdecl; external libgstbase;

function GST_BASE_TRANSFORM_CAST(obj: Pointer): PGstBaseTransform;
function GST_BASE_TRANSFORM_SRC_PAD(obj: Pointer): PGstPad;
function GST_BASE_TRANSFORM_SINK_PAD(obj: Pointer): PGstPad;

// === Konventiert am: 28-9-24 13:06:33 ===

function GST_TYPE_BASE_TRANSFORM: TGType;
function GST_BASE_TRANSFORM(obj: Pointer): PGstBaseTransform;
function GST_BASE_TRANSFORM_CLASS(klass: Pointer): PGstBaseTransformClass;
function GST_IS_BASE_TRANSFORM(obj: Pointer): Tgboolean;
function GST_IS_BASE_TRANSFORM_CLASS(klass: Pointer): Tgboolean;
function GST_BASE_TRANSFORM_GET_CLASS(obj: Pointer): PGstBaseTransformClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_BASE_TRANSFORM: TGType;
begin
  GST_TYPE_BASE_TRANSFORM := gst_base_transform_get_type;
end;

function GST_BASE_TRANSFORM(obj: Pointer): PGstBaseTransform;
begin
  Result := PGstBaseTransform(g_type_check_instance_cast(obj, GST_TYPE_BASE_TRANSFORM));
end;

function GST_BASE_TRANSFORM_CLASS(klass: Pointer): PGstBaseTransformClass;
begin
  Result := PGstBaseTransformClass(g_type_check_class_cast(klass, GST_TYPE_BASE_TRANSFORM));
end;

function GST_IS_BASE_TRANSFORM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BASE_TRANSFORM);
end;

function GST_IS_BASE_TRANSFORM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BASE_TRANSFORM);
end;

function GST_BASE_TRANSFORM_GET_CLASS(obj: Pointer): PGstBaseTransformClass;
begin
  Result := PGstBaseTransformClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_BASE_TRANSFORM_CAST(obj: Pointer): PGstBaseTransform;
begin
  GST_BASE_TRANSFORM_CAST := PGstBaseTransform(obj);
end;

function GST_BASE_TRANSFORM_SRC_PAD(obj: Pointer): PGstPad;
begin
  GST_BASE_TRANSFORM_SRC_PAD := (GST_BASE_TRANSFORM_CAST(obj))^.srcpad;
end;

function GST_BASE_TRANSFORM_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_BASE_TRANSFORM_SINK_PAD := (GST_BASE_TRANSFORM_CAST(obj))^.sinkpad;
end;


{$ENDIF read_implementation}
