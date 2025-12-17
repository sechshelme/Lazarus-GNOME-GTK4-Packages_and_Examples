unit hwcontext_drm;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AV_DRM_MAX_PLANES = 4;

type
  TAVDRMObjectDescriptor = record
    fd: longint;
    size: Tsize_t;
    format_modifier: Tuint64_t;
  end;
  PAVDRMObjectDescriptor = ^TAVDRMObjectDescriptor;

  TAVDRMPlaneDescriptor = record
    object_index: longint;
    offset: Tptrdiff_t;
    pitch: Tptrdiff_t;
  end;
  PAVDRMPlaneDescriptor = ^TAVDRMPlaneDescriptor;

  TAVDRMLayerDescriptor = record
    format: Tuint32_t;
    nb_planes: longint;
    planes: array[0..(AV_DRM_MAX_PLANES) - 1] of TAVDRMPlaneDescriptor;
  end;
  PAVDRMLayerDescriptor = ^TAVDRMLayerDescriptor;

  TAVDRMFrameDescriptor = record
    nb_objects: longint;
    objects: array[0..(AV_DRM_MAX_PLANES) - 1] of TAVDRMObjectDescriptor;
    nb_layers: longint;
    layers: array[0..(AV_DRM_MAX_PLANES) - 1] of TAVDRMLayerDescriptor;
  end;
  PAVDRMFrameDescriptor = ^TAVDRMFrameDescriptor;

  TAVDRMDeviceContext = record
    fd: longint;
  end;
  PAVDRMDeviceContext = ^TAVDRMDeviceContext;

  // === Konventiert am: 14-12-25 17:15:08 ===


implementation



end.
