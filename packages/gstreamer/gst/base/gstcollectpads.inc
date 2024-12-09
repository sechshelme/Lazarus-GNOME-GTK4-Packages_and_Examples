
{$IFDEF read_interface}

type
  PGstCollectPadsStateFlags = ^TGstCollectPadsStateFlags;
  TGstCollectPadsStateFlags = longint;

const
  GST_COLLECT_PADS_STATE_EOS = 1 shl 0;
  GST_COLLECT_PADS_STATE_FLUSHING = 1 shl 1;
  GST_COLLECT_PADS_STATE_NEW_SEGMENT = 1 shl 2;
  GST_COLLECT_PADS_STATE_WAITING = 1 shl 3;
  GST_COLLECT_PADS_STATE_LOCKED = 1 shl 4;

type
  TGstCollectPadsPrivate = record
  end;
  PGstCollectPadsPrivate = ^TGstCollectPadsPrivate;

  PGstCollectPads = ^TGstCollectPads;

  TGstCollectPads = record
    obj: TGstObject;
    Data: PGSList;
    stream_lock: TGRecMutex;
    priv: PGstCollectPadsPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstCollectPadsClass = ^TGstCollectPadsClass;

  TGstCollectPadsClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

type
  TGstCollectDataPrivate = record
  end;
  PGstCollectDataPrivate = ^TGstCollectDataPrivate;

  TGstCollectData = record
    collect: PGstCollectPads;
    pad: PGstPad;
    buffer: PGstBuffer;
    pos: Tguint;
    segment: TGstSegment;
    state: TGstCollectPadsStateFlags;
    priv: PGstCollectDataPrivate;
    ABI: record
      case longint of
        0: (abi: record
            dts: Tgint64;
            end);
        1: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
      end;
  end;
  PGstCollectData = ^TGstCollectData;

  TGstCollectDataDestroyNotify = procedure(Data: PGstCollectData); cdecl;
  TGstCollectPadsFunction = function(pads: PGstCollectPads; user_data: Tgpointer): TGstFlowReturn; cdecl;
  TGstCollectPadsBufferFunction = function(pads: PGstCollectPads; Data: PGstCollectData; buffer: PGstBuffer; user_data: Tgpointer): TGstFlowReturn; cdecl;
  TGstCollectPadsCompareFunction = function(pads: PGstCollectPads; data1: PGstCollectData; timestamp1: TGstClockTime; data2: PGstCollectData; timestamp2: TGstClockTime;
    user_data: Tgpointer): Tgint; cdecl;
  TGstCollectPadsEventFunction = function(pads: PGstCollectPads; pad: PGstCollectData; event: PGstEvent; user_data: Tgpointer): Tgboolean; cdecl;
  TGstCollectPadsQueryFunction = function(pads: PGstCollectPads; pad: PGstCollectData; query: PGstQuery; user_data: Tgpointer): Tgboolean; cdecl;
  TGstCollectPadsClipFunction = function(pads: PGstCollectPads; Data: PGstCollectData; inbuffer: PGstBuffer; outbuffer: PPGstBuffer; user_data: Tgpointer): TGstFlowReturn; cdecl;
  TGstCollectPadsFlushFunction = procedure(pads: PGstCollectPads; user_data: Tgpointer); cdecl;

