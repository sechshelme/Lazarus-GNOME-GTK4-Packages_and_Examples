unit hwcontext_vaapi;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  Const
    AV_VAAPI_DRIVER_QUIRK_USER_SET = 1 shl 0;
    AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS = 1 shl 1;
    AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE = 1 shl 2;
    AV_VAAPI_DRIVER_QUIRK_SURFACE_ATTRIBUTES = 1 shl 3;

type
  PAVVAAPIDeviceContext = type Pointer;
  PAVVAAPIFramesContext = type Pointer;
  PAVVAAPIHWConfig = type Pointer;

// === Konventiert am: 14-12-25 17:14:54 ===


implementation



end.
