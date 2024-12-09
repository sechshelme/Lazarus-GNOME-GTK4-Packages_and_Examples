
{$IFDEF read_interface}

type
  PGstClockTimeDiff = ^TGstClockTimeDiff;
  TGstClockTimeDiff = Tgint64;

  PGstClockID = ^TGstClockID;
  TGstClockID = Tgpointer;

const
  GST_TIME_FORMAT = 'u:%02u:%02u.%09u';

type
  PGstClockReturn = ^TGstClockReturn;
  TGstClockReturn = longint;

const
  GST_CLOCK_OK = 0;
  GST_CLOCK_EARLY = 1;
  GST_CLOCK_UNSCHEDULED = 2;
  GST_CLOCK_BUSY = 3;
  GST_CLOCK_BADTIME = 4;
  GST_CLOCK_ERROR = 5;
  GST_CLOCK_UNSUPPORTED = 6;
  GST_CLOCK_DONE = 7;

type
  PGstClockEntryType = ^TGstClockEntryType;
  TGstClockEntryType = longint;

const
  GST_CLOCK_ENTRY_SINGLE = 0;
  GST_CLOCK_ENTRY_PERIODIC = 1;

type
  TGstClockPrivate = record
  end;
  PGstClockPrivate = ^TGstClockPrivate;

  TGstClock = record
    obj: TGstObject;
    priv: PGstClockPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstClock = ^TGstClock;
  PPGstClock = ^PGstClock;

  TGstClockCallback = function(clock: PGstClock; time: TGstClockTime; id: TGstClockID; user_data: Tgpointer): Tgboolean; cdecl;

  TGstClockEntry = record
    refcount: Tgint;
    clock: PGstClock;
    _clock: Tgpointer;
    _type: TGstClockEntryType;
    time: TGstClockTime;
    interval: TGstClockTime;
    status: TGstClockReturn;
    func: TGstClockCallback;
    user_data: Tgpointer;
    destroy_data: TGDestroyNotify;
    unscheduled: Tgboolean;
    woken_up: Tgboolean;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstClockEntry = ^TGstClockEntry;

type
  PGstClockFlags = ^TGstClockFlags;
  TGstClockFlags = longint;

const
  GST_CLOCK_FLAG_CAN_DO_SINGLE_SYNC = GST_OBJECT_FLAG_LAST shl 0;
  GST_CLOCK_FLAG_CAN_DO_SINGLE_ASYNC = GST_OBJECT_FLAG_LAST shl 1;
  GST_CLOCK_FLAG_CAN_DO_PERIODIC_SYNC = GST_OBJECT_FLAG_LAST shl 2;
  GST_CLOCK_FLAG_CAN_DO_PERIODIC_ASYNC = GST_OBJECT_FLAG_LAST shl 3;
  GST_CLOCK_FLAG_CAN_SET_RESOLUTION = GST_OBJECT_FLAG_LAST shl 4;
  GST_CLOCK_FLAG_CAN_SET_MASTER = GST_OBJECT_FLAG_LAST shl 5;
  GST_CLOCK_FLAG_NEEDS_STARTUP_SYNC = GST_OBJECT_FLAG_LAST shl 6;
  GST_CLOCK_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 8;

type
  TGstClockClass = record
    parent_class: TGstObjectClass;
    change_resolution: function(clock: PGstClock; old_resolution: TGstClockTime; new_resolution: TGstClockTime): TGstClockTime; cdecl;
    get_resolution: function(clock: PGstClock): TGstClockTime; cdecl;
    get_internal_time: function(clock: PGstClock): TGstClockTime; cdecl;
    wait: function(clock: PGstClock; entry: PGstClockEntry; jitter: PGstClockTimeDiff): TGstClockReturn; cdecl;
    wait_async: function(clock: PGstClock; entry: PGstClockEntry): TGstClockReturn; cdecl;
    unschedule: procedure(clock: PGstClock; entry: PGstClockEntry); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstClockClass = ^TGstClockClass;


