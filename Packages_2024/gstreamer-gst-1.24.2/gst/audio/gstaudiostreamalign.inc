
{$IFDEF read_interface}

type
  TGstAudioStreamAlign = record
  end;
  PGstAudioStreamAlign = ^TGstAudioStreamAlign;

function gst_audio_stream_align_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_stream_align_new(rate: Tgint; alignment_threshold: TGstClockTime; discont_wait: TGstClockTime): PGstAudioStreamAlign; cdecl; external libgstaudio;
function gst_audio_stream_align_copy(align: PGstAudioStreamAlign): PGstAudioStreamAlign; cdecl; external libgstaudio;
procedure gst_audio_stream_align_free(align: PGstAudioStreamAlign); cdecl; external libgstaudio;
procedure gst_audio_stream_align_set_rate(align: PGstAudioStreamAlign; rate: Tgint); cdecl; external libgstaudio;
function gst_audio_stream_align_get_rate(align: PGstAudioStreamAlign): Tgint; cdecl; external libgstaudio;
procedure gst_audio_stream_align_set_alignment_threshold(align: PGstAudioStreamAlign; alignment_threshold: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_stream_align_get_alignment_threshold(align: PGstAudioStreamAlign): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_stream_align_set_discont_wait(align: PGstAudioStreamAlign; discont_wait: TGstClockTime); cdecl; external libgstaudio;
function gst_audio_stream_align_get_discont_wait(align: PGstAudioStreamAlign): TGstClockTime; cdecl; external libgstaudio;
procedure gst_audio_stream_align_mark_discont(align: PGstAudioStreamAlign); cdecl; external libgstaudio;
function gst_audio_stream_align_get_timestamp_at_discont(align: PGstAudioStreamAlign): TGstClockTime; cdecl; external libgstaudio;
function gst_audio_stream_align_get_samples_since_discont(align: PGstAudioStreamAlign): Tguint64; cdecl; external libgstaudio;
function gst_audio_stream_align_process(align: PGstAudioStreamAlign; discont: Tgboolean; timestamp: TGstClockTime; n_samples: Tguint; out_timestamp: PGstClockTime;
  out_duration: PGstClockTime; out_sample_position: Pguint64): Tgboolean; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 19:16:40 ===

function GST_TYPE_AUDIO_INFO_STREAM_ALIGN: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_INFO_STREAM_ALIGN: TGType;
begin
  GST_TYPE_AUDIO_INFO_STREAM_ALIGN := gst_audio_stream_align_get_type;
end;



{$ENDIF read_implementation}
