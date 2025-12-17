unit hwcontext_mediacodec;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVMediaCodecDeviceContext = record
    surface: pointer;
    native_window: pointer;
    create_window: longint;
  end;
  PAVMediaCodecDeviceContext = ^TAVMediaCodecDeviceContext;

  // === Konventiert am: 14-12-25 17:15:02 ===


implementation



end.
