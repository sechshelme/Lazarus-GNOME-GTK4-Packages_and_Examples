/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_META_TAG_AUDIO_STR = 'audio';
  GST_META_TAG_AUDIO_CHANNELS_STR = 'channels';
  GST_META_TAG_AUDIO_RATE_STR = 'rate';

function gst_audio_buffer_clip(buffer: PGstBuffer; segment: PGstSegment; rate: Tgint; bpf: Tgint): PGstBuffer; cdecl; external libgstaudio;
function gst_audio_buffer_truncate(buffer: PGstBuffer; bpf: Tgint; trim: Tgsize; samples: Tgsize): PGstBuffer; cdecl; external libgstaudio;

function GST_FRAMES_TO_CLOCK_TIME(frames, rate: Tguint64): TGstClockTime;
function GST_CLOCK_TIME_TO_FRAMES(clocktime, rate: Tguint64): Tguint64;


// === Konventiert am: 28-9-24 19:49:02 ===


{$ENDIF read_interface}


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
