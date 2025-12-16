unit hwcontext_d3d11va;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVD3D11VADeviceContext = type Pointer;
  PAVD3D11FrameDescriptor = type Pointer;
  PAVD3D11VAFramesContext = type Pointer;

  // === Konventiert am: 14-12-25 17:15:10 ===


implementation



end.