function gst_collect_pads_get_type: TGType; cdecl; external libgstbase;
function gst_collect_pads_new: PGstCollectPads; cdecl; external libgstbase;
procedure gst_collect_pads_set_function(pads: PGstCollectPads; func: TGstCollectPadsFunction; user_data: Tgpointer); cdecl; external libgstbase;
procedure gst_collect_pads_set_buffer_function(pads: PGstCollectPads; func: TGstCollectPadsBufferFunction; user_data: Tgpointer); cdecl; external libgstbase;
procedure gst_collect_pads_set_event_function(pads: PGstCollectPads; func: TGstCollectPadsEventFunction; user_data: Tgpointer); cdecl; external libgstbase;
procedure gst_collect_pads_set_query_function(pads: PGstCollectPads; func: TGstCollectPadsQueryFunction; user_data: Tgpointer); cdecl; external libgstbase;
procedure gst_collect_pads_set_compare_function(pads: PGstCollectPads; func: TGstCollectPadsCompareFunction; user_data: Tgpointer); cdecl; external libgstbase;
procedure gst_collect_pads_set_clip_function(pads: PGstCollectPads; clipfunc: TGstCollectPadsClipFunction; user_data: Tgpointer); cdecl; external libgstbase;
procedure gst_collect_pads_set_flush_function(pads: PGstCollectPads; func: TGstCollectPadsFlushFunction; user_data: Tgpointer); cdecl; external libgstbase;
function gst_collect_pads_add_pad(pads: PGstCollectPads; pad: PGstPad; size: Tguint; destroy_notify: TGstCollectDataDestroyNotify; lock: Tgboolean): PGstCollectData; cdecl; external libgstbase;
function gst_collect_pads_remove_pad(pads: PGstCollectPads; pad: PGstPad): Tgboolean; cdecl; external libgstbase;
procedure gst_collect_pads_start(pads: PGstCollectPads); cdecl; external libgstbase;
procedure gst_collect_pads_stop(pads: PGstCollectPads); cdecl; external libgstbase;
procedure gst_collect_pads_set_flushing(pads: PGstCollectPads; flushing: Tgboolean); cdecl; external libgstbase;
function gst_collect_pads_peek(pads: PGstCollectPads; Data: PGstCollectData): PGstBuffer; cdecl; external libgstbase;
function gst_collect_pads_pop(pads: PGstCollectPads; Data: PGstCollectData): PGstBuffer; cdecl; external libgstbase;
function gst_collect_pads_available(pads: PGstCollectPads): Tguint; cdecl; external libgstbase;
function gst_collect_pads_flush(pads: PGstCollectPads; Data: PGstCollectData; size: Tguint): Tguint; cdecl; external libgstbase;
function gst_collect_pads_read_buffer(pads: PGstCollectPads; Data: PGstCollectData; size: Tguint): PGstBuffer; cdecl; external libgstbase;
function gst_collect_pads_take_buffer(pads: PGstCollectPads; Data: PGstCollectData; size: Tguint): PGstBuffer; cdecl; external libgstbase;
procedure gst_collect_pads_set_waiting(pads: PGstCollectPads; Data: PGstCollectData; waiting: Tgboolean); cdecl; external libgstbase;
function gst_collect_pads_clip_running_time(pads: PGstCollectPads; cdata: PGstCollectData; buf: PGstBuffer; outbuf: PPGstBuffer; user_data: Tgpointer): TGstFlowReturn; cdecl; external libgstbase;
function gst_collect_pads_event_default(pads: PGstCollectPads; Data: PGstCollectData; event: PGstEvent; discard: Tgboolean): Tgboolean; cdecl; external libgstbase;
function gst_collect_pads_src_event_default(pads: PGstCollectPads; pad: PGstPad; event: PGstEvent): Tgboolean; cdecl; external libgstbase;
function gst_collect_pads_query_default(pads: PGstCollectPads; Data: PGstCollectData; query: PGstQuery; discard: Tgboolean): Tgboolean; cdecl; external libgstbase;

function GST_COLLECT_PADS_STATE(Data: Pointer): TGstCollectPadsStateFlags;
function GST_COLLECT_PADS_STATE_IS_SET(Data: Pointer; flag: TGstCollectPadsStateFlags): Tgboolean;
procedure GST_COLLECT_PADS_STATE_SET(var Data: PGstCollectData; flag: TGstCollectPadsStateFlags);
procedure GST_COLLECT_PADS_STATE_UNSET(var Data: PGstCollectData; flag: TGstCollectPadsStateFlags);

function GST_COLLECT_PADS_DTS(Data: Pointer): Tgint64;
function GST_COLLECT_PADS_DTS_IS_VALID(Data: Pointer): Tgboolean;

