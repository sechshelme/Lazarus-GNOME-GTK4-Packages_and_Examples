unit audio_fifo;

interface

uses
  fp_ffmpeg, samplefmt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVAudioFifo = type Pointer;

procedure av_audio_fifo_free(af: PAVAudioFifo); cdecl; external libavutil;
function av_audio_fifo_alloc(sample_fmt: TAVSampleFormat; channels: longint; nb_samples: longint): PAVAudioFifo; cdecl; external libavutil;
function av_audio_fifo_realloc(af: PAVAudioFifo; nb_samples: longint): longint; cdecl; external libavutil;
function av_audio_fifo_write(af: PAVAudioFifo; data: Ppointer; nb_samples: longint): longint; cdecl; external libavutil;
function av_audio_fifo_peek(af: PAVAudioFifo; data: Ppointer; nb_samples: longint): longint; cdecl; external libavutil;
function av_audio_fifo_peek_at(af: PAVAudioFifo; data: Ppointer; nb_samples: longint; offset: longint): longint; cdecl; external libavutil;
function av_audio_fifo_read(af: PAVAudioFifo; data: Ppointer; nb_samples: longint): longint; cdecl; external libavutil;
function av_audio_fifo_drain(af: PAVAudioFifo; nb_samples: longint): longint; cdecl; external libavutil;
procedure av_audio_fifo_reset(af: PAVAudioFifo); cdecl; external libavutil;
function av_audio_fifo_size(af: PAVAudioFifo): longint; cdecl; external libavutil;
function av_audio_fifo_space(af: PAVAudioFifo): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:38 ===


implementation



end.
