/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAggregatorPrivate = record
  end;
  PGstAggregatorPrivate = ^TGstAggregatorPrivate;

  TGstAggregator = record
    parent: TGstElement;
    srcpad: PGstPad;
    priv: PGstAggregatorPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstAggregator = ^TGstAggregator;

  TGstAggregatorPadPrivate = record
  end;
  PGstAggregatorPadPrivate = ^TGstAggregatorPadPrivate;

  TGstAggregatorPad = record
    parent: TGstPad;
    segment: TGstSegment;
    priv: PGstAggregatorPadPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAggregatorPad = ^TGstAggregatorPad;

  TGstAggregatorClass = record
    parent_class: TGstElementClass;
    flush: function(aggregator: PGstAggregator): TGstFlowReturn; cdecl;
    clip: function(aggregator: PGstAggregator; aggregator_pad: PGstAggregatorPad; buf: PGstBuffer): PGstBuffer; cdecl;
    finish_buffer: function(aggregator: PGstAggregator; buffer: PGstBuffer): TGstFlowReturn; cdecl;
    sink_event: function(aggregator: PGstAggregator; aggregator_pad: PGstAggregatorPad; event: PGstEvent): Tgboolean; cdecl;
    sink_query: function(aggregator: PGstAggregator; aggregator_pad: PGstAggregatorPad; query: PGstQuery): Tgboolean; cdecl;
    src_event: function(aggregator: PGstAggregator; event: PGstEvent): Tgboolean; cdecl;
    src_query: function(aggregator: PGstAggregator; query: PGstQuery): Tgboolean; cdecl;
    src_activate: function(aggregator: PGstAggregator; mode: TGstPadMode; active: Tgboolean): Tgboolean; cdecl;
    aggregate: function(aggregator: PGstAggregator; timeout: Tgboolean): TGstFlowReturn; cdecl;
    stop: function(aggregator: PGstAggregator): Tgboolean; cdecl;
    start: function(aggregator: PGstAggregator): Tgboolean; cdecl;
    get_next_time: function(aggregator: PGstAggregator): TGstClockTime; cdecl;
    create_new_pad: function(self: PGstAggregator; templ: PGstPadTemplate; req_name: Pgchar; caps: PGstCaps): PGstAggregatorPad; cdecl;
    update_src_caps: function(self: PGstAggregator; caps: PGstCaps; ret: PPGstCaps): TGstFlowReturn; cdecl;
    fixate_src_caps: function(self: PGstAggregator; caps: PGstCaps): PGstCaps; cdecl;
    negotiated_src_caps: function(self: PGstAggregator; caps: PGstCaps): Tgboolean; cdecl;
    decide_allocation: function(self: PGstAggregator; query: PGstQuery): Tgboolean; cdecl;
    propose_allocation: function(self: PGstAggregator; pad: PGstAggregatorPad; decide_query: PGstQuery; query: PGstQuery): Tgboolean; cdecl;
    negotiate: function(self: PGstAggregator): Tgboolean; cdecl;
    sink_event_pre_queue: function(aggregator: PGstAggregator; aggregator_pad: PGstAggregatorPad; event: PGstEvent): TGstFlowReturn; cdecl;
    sink_query_pre_queue: function(aggregator: PGstAggregator; aggregator_pad: PGstAggregatorPad; query: PGstQuery): Tgboolean; cdecl;
    finish_buffer_list: function(aggregator: PGstAggregator; bufferlist: PGstBufferList): TGstFlowReturn; cdecl;
    peek_next_sample: function(aggregator: PGstAggregator; aggregator_pad: PGstAggregatorPad): PGstSample; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 5) - 1] of Tgpointer;
  end;
  PGstAggregatorClass = ^TGstAggregatorClass;

  TGstAggregatorPadClass = record
    parent_class: TGstPadClass;
    flush: function(aggpad: PGstAggregatorPad; aggregator: PGstAggregator): TGstFlowReturn; cdecl;
    skip_buffer: function(aggpad: PGstAggregatorPad; aggregator: PGstAggregator; buffer: PGstBuffer): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstAggregatorPadClass = ^TGstAggregatorPadClass;