function GST_COLLECT_PADS_GET_STREAM_LOCK(pads: Pointer): PGRecMutex;
procedure GST_COLLECT_PADS_STREAM_LOCK(pads: Pointer);
procedure GST_COLLECT_PADS_STREAM_UNLOCK(pads: Pointer);

// === Konventiert am: 27-9-24 19:28:08 ===

function GST_TYPE_COLLECT_PADS: TGType;
function GST_COLLECT_PADS(obj: Pointer): PGstCollectPads;
function GST_COLLECT_PADS_CLASS(klass: Pointer): PGstCollectPadsClass;
function GST_IS_COLLECT_PADS(obj: Pointer): Tgboolean;
function GST_IS_COLLECT_PADS_CLASS(klass: Pointer): Tgboolean;
function GST_COLLECT_PADS_GET_CLASS(obj: Pointer): PGstCollectPadsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_COLLECT_PADS: TGType;
begin
  GST_TYPE_COLLECT_PADS := gst_collect_pads_get_type;
end;

function GST_COLLECT_PADS(obj: Pointer): PGstCollectPads;
begin
  Result := PGstCollectPads(g_type_check_instance_cast(obj, GST_TYPE_COLLECT_PADS));
end;

function GST_COLLECT_PADS_CLASS(klass: Pointer): PGstCollectPadsClass;
begin
  Result := PGstCollectPadsClass(g_type_check_class_cast(klass, GST_TYPE_COLLECT_PADS));
end;

function GST_IS_COLLECT_PADS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_COLLECT_PADS);
end;

function GST_IS_COLLECT_PADS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_COLLECT_PADS);
end;

function GST_COLLECT_PADS_GET_CLASS(obj: Pointer): PGstCollectPadsClass;
begin
  Result := PGstCollectPadsClass(PGTypeInstance(obj)^.g_class);
end;


function GST_COLLECT_PADS_STATE(Data: Pointer): TGstCollectPadsStateFlags;
begin
  GST_COLLECT_PADS_STATE := (PGstCollectData(Data))^.state;
end;

function GST_COLLECT_PADS_STATE_IS_SET(Data: Pointer; flag: TGstCollectPadsStateFlags): Tgboolean;
begin
  GST_COLLECT_PADS_STATE_IS_SET := GST_COLLECT_PADS_STATE(Data) and flag <> 0;
end;

procedure GST_COLLECT_PADS_STATE_SET(var Data: PGstCollectData; flag: TGstCollectPadsStateFlags);
begin
  Data^.state := Data^.state or flag;
end;

procedure GST_COLLECT_PADS_STATE_UNSET(var Data: PGstCollectData; flag: TGstCollectPadsStateFlags);
begin
  Data^.state := Data^.state and not flag;
end;

function GST_COLLECT_PADS_DTS(Data: Pointer): Tgint64;
begin
  GST_COLLECT_PADS_DTS := PGstCollectData(Data)^.ABI.abi.dts;
end;

function GST_COLLECT_PADS_DTS_IS_VALID(Data: Pointer): Tgboolean;
begin
  GST_COLLECT_PADS_DTS_IS_VALID := GST_CLOCK_STIME_IS_VALID(GST_COLLECT_PADS_DTS(Data));
end;

function GST_COLLECT_PADS_GET_STREAM_LOCK(pads: Pointer): PGRecMutex;
begin
  GST_COLLECT_PADS_GET_STREAM_LOCK := @((PGstCollectPads(pads))^.stream_lock);
end;

procedure GST_COLLECT_PADS_STREAM_LOCK(pads: Pointer);
begin
  g_rec_mutex_lock(GST_COLLECT_PADS_GET_STREAM_LOCK(pads));
end;

procedure GST_COLLECT_PADS_STREAM_UNLOCK(pads: Pointer);
begin
  g_rec_mutex_unlock(GST_COLLECT_PADS_GET_STREAM_LOCK(pads));
end;


{$ENDIF read_implementation}
