/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstDataQueueItem = record
    obj: PGstMiniObject;
    size: Tguint;
    duration: Tguint64;
    Visible: Tgboolean;
    Destroy: TGDestroyNotify;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDataQueueItem = ^TGstDataQueueItem;
  PPGstDataQueueItem = ^PGstDataQueueItem;

  TGstDataQueueSize = record
    Visible: Tguint;
    bytes: Tguint;
    time: Tguint64;
  end;
  PGstDataQueueSize = ^TGstDataQueueSize;

  TGstDataQueuePrivate = record
  end;
  PGstDataQueuePrivate = ^TGstDataQueuePrivate;

  TGstDataQueue = record
    obj: TGObject;
    priv: PGstDataQueuePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDataQueue = ^TGstDataQueue;

  TGstDataQueueCheckFullFunction = function(queue: PGstDataQueue; Visible: Tguint; bytes: Tguint; time: Tguint64; checkdata: Tgpointer): Tgboolean; cdecl;
  TGstDataQueueFullCallback = procedure(queue: PGstDataQueue; checkdata: Tgpointer); cdecl;
  TGstDataQueueEmptyCallback = procedure(queue: PGstDataQueue; checkdata: Tgpointer); cdecl;

  TGstDataQueueClass = record
    parent_class: TGObjectClass;
    empty: procedure(queue: PGstDataQueue); cdecl;
    full: procedure(queue: PGstDataQueue); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDataQueueClass = ^TGstDataQueueClass;

function gst_data_queue_get_type: TGType; cdecl; external libgstbase;
function gst_data_queue_new(checkfull: TGstDataQueueCheckFullFunction; fullcallback: TGstDataQueueFullCallback; emptycallback: TGstDataQueueEmptyCallback; checkdata: Tgpointer): PGstDataQueue; cdecl; external libgstbase;
function gst_data_queue_push(queue: PGstDataQueue; item: PGstDataQueueItem): Tgboolean; cdecl; external libgstbase;
function gst_data_queue_push_force(queue: PGstDataQueue; item: PGstDataQueueItem): Tgboolean; cdecl; external libgstbase;
function gst_data_queue_pop(queue: PGstDataQueue; item: PPGstDataQueueItem): Tgboolean; cdecl; external libgstbase;
function gst_data_queue_peek(queue: PGstDataQueue; item: PPGstDataQueueItem): Tgboolean; cdecl; external libgstbase;
procedure gst_data_queue_flush(queue: PGstDataQueue); cdecl; external libgstbase;
procedure gst_data_queue_set_flushing(queue: PGstDataQueue; flushing: Tgboolean); cdecl; external libgstbase;
function gst_data_queue_drop_head(queue: PGstDataQueue; _type: TGType): Tgboolean; cdecl; external libgstbase;
function gst_data_queue_is_full(queue: PGstDataQueue): Tgboolean; cdecl; external libgstbase;
function gst_data_queue_is_empty(queue: PGstDataQueue): Tgboolean; cdecl; external libgstbase;
procedure gst_data_queue_get_level(queue: PGstDataQueue; level: PGstDataQueueSize); cdecl; external libgstbase;
procedure gst_data_queue_limits_changed(queue: PGstDataQueue); cdecl; external libgstbase;

// === Konventiert am: 28-9-24 14:45:59 ===

function GST_TYPE_DATA_QUEUE: TGType;
function GST_DATA_QUEUE(obj: Pointer): PGstDataQueue;
function GST_DATA_QUEUE_CLASS(klass: Pointer): PGstDataQueueClass;
function GST_IS_DATA_QUEUE(obj: Pointer): Tgboolean;
function GST_IS_DATA_QUEUE_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DATA_QUEUE: TGType;
begin
  GST_TYPE_DATA_QUEUE := gst_data_queue_get_type;
end;

function GST_DATA_QUEUE(obj: Pointer): PGstDataQueue;
begin
  Result := PGstDataQueue(g_type_check_instance_cast(obj, GST_TYPE_DATA_QUEUE));
end;

function GST_DATA_QUEUE_CLASS(klass: Pointer): PGstDataQueueClass;
begin
  Result := PGstDataQueueClass(g_type_check_class_cast(klass, GST_TYPE_DATA_QUEUE));
end;

function GST_IS_DATA_QUEUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DATA_QUEUE);
end;

function GST_IS_DATA_QUEUE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DATA_QUEUE);
end;


{$ENDIF read_implementation}
