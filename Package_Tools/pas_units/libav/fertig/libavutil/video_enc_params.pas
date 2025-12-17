unit video_enc_params;

interface

uses
  fp_ffmpeg, frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVVideoEncParamsType = longint;

const
  AV_VIDEO_ENC_PARAMS_NONE = -(1);
  AV_VIDEO_ENC_PARAMS_VP9 = (-(1)) + 1;
  AV_VIDEO_ENC_PARAMS_H264 = (-(1)) + 2;
  AV_VIDEO_ENC_PARAMS_MPEG2 = (-(1)) + 3;

type
  TAVVideoEncParams = record
    nb_blocks: dword;
    blocks_offset: Tsize_t;
    block_size: Tsize_t;
    _type: TAVVideoEncParamsType;
    qp: Tint32_t;
    delta_qp: array[0..3] of array[0..1] of Tint32_t;
  end;
  PAVVideoEncParams = ^TAVVideoEncParams;

  TAVVideoBlockParams = record
    src_x: longint;
    src_y: longint;
    w: longint;
    h: longint;
    delta_qp: Tint32_t;
  end;
  PAVVideoBlockParams = ^TAVVideoBlockParams;

function av_video_enc_params_alloc(_type: TAVVideoEncParamsType; nb_blocks: dword; out_size: Psize_t): PAVVideoEncParams; cdecl; external libavutil;
function av_video_enc_params_create_side_data(frame: PAVFrame; _type: TAVVideoEncParamsType; nb_blocks: dword): PAVVideoEncParams; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:00 ===


implementation



end.
