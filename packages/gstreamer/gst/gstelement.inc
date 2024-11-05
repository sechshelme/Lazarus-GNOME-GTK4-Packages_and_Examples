/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstState = ^TGstState;
  TGstState = longint;

const
  GST_STATE_VOID_PENDING = 0;
  GST_STATE_NULL = 1;
  GST_STATE_READY = 2;
  GST_STATE_PAUSED = 3;
  GST_STATE_PLAYING = 4;

type
  PGstStateChangeReturn = ^TGstStateChangeReturn;
  TGstStateChangeReturn = longint;

const
  GST_STATE_CHANGE_FAILURE = 0;
  GST_STATE_CHANGE_SUCCESS = 1;
  GST_STATE_CHANGE_ASYNC = 2;
  GST_STATE_CHANGE_NO_PREROLL = 3;

type
  PGstStateChange = ^TGstStateChange;
  TGstStateChange = longint;

const
  GST_STATE_CHANGE_NULL_TO_READY = (GST_STATE_NULL shl 3) or GST_STATE_READY;
  GST_STATE_CHANGE_READY_TO_PAUSED = (GST_STATE_READY shl 3) or GST_STATE_PAUSED;
  GST_STATE_CHANGE_PAUSED_TO_PLAYING = (GST_STATE_PAUSED shl 3) or GST_STATE_PLAYING;
  GST_STATE_CHANGE_PLAYING_TO_PAUSED = (GST_STATE_PLAYING shl 3) or GST_STATE_PAUSED;
  GST_STATE_CHANGE_PAUSED_TO_READY = (GST_STATE_PAUSED shl 3) or GST_STATE_READY;
  GST_STATE_CHANGE_READY_TO_NULL = (GST_STATE_READY shl 3) or GST_STATE_NULL;
  GST_STATE_CHANGE_NULL_TO_NULL = (GST_STATE_NULL shl 3) or GST_STATE_NULL;
  GST_STATE_CHANGE_READY_TO_READY = (GST_STATE_READY shl 3) or GST_STATE_READY;
  GST_STATE_CHANGE_PAUSED_TO_PAUSED = (GST_STATE_PAUSED shl 3) or GST_STATE_PAUSED;
  GST_STATE_CHANGE_PLAYING_TO_PLAYING = (GST_STATE_PLAYING shl 3) or GST_STATE_PLAYING;

type
  PGstElementFlags = ^TGstElementFlags;
  TGstElementFlags = longint;

const
  GST_ELEMENT_FLAG_LOCKED_STATE = GST_OBJECT_FLAG_LAST shl 0;
  GST_ELEMENT_FLAG_SINK = GST_OBJECT_FLAG_LAST shl 1;
  GST_ELEMENT_FLAG_SOURCE = GST_OBJECT_FLAG_LAST shl 2;
  GST_ELEMENT_FLAG_PROVIDE_CLOCK = GST_OBJECT_FLAG_LAST shl 3;
  GST_ELEMENT_FLAG_REQUIRE_CLOCK = GST_OBJECT_FLAG_LAST shl 4;
  GST_ELEMENT_FLAG_INDEXABLE = GST_OBJECT_FLAG_LAST shl 5;
  GST_ELEMENT_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 10;

function gst_make_element_message_details(Name: PChar): PGstStructure; varargs cdecl; external libgstreamer;

