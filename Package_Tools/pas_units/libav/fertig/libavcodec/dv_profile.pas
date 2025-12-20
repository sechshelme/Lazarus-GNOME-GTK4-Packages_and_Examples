unit dv_profile;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DV_PROFILE_BYTES = 6 * 80;

type
  TAVDVProfile = record
    dsf: longint;
    video_stype: longint;
    frame_size: longint;
    difseg_size: longint;
    n_difchan: longint;
    time_base: TAVRational;
    ltc_divisor: longint;
    height: longint;
    width: longint;
    sar: array[0..1] of TAVRational;
    pix_fmt: TAVPixelFormat;
    bpm: longint;
    block_sizes: Puint8_t;
    audio_stride: longint;
    audio_min_samples: array[0..2] of longint;
    audio_samples_dist: array[0..4] of longint;
    audio_shuffle: Puint8_t;
  end;
  PAVDVProfile = ^TAVDVProfile;

function av_dv_frame_profile(sys: PAVDVProfile; frame: Puint8_t; buf_size: dword): PAVDVProfile; cdecl; external libavcodec;
function av_dv_codec_profile(width: longint; height: longint; pix_fmt: TAVPixelFormat): PAVDVProfile; cdecl; external libavcodec;
function av_dv_codec_profile2(width: longint; height: longint; pix_fmt: TAVPixelFormat; frame_rate: TAVRational): PAVDVProfile; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:02 ===


implementation



end.
