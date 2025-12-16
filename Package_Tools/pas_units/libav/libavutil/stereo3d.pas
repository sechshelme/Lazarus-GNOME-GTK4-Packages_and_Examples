unit stereo3d;

interface

uses
  fp_ffmpeg, frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVStereo3DType = longint;

const
  AV_STEREO3D_2D = 0;
  AV_STEREO3D_SIDEBYSIDE = 1;
  AV_STEREO3D_TOPBOTTOM = 2;
  AV_STEREO3D_FRAMESEQUENCE = 3;
  AV_STEREO3D_CHECKERBOARD = 4;
  AV_STEREO3D_SIDEBYSIDE_QUINCUNX = 5;
  AV_STEREO3D_LINES = 6;
  AV_STEREO3D_COLUMNS = 7;

type
  TAVStereo3DView = longint;

const
  AV_STEREO3D_VIEW_PACKED = 0;
  AV_STEREO3D_VIEW_LEFT = 1;
  AV_STEREO3D_VIEW_RIGHT = 2;

const
  AV_STEREO3D_FLAG_INVERT = 1 shl 0;

type
  TAVStereo3D = record
    _type: TAVStereo3DType;
    flags: longint;
    view: TAVStereo3DView;
  end;
  PAVStereo3D = ^TAVStereo3D;

function av_stereo3d_alloc: PAVStereo3D; cdecl; external libavutil;
function av_stereo3d_create_side_data(frame: PAVFrame): PAVStereo3D; cdecl; external libavutil;
function av_stereo3d_type_name(_type: dword): pchar; cdecl; external libavutil;
function av_stereo3d_from_name(name: pchar): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:22 ===


implementation



end.