function gst_clock_get_type: TGType; cdecl; external libgstreamer;
function gst_clock_set_resolution(clock: PGstClock; resolution: TGstClockTime): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_get_resolution(clock: PGstClock): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_get_time(clock: PGstClock): TGstClockTime; cdecl; external libgstreamer;
procedure gst_clock_set_calibration(clock: PGstClock; internal: TGstClockTime; external: TGstClockTime; rate_num: TGstClockTime; rate_denom: TGstClockTime); cdecl; external libgstreamer;
procedure gst_clock_get_calibration(clock: PGstClock; internal: PGstClockTime; external: PGstClockTime; rate_num: PGstClockTime; rate_denom: PGstClockTime); cdecl; external libgstreamer;
function gst_clock_set_master(clock: PGstClock; master: PGstClock): Tgboolean; cdecl; external libgstreamer;
function gst_clock_get_master(clock: PGstClock): PGstClock; cdecl; external libgstreamer;
procedure gst_clock_set_timeout(clock: PGstClock; timeout: TGstClockTime); cdecl; external libgstreamer;
function gst_clock_get_timeout(clock: PGstClock): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_add_observation(clock: PGstClock; slave: TGstClockTime; master: TGstClockTime; r_squared: Pgdouble): Tgboolean; cdecl; external libgstreamer;
function gst_clock_add_observation_unapplied(clock: PGstClock; slave: TGstClockTime; master: TGstClockTime; r_squared: Pgdouble; internal: PGstClockTime;
  external: PGstClockTime; rate_num: PGstClockTime; rate_denom: PGstClockTime): Tgboolean; cdecl; external libgstreamer;
function gst_clock_get_internal_time(clock: PGstClock): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_adjust_unlocked(clock: PGstClock; internal: TGstClockTime): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_adjust_with_calibration(clock: PGstClock; internal_target: TGstClockTime; cinternal: TGstClockTime; cexternal: TGstClockTime; cnum: TGstClockTime;
  cdenom: TGstClockTime): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_unadjust_with_calibration(clock: PGstClock; external_target: TGstClockTime; cinternal: TGstClockTime; cexternal: TGstClockTime; cnum: TGstClockTime;
  cdenom: TGstClockTime): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_unadjust_unlocked(clock: PGstClock; external: TGstClockTime): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_wait_for_sync(clock: PGstClock; timeout: TGstClockTime): Tgboolean; cdecl; external libgstreamer;
function gst_clock_is_synced(clock: PGstClock): Tgboolean; cdecl; external libgstreamer;
procedure gst_clock_set_synced(clock: PGstClock; synced: Tgboolean); cdecl; external libgstreamer;
function gst_clock_new_single_shot_id(clock: PGstClock; time: TGstClockTime): TGstClockID; cdecl; external libgstreamer;
function gst_clock_new_periodic_id(clock: PGstClock; start_time: TGstClockTime; interval: TGstClockTime): TGstClockID; cdecl; external libgstreamer;
function gst_clock_id_ref(id: TGstClockID): TGstClockID; cdecl; external libgstreamer;
procedure gst_clock_id_unref(id: TGstClockID); cdecl; external libgstreamer;
function gst_clock_id_compare_func(id1: Tgconstpointer; id2: Tgconstpointer): Tgint; cdecl; external libgstreamer;
function gst_clock_id_get_clock(id: TGstClockID): PGstClock; cdecl; external libgstreamer;
function gst_clock_id_uses_clock(id: TGstClockID; clock: PGstClock): Tgboolean; cdecl; external libgstreamer;
function gst_clock_id_get_time(id: TGstClockID): TGstClockTime; cdecl; external libgstreamer;
function gst_clock_id_wait(id: TGstClockID; jitter: PGstClockTimeDiff): TGstClockReturn; cdecl; external libgstreamer;
function gst_clock_id_wait_async(id: TGstClockID; func: TGstClockCallback; user_data: Tgpointer; destroy_data: TGDestroyNotify): TGstClockReturn; cdecl; external libgstreamer;
procedure gst_clock_id_unschedule(id: TGstClockID); cdecl; external libgstreamer;
function gst_clock_single_shot_id_reinit(clock: PGstClock; id: TGstClockID; time: TGstClockTime): Tgboolean; cdecl; external libgstreamer;
function gst_clock_periodic_id_reinit(clock: PGstClock; id: TGstClockID; start_time: TGstClockTime; interval: TGstClockTime): Tgboolean; cdecl; external libgstreamer;

