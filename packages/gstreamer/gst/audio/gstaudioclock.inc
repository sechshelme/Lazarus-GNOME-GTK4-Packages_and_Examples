
{$IFDEF read_interface}



type
  TGstAudioClockGetTimeFunc = function(clock: PGstClock; user_data: Tgpointer): TGstClockTime; cdecl;

  TGstAudioClock = record
    clock: TGstSystemClock;
    func: TGstAudioClockGetTimeFunc;
    user_data: Tgpointer;
    destroy_notify: TGDestroyNotify;
    last_time: TGstClockTime;
    time_offset: TGstClockTimeDiff;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioClock = ^TGstAudioClock;

  TGstAudioClockClass = record
    parent_class: TGstSystemClockClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioClockClass = ^TGstAudioClockClass;

function gst_audio_clock_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_clock_new(Name: Pgchar; func: TGstAudioClockGetTimeFunc; user_data: Tgpointer; destroy_notify: TGDestroyNotify): PGstClock; cdecl; external libgstaudio;
procedure gst_audio_clock_reset(clock: PGstAudioClock; time: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_clock_get_time(clock: PGstAudioClock): TGstClockTime; cdecl; external libgstaudio;
function gst_audio_clock_adjust(clock: PGstAudioClock; time: TGstClockTime): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_clock_invalidate(clock: PGstAudioClock); cdecl; external libgstaudio;

function GST_AUDIO_CLOCK_CAST(obj: Pointer): PGstAudioClock;

// === Konventiert am: 28-9-24 20:07:22 ===

function GST_TYPE_AUDIO_CLOCK: TGType;
function GST_AUDIO_CLOCK(obj: Pointer): PGstAudioClock;
function GST_AUDIO_CLOCK_CLASS(klass: Pointer): PGstAudioClockClass;
function GST_IS_AUDIO_CLOCK(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_CLOCK_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_CLOCK: TGType;
begin
  GST_TYPE_AUDIO_CLOCK := gst_audio_clock_get_type;
end;

function GST_AUDIO_CLOCK(obj: Pointer): PGstAudioClock;
begin
  Result := PGstAudioClock(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_CLOCK));
end;

function GST_AUDIO_CLOCK_CLASS(klass: Pointer): PGstAudioClockClass;
begin
  Result := PGstAudioClockClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_CLOCK));
end;

function GST_IS_AUDIO_CLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_CLOCK);
end;

function GST_IS_AUDIO_CLOCK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_CLOCK);
end;

// ====

function GST_AUDIO_CLOCK_CAST(obj: Pointer): PGstAudioClock;
begin
  GST_AUDIO_CLOCK_CAST := PGstAudioClock(obj);
end;


{$ENDIF read_implementation}