type
  TGstElement = record
    obj: TGstObject;
    state_lock: TGRecMutex;
    state_cond: TGCond;
    state_cookie: Tguint32;
    target_state: TGstState;
    current_state: TGstState;
    next_state: TGstState;
    pending_state: TGstState;
    last_return: TGstStateChangeReturn;
    bus: PGstBus;
    clock: PGstClock;
    base_time: TGstClockTimeDiff;
    start_time: TGstClockTime;
    numpads: Tguint16;
    pads: PGList;
    numsrcpads: Tguint16;
    srcpads: PGList;
    numsinkpads: Tguint16;
    sinkpads: PGList;
    pads_cookie: Tguint32;
    contexts: PGList;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  PGstElement = ^TGstElement;
  PPGstElement = ^PGstElement;

  TGstElementClass = record
    parent_class: TGstObjectClass;
    metadata: Tgpointer;
    elementfactory: PGstElementFactory;
    padtemplates: PGList;
    numpadtemplates: Tgint;
    pad_templ_cookie: Tguint32;
    pad_added: procedure(element: PGstElement; pad: PGstPad); cdecl;
    pad_removed: procedure(element: PGstElement; pad: PGstPad); cdecl;
    no_more_pads: procedure(element: PGstElement); cdecl;
    request_new_pad: function(element: PGstElement; templ: PGstPadTemplate; Name: Pgchar; caps: PGstCaps): PGstPad; cdecl;
    release_pad: procedure(element: PGstElement; pad: PGstPad); cdecl;
    get_state: function(element: PGstElement; state: PGstState; pending: PGstState; timeout: TGstClockTime): TGstStateChangeReturn; cdecl;
    set_state: function(element: PGstElement; state: TGstState): TGstStateChangeReturn; cdecl;
    change_state: function(element: PGstElement; transition: TGstStateChange): TGstStateChangeReturn; cdecl;
    state_changed: procedure(element: PGstElement; oldstate: TGstState; newstate: TGstState; pending: TGstState); cdecl;
    set_bus: procedure(element: PGstElement; bus: PGstBus); cdecl;
    provide_clock: function(element: PGstElement): PGstClock; cdecl;
    set_clock: function(element: PGstElement; clock: PGstClock): Tgboolean; cdecl;
    send_event: function(element: PGstElement; event: PGstEvent): Tgboolean; cdecl;
    query: function(element: PGstElement; query: PGstQuery): Tgboolean; cdecl;
    post_message: function(element: PGstElement; message: PGstMessage): Tgboolean; cdecl;
    set_context: procedure(element: PGstElement; context: PGstContext); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 2) - 1] of Tgpointer;
  end;
  PGstElementClass = ^TGstElementClass;

  // ausgelagert
  TGstDeviceClass = record
    parent_class: TGstObjectClass;
    create_element: function(device: PGstDevice; Name: Pgchar): PGstElement; cdecl;
    reconfigure_element: function(device: PGstDevice; element: PGstElement): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDeviceClass = ^TGstDeviceClass;

