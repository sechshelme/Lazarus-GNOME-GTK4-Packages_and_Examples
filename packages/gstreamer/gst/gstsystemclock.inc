
{$IFDEF read_interface}

type
  PGstClockType = ^TGstClockType;
  TGstClockType = longint;

const
  GST_CLOCK_TYPE_REALTIME = 0;
  GST_CLOCK_TYPE_MONOTONIC = 1;
  GST_CLOCK_TYPE_OTHER = 2;
  GST_CLOCK_TYPE_TAI = 3;

type
  TGstSystemClockPrivate = record
  end;
  PGstSystemClockPrivate = ^TGstSystemClockPrivate;

  TGstSystemClock = record
    clock: TGstClock;
    priv: PGstSystemClockPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstSystemClock = ^TGstSystemClock;

  TGstSystemClockClass = record
    parent_class: TGstClockClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstSystemClockClass = ^TGstSystemClockClass;

function gst_system_clock_get_type: TGType; cdecl; external libgstreamer;
function gst_system_clock_obtain: PGstClock; cdecl; external libgstreamer;
procedure gst_system_clock_set_default(new_clock: PGstClock); cdecl; external libgstreamer;

function GST_SYSTEM_CLOCK_CAST(obj: Pointer): PGstSystemClock;

// === Konventiert am: 18-9-24 13:45:58 ===

function GST_TYPE_SYSTEM_CLOCK: TGType;
function GST_SYSTEM_CLOCK(obj: Pointer): PGstSystemClock;
function GST_SYSTEM_CLOCK_CLASS(klass: Pointer): PGstSystemClockClass;
function GST_IS_SYSTEM_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_SYSTEM_CLOCK_CLASS(klass: Pointer): Tgboolean;
function GST_SYSTEM_CLOCK_GET_CLASS(obj: Pointer): PGstSystemClockClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_SYSTEM_CLOCK: TGType;
begin
  GST_TYPE_SYSTEM_CLOCK := gst_system_clock_get_type;
end;

function GST_SYSTEM_CLOCK(obj: Pointer): PGstSystemClock;
begin
  Result := PGstSystemClock(g_type_check_instance_cast(obj, GST_TYPE_SYSTEM_CLOCK));
end;

function GST_SYSTEM_CLOCK_CLASS(klass: Pointer): PGstSystemClockClass;
begin
  Result := PGstSystemClockClass(g_type_check_class_cast(klass, GST_TYPE_SYSTEM_CLOCK));
end;

function GST_IS_SYSTEM_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SYSTEM_CLOCK);
end;

function GST_IS_SYSTEM_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_SYSTEM_CLOCK);
end;

function GST_SYSTEM_CLOCK_GET_CLASS(obj: Pointer): PGstSystemClockClass;
begin
  Result := PGstSystemClockClass(PGTypeInstance(obj)^.g_class);
end;


function GST_SYSTEM_CLOCK_CAST(obj: Pointer): PGstSystemClock;
begin
  GST_SYSTEM_CLOCK_CAST := PGstSystemClock(obj);
end;


{$ENDIF read_implementation}
