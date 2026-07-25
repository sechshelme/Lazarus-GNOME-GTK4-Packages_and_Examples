{$IFDEF read_interface}


type
  PGstControlPoint = ^TGstControlPoint;
  TGstControlPoint = record
    timestamp: TGstClockTime;
    value: Tgdouble;
    cache: record
      case longint of
        0: (cubic: record
            h: Tgdouble;
            z: Tgdouble;
            end);
        1: (cubic_monotonic: record
            c1s: Tgdouble;
            c2s: Tgdouble;
            c3s: Tgdouble;
            end);
        2: (_gst_reserved: array[0..63] of Tguint8);
      end;
  end;

function gst_control_point_get_type: TGType; cdecl; external libgstcontroller;

type
  PGstTimedValueControlSourcePrivate = type Pointer;

  PGstTimedValueControlSource = ^TGstTimedValueControlSource;
  TGstTimedValueControlSource = record
    parent: TGstControlSource;
    lock: TGMutex;
    values: PGSequence;
    nvalues: Tgint;
    valid_cache: Tgboolean;
    priv: PGstTimedValueControlSourcePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstTimedValueControlSourceClass = ^TGstTimedValueControlSourceClass;
  TGstTimedValueControlSourceClass = record
    parent_class: TGstControlSourceClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_timed_value_control_source_get_type: TGType; cdecl; external libgstcontroller;
function gst_timed_value_control_source_find_control_point_iter(self: PGstTimedValueControlSource; timestamp: TGstClockTime): PGSequenceIter; cdecl; external libgstcontroller;
function gst_timed_value_control_source_set(self: PGstTimedValueControlSource; timestamp: TGstClockTime; value: Tgdouble): Tgboolean; cdecl; external libgstcontroller;
function gst_timed_value_control_source_set_from_list(self: PGstTimedValueControlSource; timedvalues: PGSList): Tgboolean; cdecl; external libgstcontroller;
function gst_timed_value_control_source_unset(self: PGstTimedValueControlSource; timestamp: TGstClockTime): Tgboolean; cdecl; external libgstcontroller;
procedure gst_timed_value_control_source_unset_all(self: PGstTimedValueControlSource); cdecl; external libgstcontroller;
function gst_timed_value_control_source_get_all(self: PGstTimedValueControlSource): PGList; cdecl; external libgstcontroller; deprecated;
function gst_timed_value_control_source_list_control_points(self: PGstTimedValueControlSource; n_control_points: Pgsize): PGstTimedValue; cdecl; external libgstcontroller;
function gst_timed_value_control_source_get_count(self: PGstTimedValueControlSource): Tgint; cdecl; external libgstcontroller;
procedure gst_timed_value_control_invalidate_cache(self: PGstTimedValueControlSource); cdecl; external libgstcontroller;
procedure gst_control_point_free(cp: PGstControlPoint); cdecl; external libgstcontroller;
function gst_control_point_copy(cp: PGstControlPoint): PGstControlPoint; cdecl; external libgstcontroller;

// === Konventiert am: 25-7-26 13:21:49 ===

function GST_TYPE_TIMED_VALUE_CONTROL_SOURCE: TGType;
function GST_TIMED_VALUE_CONTROL_SOURCE(obj: Pointer): PGstTimedValueControlSource;
function GST_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass: Pointer): PGstTimedValueControlSourceClass;
function GST_IS_TIMED_VALUE_CONTROL_SOURCE(obj: Pointer): Tgboolean;
function GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstTimedValueControlSourceClass;

procedure GST_TIMED_VALUE_CONTROL_SOURCE_LOCK(obj: Pointer);
procedure GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK(obj: Pointer);

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TIMED_VALUE_CONTROL_SOURCE: TGType;
begin
  GST_TYPE_TIMED_VALUE_CONTROL_SOURCE := gst_timed_value_control_source_get_type;
end;

function GST_TIMED_VALUE_CONTROL_SOURCE(obj: Pointer): PGstTimedValueControlSource;
begin
  Result := PGstTimedValueControlSource(g_type_check_instance_cast(obj, GST_TYPE_TIMED_VALUE_CONTROL_SOURCE));
end;

function GST_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass: Pointer): PGstTimedValueControlSourceClass;
begin
  Result := PGstTimedValueControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_TIMED_VALUE_CONTROL_SOURCE));
end;

function GST_IS_TIMED_VALUE_CONTROL_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TIMED_VALUE_CONTROL_SOURCE);
end;

function GST_IS_TIMED_VALUE_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TIMED_VALUE_CONTROL_SOURCE);
end;

function GST_TIMED_VALUE_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstTimedValueControlSourceClass;
begin
  Result := PGstTimedValueControlSourceClass(PGTypeInstance(obj)^.g_class);
end;


procedure GST_TIMED_VALUE_CONTROL_SOURCE_LOCK(obj: Pointer);
begin
  g_mutex_lock(@((PGstTimedValueControlSource(obj))^.lock));
end;

procedure GST_TIMED_VALUE_CONTROL_SOURCE_UNLOCK(obj: Pointer);
begin
  g_mutex_unlock(@((PGstTimedValueControlSource(obj))^.lock));
end;

{$ENDIF read_implementation}