function gst_device_create_element(device: PGstDevice; Name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_device_reconfigure_element(device: PGstDevice; element: PGstElement): Tgboolean; cdecl; external libgstreamer;
// ----

// ausgelagert      gstmessage.h
function gst_message_new_state_changed(src: PGstObject; oldstate: TGstState; newstate: TGstState; pending: TGstState): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_state_changed(message: PGstMessage; oldstate: PGstState; newstate: PGstState; pending: PGstState); cdecl; external libgstreamer;

function gst_message_new_structure_change(src: PGstObject; _type: TGstStructureChangeType; owner: PGstElement; busy: Tgboolean): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_structure_change(message: PGstMessage; _type: PGstStructureChangeType; owner: PPGstElement; busy: Pgboolean); cdecl; external libgstreamer;
function gst_message_new_stream_status(src: PGstObject; _type: TGstStreamStatusType; owner: PGstElement): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_stream_status(message: PGstMessage; _type: PGstStreamStatusType; owner: PPGstElement); cdecl; external libgstreamer;

function gst_message_new_request_state(src: PGstObject; state: TGstState): PGstMessage; cdecl; external libgstreamer;
procedure gst_message_parse_request_state(message: PGstMessage; state: PGstState); cdecl; external libgstreamer;
// ---

procedure gst_element_class_add_pad_template(klass: PGstElementClass; templ: PGstPadTemplate); cdecl; external libgstreamer;
procedure gst_element_class_add_static_pad_template(klass: PGstElementClass; static_templ: PGstStaticPadTemplate); cdecl; external libgstreamer;
procedure gst_element_class_add_static_pad_template_with_gtype(klass: PGstElementClass; static_templ: PGstStaticPadTemplate; pad_type: TGType); cdecl; external libgstreamer;
function gst_element_class_get_pad_template(element_class: PGstElementClass; Name: Pgchar): PGstPadTemplate; cdecl; external libgstreamer;
function gst_element_class_get_pad_template_list(element_class: PGstElementClass): PGList; cdecl; external libgstreamer;
procedure gst_element_class_set_metadata(klass: PGstElementClass; longname: Pgchar; classification: Pgchar; description: Pgchar; author: Pgchar); cdecl; external libgstreamer;
procedure gst_element_class_set_static_metadata(klass: PGstElementClass; longname: Pgchar; classification: Pgchar; description: Pgchar; author: Pgchar); cdecl; external libgstreamer;
procedure gst_element_class_add_metadata(klass: PGstElementClass; key: Pgchar; Value: Pgchar); cdecl; external libgstreamer;
procedure gst_element_class_add_static_metadata(klass: PGstElementClass; key: Pgchar; Value: Pgchar); cdecl; external libgstreamer;
function gst_element_class_get_metadata(klass: PGstElementClass; key: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_element_get_type: TGType; cdecl; external libgstreamer;

function gst_element_provide_clock(element: PGstElement): PGstClock; cdecl; external libgstreamer;
function gst_element_get_clock(element: PGstElement): PGstClock; cdecl; external libgstreamer;
function gst_element_set_clock(element: PGstElement; clock: PGstClock): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_set_base_time(element: PGstElement; time: TGstClockTime); cdecl; external libgstreamer;
function gst_element_get_base_time(element: PGstElement): TGstClockTime; cdecl; external libgstreamer;
procedure gst_element_set_start_time(element: PGstElement; time: TGstClockTime); cdecl; external libgstreamer;
function gst_element_get_start_time(element: PGstElement): TGstClockTime; cdecl; external libgstreamer;
function gst_element_get_current_running_time(element: PGstElement): TGstClockTime; cdecl; external libgstreamer;
function gst_element_get_current_clock_time(element: PGstElement): TGstClockTime; cdecl; external libgstreamer;
procedure gst_element_set_bus(element: PGstElement; bus: PGstBus); cdecl; external libgstreamer;
function gst_element_get_bus(element: PGstElement): PGstBus; cdecl; external libgstreamer;
procedure gst_element_set_context(element: PGstElement; context: PGstContext); cdecl; external libgstreamer;
function gst_element_get_contexts(element: PGstElement): PGList; cdecl; external libgstreamer;
function gst_element_get_context(element: PGstElement; context_type: Pgchar): PGstContext; cdecl; external libgstreamer;
function gst_element_get_context_unlocked(element: PGstElement; context_type: Pgchar): PGstContext; cdecl; external libgstreamer;
function gst_element_add_pad(element: PGstElement; pad: PGstPad): Tgboolean; cdecl; external libgstreamer;
function gst_element_remove_pad(element: PGstElement; pad: PGstPad): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_no_more_pads(element: PGstElement); cdecl; external libgstreamer;
function gst_element_get_static_pad(element: PGstElement; Name: Pgchar): PGstPad; cdecl; external libgstreamer;
function gst_element_get_request_pad(element: PGstElement; Name: Pgchar): PGstPad; cdecl; external libgstreamer;
function gst_element_request_pad_simple(element: PGstElement; Name: Pgchar): PGstPad; cdecl; external libgstreamer;
function gst_element_request_pad(element: PGstElement; templ: PGstPadTemplate; Name: Pgchar; caps: PGstCaps): PGstPad; cdecl; external libgstreamer;
procedure gst_element_release_request_pad(element: PGstElement; pad: PGstPad); cdecl; external libgstreamer;
function gst_element_iterate_pads(element: PGstElement): PGstIterator; cdecl; external libgstreamer;
function gst_element_iterate_src_pads(element: PGstElement): PGstIterator; cdecl; external libgstreamer;
function gst_element_iterate_sink_pads(element: PGstElement): PGstIterator; cdecl; external libgstreamer;

type
  TGstElementForeachPadFunc = function(element: PGstElement; pad: PGstPad; user_data: Tgpointer): Tgboolean; cdecl;

function gst_element_foreach_sink_pad(element: PGstElement; func: TGstElementForeachPadFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_element_foreach_src_pad(element: PGstElement; func: TGstElementForeachPadFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_element_foreach_pad(element: PGstElement; func: TGstElementForeachPadFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_element_send_event(element: PGstElement; event: PGstEvent): Tgboolean; cdecl; external libgstreamer;
function gst_element_seek(element: PGstElement; rate: Tgdouble; format: TGstFormat; flags: TGstSeekFlags; start_type: TGstSeekType;
  start: Tgint64; stop_type: TGstSeekType; stop: Tgint64): Tgboolean; cdecl; external libgstreamer;
function gst_element_query(element: PGstElement; query: PGstQuery): Tgboolean; cdecl; external libgstreamer;
function gst_element_post_message(element: PGstElement; message: PGstMessage): Tgboolean; cdecl; external libgstreamer;

function _gst_element_error_printf(format: Pgchar): Pgchar; varargs cdecl; external libgstreamer;

procedure gst_element_message_full(element: PGstElement; _type: TGstMessageType; domain: TGQuark; code: Tgint; Text: Pgchar;
  debug: Pgchar; file_: Pgchar; _function: Pgchar; line: Tgint); cdecl; external libgstreamer;
procedure gst_element_message_full_with_details(element: PGstElement; _type: TGstMessageType; domain: TGQuark; code: Tgint; Text: Pgchar;
  debug: Pgchar; file_: Pgchar; _function: Pgchar; line: Tgint; structure: PGstStructure); cdecl; external libgstreamer;
function gst_element_is_locked_state(element: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_element_set_locked_state(element: PGstElement; locked_state: Tgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_element_sync_state_with_parent(element: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_element_get_state(element: PGstElement; state: PGstState; pending: PGstState; timeout: TGstClockTime): TGstStateChangeReturn; cdecl; external libgstreamer;
function gst_element_set_state(element: PGstElement; state: TGstState): TGstStateChangeReturn; cdecl; external libgstreamer;
procedure gst_element_abort_state(element: PGstElement); cdecl; external libgstreamer;
function gst_element_change_state(element: PGstElement; transition: TGstStateChange): TGstStateChangeReturn; cdecl; external libgstreamer;
function gst_element_continue_state(element: PGstElement; ret: TGstStateChangeReturn): TGstStateChangeReturn; cdecl; external libgstreamer;
procedure gst_element_lost_state(element: PGstElement); cdecl; external libgstreamer;

type
  TGstElementCallAsyncFunc = procedure(element: PGstElement; user_data: Tgpointer); cdecl;

procedure gst_element_call_async(element: PGstElement; func: TGstElementCallAsyncFunc; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstreamer;
function gst_element_get_factory(element: PGstElement): PGstElementFactory; cdecl; external libgstreamer;
function gst_element_add_property_notify_watch(element: PGstElement; property_name: Pgchar; include_value: Tgboolean): Tgulong; cdecl; external libgstreamer;
function gst_element_add_property_deep_notify_watch(element: PGstElement; property_name: Pgchar; include_value: Tgboolean): Tgulong; cdecl; external libgstreamer;
procedure gst_element_remove_property_notify_watch(element: PGstElement; watch_id: Tgulong); cdecl; external libgstreamer;
function gst_element_get_pad_template(element: PGstElement; Name: Pgchar): PGstPadTemplate; cdecl; external libgstreamer;
function gst_element_get_pad_template_list(element: PGstElement): PGList; cdecl; external libgstreamer;
function gst_element_get_metadata(element: PGstElement; key: Pgchar): Pgchar; cdecl; external libgstreamer;

function GST_ELEMENT_CAST(obj: Pointer): PGstElement;

function GST_STATE(elem: Pointer): TGstState;
function GST_STATE_NEXT(elem: Pointer): TGstState;
function GST_STATE_PENDING(elem: Pointer): TGstState;
function GST_STATE_TARGET(elem: Pointer): TGstState;
function GST_STATE_RETURN(elem: Pointer): TGstStateChangeReturn;
function __GST_SIGN(val: longint): longint;
function GST_STATE_GET_NEXT(cur, pending: longint): TGstState;
function GST_STATE_TRANSITION(cur, Next: longint): TGstStateChange;
function GST_STATE_TRANSITION_CURRENT(trans: longint): TGstState;
function GST_STATE_TRANSITION_NEXT(trans: longint): TGstState;

function GST_ELEMENT_NAME(elem: Pointer): Pgchar;
function GST_ELEMENT_PARENT(elem: Pointer): PGstElement;
function GST_ELEMENT_BUS(elem: Pointer): PGstBus;
function GST_ELEMENT_CLOCK(elem: Pointer): PGstClock;
function GST_ELEMENT_PADS(elem: Pointer): PGList;
function GST_ELEMENT_START_TIME(elem: Pointer): TGstClockTime;

function GST_STATE_GET_LOCK(elem: Pointer): PGRecMutex;
function GST_STATE_GET_COND(elem: Pointer): PGCond;
procedure GST_STATE_LOCK(elem: Pointer);
function GST_STATE_TRYLOCK(elem: Pointer): Tgboolean;
procedure GST_STATE_UNLOCK(elem: Pointer);
procedure GST_STATE_WAIT(elem: Pointer);
function GST_STATE_WAIT_UNTIL(elem: Pointer; end_time: Tgint64): Tgboolean;
procedure GST_STATE_SIGNAL(elem: Pointer);
procedure GST_STATE_BROADCAST(elem: Pointer);

function gst_element_get_name(elem: Pointer): Pgchar;
function gst_element_set_name(elem: Pointer; Name: Pgchar): Tgboolean;
function gst_element_get_parent(elem: Pointer): PGstObject;
function gst_element_set_parent(elem: Pointer; parent: PGstObject): Tgboolean;


// ausglagert
function GST_DEVICE_CLASS(klass: Pointer): PGstDeviceClass;
function GST_DEVICE_GET_CLASS(obj: Pointer): PGstDeviceClass;
// ----


// === Konventiert am: 11-9-24 16:14:38 ===

function GST_TYPE_ELEMENT: TGType;
function GST_ELEMENT(obj: Pointer): PGstElement;
function GST_ELEMENT_CLASS(klass: Pointer): PGstElementClass;
function GST_IS_ELEMENT(obj: Pointer): Tgboolean;
function GST_IS_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function GST_ELEMENT_GET_CLASS(obj: Pointer): PGstElementClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ELEMENT: TGType;
begin
  GST_TYPE_ELEMENT := gst_element_get_type;
end;

function GST_ELEMENT(obj: Pointer): PGstElement;
begin
  Result := PGstElement(g_type_check_instance_cast(obj, GST_TYPE_ELEMENT));
end;

function GST_ELEMENT_CLASS(klass: Pointer): PGstElementClass;
begin
  Result := PGstElementClass(g_type_check_class_cast(klass, GST_TYPE_ELEMENT));
end;

function GST_IS_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ELEMENT);
end;

function GST_IS_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_ELEMENT);
end;

function GST_ELEMENT_GET_CLASS(obj: Pointer): PGstElementClass;
begin
  Result := PGstElementClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_ELEMENT_CAST(obj: Pointer): PGstElement;
begin
  GST_ELEMENT_CAST := PGstElement(obj);
end;

function GST_STATE(elem: Pointer): TGstState;
begin
  GST_STATE := (GST_ELEMENT_CAST(elem))^.current_state;
end;

function GST_STATE_NEXT(elem: Pointer): TGstState;
begin
  GST_STATE_NEXT := (GST_ELEMENT_CAST(elem))^.next_state;
end;

function GST_STATE_PENDING(elem: Pointer): TGstState;
begin
  GST_STATE_PENDING := (GST_ELEMENT_CAST(elem))^.pending_state;
end;

function GST_STATE_TARGET(elem: Pointer): TGstState;
begin
  GST_STATE_TARGET := (GST_ELEMENT_CAST(elem))^.target_state;
end;

function GST_STATE_RETURN(elem: Pointer): TGstStateChangeReturn;
begin
  GST_STATE_RETURN := (GST_ELEMENT_CAST(elem))^.last_return;
end;

// #define __GST_SIGN(val)                 ((val) < 0 ? -1 : ((val) > 0 ? 1 : 0))
function __GST_SIGN(val: longint): longint;
begin
  Result := 0;
  if val < 0 then begin
    Exit(-1);
  end;
  if val > 0 then begin
    Exit(1);
  end;
end;

function GST_STATE_GET_NEXT(cur, pending: longint): TGstState;
begin
  GST_STATE_GET_NEXT := TGstState(cur + __GST_SIGN(pending - cur));
end;

function GST_STATE_TRANSITION(cur, Next: longint): TGstStateChange;
begin
  GST_STATE_TRANSITION := TGstStateChange((cur shl 3) or Next);
end;

function GST_STATE_TRANSITION_CURRENT(trans: longint): TGstState;
begin
  GST_STATE_TRANSITION_CURRENT := TGstState(trans shr 3);
end;

function GST_STATE_TRANSITION_NEXT(trans: longint): TGstState;
begin
  GST_STATE_TRANSITION_NEXT := TGstState(trans and $7);
end;

function GST_ELEMENT_NAME(elem: Pointer): Pgchar;
begin
  GST_ELEMENT_NAME := GST_OBJECT_NAME(elem);
end;

function GST_ELEMENT_PARENT(elem: Pointer): PGstElement;
begin
  GST_ELEMENT_PARENT := GST_ELEMENT_CAST(GST_OBJECT_PARENT(elem));
end;

function GST_ELEMENT_BUS(elem: Pointer): PGstBus;
begin
  GST_ELEMENT_BUS := (GST_ELEMENT_CAST(elem))^.bus;
end;

function GST_ELEMENT_CLOCK(elem: Pointer): PGstClock;
begin
  GST_ELEMENT_CLOCK := (GST_ELEMENT_CAST(elem))^.clock;
end;

function GST_ELEMENT_PADS(elem: Pointer): PGList;
begin
  GST_ELEMENT_PADS := (GST_ELEMENT_CAST(elem))^.pads;
end;

function GST_ELEMENT_START_TIME(elem: Pointer): TGstClockTime;
begin
  GST_ELEMENT_START_TIME := (GST_ELEMENT_CAST(elem))^.start_time;
end;

function GST_STATE_GET_LOCK(elem: Pointer): PGRecMutex;
begin
  GST_STATE_GET_LOCK := @((GST_ELEMENT_CAST(elem))^.state_lock);
end;

function GST_STATE_GET_COND(elem: Pointer): PGCond;
begin
  GST_STATE_GET_COND := @((GST_ELEMENT_CAST(elem))^.state_cond);
end;

procedure GST_STATE_LOCK(elem: Pointer);
begin
  g_rec_mutex_lock(GST_STATE_GET_LOCK(elem));
end;

function GST_STATE_TRYLOCK(elem: Pointer): Tgboolean;
begin
  GST_STATE_TRYLOCK := g_rec_mutex_trylock(GST_STATE_GET_LOCK(elem));
end;

procedure GST_STATE_UNLOCK(elem: Pointer);
begin
  g_rec_mutex_unlock(GST_STATE_GET_LOCK(elem));
end;

procedure GST_STATE_WAIT(elem: Pointer);
begin
  g_cond_wait(GST_STATE_GET_COND(elem), GST_OBJECT_GET_LOCK(elem));
end;

function GST_STATE_WAIT_UNTIL(elem: Pointer; end_time: Tgint64): Tgboolean;
begin
  GST_STATE_WAIT_UNTIL := g_cond_wait_until(GST_STATE_GET_COND(elem), GST_OBJECT_GET_LOCK(elem), end_time);
end;

procedure GST_STATE_SIGNAL(elem: Pointer);
begin
  g_cond_signal(GST_STATE_GET_COND(elem));
end;

procedure GST_STATE_BROADCAST(elem: Pointer);
begin
  g_cond_broadcast(GST_STATE_GET_COND(elem));
end;

function gst_element_get_name(elem: Pointer): Pgchar;
begin
  gst_element_get_name := gst_object_get_name(GST_OBJECT_CAST(elem));
end;

function gst_element_set_name(elem: Pointer; Name: Pgchar): Tgboolean;
begin
  gst_element_set_name := gst_object_set_name(GST_OBJECT_CAST(elem), Name);
end;

function gst_element_get_parent(elem: Pointer): PGstObject;
begin
  gst_element_get_parent := gst_object_get_parent(GST_OBJECT_CAST(elem));
end;

function gst_element_set_parent(elem: Pointer; parent: PGstObject): Tgboolean;
begin
  gst_element_set_parent := gst_object_set_parent(GST_OBJECT_CAST(elem), parent);
end;

// ausgelagert
function GST_DEVICE_CLASS(klass: Pointer): PGstDeviceClass;
begin
  Result := PGstDeviceClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE));
end;

function GST_DEVICE_GET_CLASS(obj: Pointer): PGstDeviceClass;
begin
  Result := PGstDeviceClass(PGTypeInstance(obj)^.g_class);
end;

// ----

{$ENDIF read_implementation}
