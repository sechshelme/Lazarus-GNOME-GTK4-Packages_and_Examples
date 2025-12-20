unit dxva2;

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
  Pdxva_context = type Pointer;

  // === Konventiert am: 19-12-25 17:16:05 ===


implementation



end.
