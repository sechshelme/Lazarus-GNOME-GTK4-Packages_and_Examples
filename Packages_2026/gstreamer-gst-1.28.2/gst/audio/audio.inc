

  {$IFDEF read_enum}
const
  GST_META_TAG_AUDIO_STR = 'audio';
  GST_META_TAG_AUDIO_CHANNELS_STR = 'channels';
  GST_META_TAG_AUDIO_RATE_STR = 'rate';
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_audio_buffer_clip(buffer: PGstBuffer; segment: PGstSegment; rate: Tgint; bpf: Tgint): PGstBuffer; cdecl; external libgstaudio;
function gst_audio_buffer_truncate(buffer: PGstBuffer; bpf: Tgint; trim: Tgsize; samples: Tgsize): PGstBuffer; cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:11:04 ===

function GST_FRAMES_TO_CLOCK_TIME(frames, rate: Tguint64): TGstClockTime;
function GST_CLOCK_TIME_TO_FRAMES(clocktime, rate: Tguint64): Tguint64;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_FRAMES_TO_CLOCK_TIME(frames, rate: Tguint64): TGstClockTime;
begin
  GST_FRAMES_TO_CLOCK_TIME := TGstClockTime(gst_util_uint64_scale_round(frames, GST_SECOND, rate));
end;

function GST_CLOCK_TIME_TO_FRAMES(clocktime, rate: Tguint64): Tguint64;
begin
  GST_CLOCK_TIME_TO_FRAMES := gst_util_uint64_scale_round(clocktime, rate, GST_SECOND);
end;

{$ENDIF read_implementation}
