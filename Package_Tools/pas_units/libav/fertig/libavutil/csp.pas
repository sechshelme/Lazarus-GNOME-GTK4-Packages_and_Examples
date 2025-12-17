unit csp;

interface

uses
  fp_ffmpeg, rational, pixfmt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVLumaCoefficients = record
    cr: TAVRational;
    cg: TAVRational;
    cb: TAVRational;
  end;
  PAVLumaCoefficients = ^TAVLumaCoefficients;

  TAVCIExy = record
    x: TAVRational;
    y: TAVRational;
  end;
  PAVCIExy = ^TAVCIExy;

  TAVPrimaryCoefficients = record
    r: TAVCIExy;
    g: TAVCIExy;
    b: TAVCIExy;
  end;
  PAVPrimaryCoefficients = ^TAVPrimaryCoefficients;

  TAVWhitepointCoefficients = TAVCIExy;
  PAVWhitepointCoefficients = ^TAVWhitepointCoefficients;

  TAVColorPrimariesDesc = record
    wp: TAVWhitepointCoefficients;
    prim: TAVPrimaryCoefficients;
  end;
  PAVColorPrimariesDesc = ^TAVColorPrimariesDesc;

  Tav_csp_trc_function = function(para1: double): double; cdecl;

function av_csp_luma_coeffs_from_avcsp(csp: TAVColorSpace): PAVLumaCoefficients; cdecl; external libavutil;
function av_csp_primaries_desc_from_id(prm: TAVColorPrimaries): PAVColorPrimariesDesc; cdecl; external libavutil;
function av_csp_primaries_id_from_desc(prm: PAVColorPrimariesDesc): TAVColorPrimaries; cdecl; external libavutil;
function av_csp_approximate_trc_gamma(trc: TAVColorTransferCharacteristic): double; cdecl; external libavutil;
function av_csp_trc_func_from_id(trc: TAVColorTransferCharacteristic): Tav_csp_trc_function; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:25 ===


implementation



end.
