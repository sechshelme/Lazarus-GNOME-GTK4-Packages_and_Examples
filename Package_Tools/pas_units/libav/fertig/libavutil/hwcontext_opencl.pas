unit hwcontext_opencl;

interface

uses
  fp_ffmpeg, frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVOpenCLFrameDescriptor = type Pointer;
  PAVOpenCLDeviceContext = type Pointer;
  PAVOpenCLFramesContext = type Pointer;

  // === Konventiert am: 14-12-25 17:14:59 ===


implementation



end.
