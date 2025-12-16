unit hdr_dynamic_vivid_metadata;

interface

uses
  fp_ffmpeg, rational, frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVHDRVivid3SplineParams = record
    th_mode: longint;
    th_enable_mb: TAVRational;
    th_enable: TAVRational;
    th_delta1: TAVRational;
    th_delta2: TAVRational;
    enable_strength: TAVRational;
  end;
  PAVHDRVivid3SplineParams = ^TAVHDRVivid3SplineParams;

  PAVHDRVividColorToneMappingParams = type Pointer;
  PAVHDRVividColorTransformParams = type Pointer;
  PAVDynamicHDRVivid = type Pointer;

function av_dynamic_hdr_vivid_alloc(size: Psize_t): PAVDynamicHDRVivid; cdecl; external libavutil;
function av_dynamic_hdr_vivid_create_side_data(frame: PAVFrame): PAVDynamicHDRVivid; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:23 ===


implementation



end.