const
  GST_CLOCK_TIME_NONE = TGstClockTime(-(1));

// function GST_CLOCK_TIME_NONE: TGstClockTime;
function GST_CLOCK_TIME_IS_VALID(time: Tguint64): Tgboolean;
function GST_CLOCK_STIME_NONE: TGstClockTimeDiff;
function GST_CLOCK_STIME_IS_VALID(time: Tguint64): Tgboolean;
function GST_SECOND: TGstClockTimeDiff;
function GST_MSECOND: TGstClockTimeDiff;
function GST_USECOND: TGstClockTimeDiff;
function GST_NSECOND: TGstClockTimeDiff;
function GST_TIME_AS_SECONDS(time: Tguint64): Tguint64;
function GST_TIME_AS_MSECONDS(time: Tguint64): Tguint64;
function GST_TIME_AS_USECONDS(time: Tguint64): Tguint64;
function GST_TIME_AS_NSECONDS(time: Tguint64): Tguint64;
function GST_CLOCK_DIFF(s, e: Tgint64): TGstClockTimeDiff;
function GST_TIMEVAL_TO_TIME(tv: TGTimeVal): TGstClockTime;
procedure GST_TIME_TO_TIMEVAL(t: TGstClockTime; var tv: TGTimeVal);
function GST_TIMESPEC_TO_TIME(ts: Ttimespec): TGstClockTime;
procedure GST_TIME_TO_TIMESPEC(t: TGstClockTime; var ts: Ttimespec);

function GST_CLOCK_FLAGS(obj: Pointer): Tguint32;
function GST_CLOCK_CAST(obj: Pointer): PGstClock;

const 
  GST_TYPE_CLOCK_TIME = G_TYPE_UINT64;

function GST_CLOCK_ENTRY(entry: PGstClockEntry): PGstClockEntry;
function GST_CLOCK_ENTRY_CLOCK(entry: PGstClockEntry): PGstClock;
function GST_CLOCK_ENTRY_TYPE(entry: PGstClockEntry): TGstClockEntryType;
function GST_CLOCK_ENTRY_TIME(entry: PGstClockEntry): TGstClockTime;
function GST_CLOCK_ENTRY_INTERVAL(entry: PGstClockEntry): TGstClockTime;
function GST_CLOCK_ENTRY_STATUS(entry: PGstClockEntry): TGstClockReturn;


// === Konventiert am: 11-9-24 13:24:01 ===

function GST_TYPE_CLOCK: TGType;
function GST_CLOCK(obj: Pointer): PGstClock;
function GST_CLOCK_CLASS(klass: Pointer): PGstClockClass;
function GST_IS_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_CLOCK_CLASS(klass: Pointer): Tgboolean;
function GST_CLOCK_GET_CLASS(obj: Pointer): PGstClockClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CLOCK: TGType;
begin
  GST_TYPE_CLOCK := gst_clock_get_type;
end;

function GST_CLOCK(obj: Pointer): PGstClock;
begin
  Result := PGstClock(g_type_check_instance_cast(obj, GST_TYPE_CLOCK));
end;

function GST_CLOCK_CLASS(klass: Pointer): PGstClockClass;
begin
  Result := PGstClockClass(g_type_check_class_cast(klass, GST_TYPE_CLOCK));
end;

function GST_IS_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CLOCK);
end;

function GST_IS_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CLOCK);
end;

function GST_CLOCK_GET_CLASS(obj: Pointer): PGstClockClass;
begin
  Result := PGstClockClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_CLOCK_CAST(obj: Pointer): PGstClock;
begin
  GST_CLOCK_CAST := PGstClock(obj);
end;

//function GST_CLOCK_TIME_NONE: TGstClockTime;
//begin
//  GST_CLOCK_TIME_NONE := TGstClockTime(-(1));
//end;
//
function GST_CLOCK_TIME_IS_VALID(time: Tguint64): Tgboolean;
begin
  GST_CLOCK_TIME_IS_VALID := (TGstClockTime(time)) <> GST_CLOCK_TIME_NONE;
end;

function GST_CLOCK_STIME_NONE: TGstClockTimeDiff;
begin
  GST_CLOCK_STIME_NONE := TGstClockTimeDiff(G_MININT64);
end;