function gst_aggregator_pad_get_type: TGType; cdecl; external libgstbase;
function gst_aggregator_pad_pop_buffer(pad: PGstAggregatorPad): PGstBuffer; cdecl; external libgstbase;
function gst_aggregator_pad_peek_buffer(pad: PGstAggregatorPad): PGstBuffer; cdecl; external libgstbase;
function gst_aggregator_pad_drop_buffer(pad: PGstAggregatorPad): Tgboolean; cdecl; external libgstbase;
function gst_aggregator_pad_has_buffer(pad: PGstAggregatorPad): Tgboolean; cdecl; external libgstbase;
function gst_aggregator_pad_is_eos(pad: PGstAggregatorPad): Tgboolean; cdecl; external libgstbase;
function gst_aggregator_pad_is_inactive(pad: PGstAggregatorPad): Tgboolean; cdecl; external libgstbase;

const
  GST_AGGREGATOR_FLOW_NEED_DATA = GST_FLOW_CUSTOM_ERROR;

function gst_aggregator_finish_buffer(aggregator: PGstAggregator; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstbase;
function gst_aggregator_finish_buffer_list(aggregator: PGstAggregator; bufferlist: PGstBufferList): TGstFlowReturn; cdecl; external libgstbase;
procedure gst_aggregator_set_src_caps(self: PGstAggregator; caps: PGstCaps); cdecl; external libgstbase;
function gst_aggregator_negotiate(self: PGstAggregator): Tgboolean; cdecl; external libgstbase;
procedure gst_aggregator_set_latency(self: PGstAggregator; min_latency: TGstClockTime; max_latency: TGstClockTime); cdecl; external libgstbase;
function gst_aggregator_get_type: TGType; cdecl; external libgstbase;
function gst_aggregator_get_latency(self: PGstAggregator): TGstClockTime; cdecl; external libgstbase;
function gst_aggregator_get_buffer_pool(self: PGstAggregator): PGstBufferPool; cdecl; external libgstbase;
procedure gst_aggregator_get_allocator(self: PGstAggregator; allocator: PPGstAllocator; params: PGstAllocationParams); cdecl; external libgstbase;
function gst_aggregator_simple_get_next_time(self: PGstAggregator): TGstClockTime; cdecl; external libgstbase;
procedure gst_aggregator_update_segment(self: PGstAggregator; segment: PGstSegment); cdecl; external libgstbase;
function gst_aggregator_peek_next_sample(self: PGstAggregator; pad: PGstAggregatorPad): PGstSample; cdecl; external libgstbase;
procedure gst_aggregator_selected_samples(self: PGstAggregator; pts: TGstClockTime; dts: TGstClockTime; duration: TGstClockTime; info: PGstStructure); cdecl; external libgstbase;
procedure gst_aggregator_set_ignore_inactive_pads(self: PGstAggregator; ignore: Tgboolean); cdecl; external libgstbase;
function gst_aggregator_get_ignore_inactive_pads(self: PGstAggregator): Tgboolean; cdecl; external libgstbase;
function gst_aggregator_get_force_live(self: PGstAggregator): Tgboolean; cdecl; external libgstbase;
procedure gst_aggregator_set_force_live(self: PGstAggregator; force_live: Tgboolean); cdecl; external libgstbase;

type
  PGstAggregatorStartTimeSelection = ^TGstAggregatorStartTimeSelection;
  TGstAggregatorStartTimeSelection = longint;

const
  GST_AGGREGATOR_START_TIME_SELECTION_ZERO = 0;
  GST_AGGREGATOR_START_TIME_SELECTION_FIRST = 1;
  GST_AGGREGATOR_START_TIME_SELECTION_SET = 2;

function gst_aggregator_start_time_selection_get_type: TGType; cdecl; external libgstbase;

function GST_AGGREGATOR_PAD_CAST(obj: Pointer): PGstAggregatorPad;
function GST_AGGREGATOR_CAST(obj: Pointer): PGstAggregator;

function GST_AGGREGATOR_SRC_PAD(agg: Pointer): PGstPad;

// === Konventiert am: 27-9-24 19:55:07 ===

function GST_TYPE_AGGREGATOR_PAD: TGType;
function GST_AGGREGATOR_PAD(obj: Pointer): PGstAggregatorPad;
function GST_AGGREGATOR_PAD_CLASS(klass: Pointer): PGstAggregatorPadClass;
function GST_IS_AGGREGATOR_PAD(obj: Pointer): Tgboolean;
function GST_IS_AGGREGATOR_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_AGGREGATOR_PAD_GET_CLASS(obj: Pointer): PGstAggregatorPadClass;

function GST_TYPE_AGGREGATOR: TGType;
function GST_AGGREGATOR(obj: Pointer): PGstAggregator;
function GST_AGGREGATOR_CLASS(klass: Pointer): PGstAggregatorClass;
function GST_IS_AGGREGATOR(obj: Pointer): Tgboolean;
function GST_IS_AGGREGATOR_CLASS(klass: Pointer): Tgboolean;
function GST_AGGREGATOR_GET_CLASS(obj: Pointer): PGstAggregatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AGGREGATOR_PAD: TGType;
begin
  GST_TYPE_AGGREGATOR_PAD := gst_aggregator_pad_get_type;
end;

function GST_AGGREGATOR_PAD(obj: Pointer): PGstAggregatorPad;
begin
  Result := PGstAggregatorPad(g_type_check_instance_cast(obj, GST_TYPE_AGGREGATOR_PAD));
end;

function GST_AGGREGATOR_PAD_CLASS(klass: Pointer): PGstAggregatorPadClass;
begin
  Result := PGstAggregatorPadClass(g_type_check_class_cast(klass, GST_TYPE_AGGREGATOR_PAD));
end;

function GST_IS_AGGREGATOR_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AGGREGATOR_PAD);
end;

