unit cd_it8_utils;

interface

uses
  fp_glib2, fp_colord, cd_it8, cd_spectrum, cd_color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function cd_it8_utils_calculate_ccmx(it8_reference: PCdIt8; it8_measured: PCdIt8; it8_ccmx: PCdIt8; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_utils_calculate_xyz_from_cmf(cmf: PCdIt8; illuminant: PCdSpectrum; spectrum: PCdSpectrum; value: PCdColorXYZ; resolution: Tgdouble;
  error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_utils_calculate_cri_from_cmf(cmf: PCdIt8; tcs: PCdIt8; illuminant: PCdSpectrum; value: Pgdouble; resolution: Tgdouble;
  error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_utils_calculate_gamma(it8: PCdIt8; gamma_y: Pgdouble; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:19 ===


implementation



end.