function GST_CLOCK_STIME_IS_VALID(time: Tguint64): Tgboolean;
begin
  GST_CLOCK_STIME_IS_VALID := (TGstClockTimeDiff(time)) <> GST_CLOCK_STIME_NONE;
end;

function GST_SECOND: TGstClockTimeDiff;
begin
  GST_SECOND := TGstClockTimeDiff(G_USEC_PER_SEC * 1000);
end;

function GST_MSECOND: TGstClockTimeDiff;
begin
  GST_MSECOND := TGstClockTimeDiff(GST_SECOND div 1000);
end;

function GST_USECOND: TGstClockTimeDiff;
begin
  GST_USECOND := TGstClockTimeDiff(GST_SECOND div 1000000);
end;

function GST_NSECOND: TGstClockTimeDiff;
begin
  GST_NSECOND := TGstClockTimeDiff(GST_SECOND div 1000000000);
end;

function GST_TIME_AS_SECONDS(time: Tguint64): Tguint64;
begin
  GST_TIME_AS_SECONDS := time div GST_SECOND;
end;

function GST_TIME_AS_MSECONDS(time: Tguint64): Tguint64;
begin
  GST_TIME_AS_MSECONDS := time div 1000000;
end;

function GST_TIME_AS_USECONDS(time: Tguint64): Tguint64;
begin
  GST_TIME_AS_USECONDS := time div 1000;
end;

function GST_TIME_AS_NSECONDS(time: Tguint64): Tguint64;
begin
  GST_TIME_AS_NSECONDS := time;
end;

function GST_CLOCK_DIFF(s, e: Tgint64): TGstClockTimeDiff;
begin
  GST_CLOCK_DIFF := TGstClockTimeDiff(e - s);
end;

function GST_TIMEVAL_TO_TIME(tv: TGTimeVal): TGstClockTime;
begin
  GST_TIMEVAL_TO_TIME := TGstClockTime(((tv.tv_sec) * GST_SECOND) + ((tv.tv_usec) * GST_USECOND));
end;

procedure GST_TIME_TO_TIMEVAL(t: TGstClockTime; var tv: TGTimeVal);
begin
  tv.tv_sec := t div GST_SECOND;
  tv.tv_usec := (tv.tv_sec * GST_SECOND) div GST_USECOND;
end;

function GST_TIMESPEC_TO_TIME(ts: Ttimespec): TGstClockTime;
begin
  GST_TIMESPEC_TO_TIME := TGstClockTime(((ts.tv_sec) * GST_SECOND) + ((ts.tv_nsec) * GST_NSECOND));
end;

procedure GST_TIME_TO_TIMESPEC(t: TGstClockTime; var ts: Ttimespec);
begin
  ts.tv_sec := t div GST_SECOND;
  ts.tv_nsec := (t - ts.tv_nsec * GST_SECOND) div GST_NSECOND;
end;

function GST_CLOCK_ENTRY(entry: PGstClockEntry): PGstClockEntry;
begin
  GST_CLOCK_ENTRY := PGstClockEntry(entry);
end;

function GST_CLOCK_ENTRY_CLOCK(entry: PGstClockEntry): PGstClock;
begin
  GST_CLOCK_ENTRY_CLOCK := entry^.clock;
end;

function GST_CLOCK_ENTRY_TYPE(entry: PGstClockEntry): TGstClockEntryType;
begin
  GST_CLOCK_ENTRY_TYPE := entry^._type;
end;

function GST_CLOCK_ENTRY_TIME(entry: PGstClockEntry): TGstClockTime;
begin
  GST_CLOCK_ENTRY_TIME := entry^.time;
end;

function GST_CLOCK_ENTRY_INTERVAL(entry: PGstClockEntry): TGstClockTime;
begin
  GST_CLOCK_ENTRY_INTERVAL := entry^.interval;
end;

function GST_CLOCK_ENTRY_STATUS(entry: PGstClockEntry): TGstClockReturn;
begin
  GST_CLOCK_ENTRY_STATUS := entry^.status;
end;

function GST_CLOCK_FLAGS(obj: Pointer): Tguint32;
begin
  GST_CLOCK_FLAGS := GST_OBJECT_FLAGS(obj);
end;


{$ENDIF read_implementation}