function GST_IS_AGGREGATOR_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AGGREGATOR_PAD);
end;

function GST_AGGREGATOR_PAD_GET_CLASS(obj: Pointer): PGstAggregatorPadClass;
begin
  Result := PGstAggregatorPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_AGGREGATOR: TGType;
begin
  GST_TYPE_AGGREGATOR := gst_aggregator_get_type;
end;

function GST_AGGREGATOR(obj: Pointer): PGstAggregator;
begin
  Result := PGstAggregator(g_type_check_instance_cast(obj, GST_TYPE_AGGREGATOR));
end;

function GST_AGGREGATOR_CLASS(klass: Pointer): PGstAggregatorClass;
begin
  Result := PGstAggregatorClass(g_type_check_class_cast(klass, GST_TYPE_AGGREGATOR));
end;

function GST_IS_AGGREGATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AGGREGATOR);
end;

function GST_IS_AGGREGATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AGGREGATOR);
end;

function GST_AGGREGATOR_GET_CLASS(obj: Pointer): PGstAggregatorClass;
begin
  Result := PGstAggregatorClass(PGTypeInstance(obj)^.g_class);
end;


// ====


function GST_AGGREGATOR_PAD_CAST(obj: Pointer): PGstAggregatorPad;
begin
  GST_AGGREGATOR_PAD_CAST := PGstAggregatorPad(obj);
end;

function GST_AGGREGATOR_CAST(obj: Pointer): PGstAggregator;
begin
  GST_AGGREGATOR_CAST := PGstAggregator(obj);
end;

function GST_AGGREGATOR_SRC_PAD(agg: Pointer): PGstPad;
begin
  GST_AGGREGATOR_SRC_PAD := (PGstAggregator(agg))^.srcpad;
end;


{$ENDIF read_implementation}
