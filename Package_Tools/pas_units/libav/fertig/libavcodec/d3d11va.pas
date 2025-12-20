unit d3d11va;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  _WIN32_WINNT = $0602;

const
  FF_DXVA2_WORKAROUND_SCALING_LIST_ZIGZAG = 1;
  FF_DXVA2_WORKAROUND_INTEL_CLEARVIDEO = 2;

type
  PAVD3D11VAContext = type Pointer;

function av_d3d11va_alloc_context: PAVD3D11VAContext; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:10:18 ===


implementation



end.
