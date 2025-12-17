unit hwcontext_cuda;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVCUDADeviceContext = type Pointer;

const
  AV_CUDA_USE_PRIMARY_CONTEXT = 1 shl 0;
  AV_CUDA_USE_CURRENT_CONTEXT = 1 shl 1;

  // === Konventiert am: 14-12-25 17:15:13 ===


implementation



end.
