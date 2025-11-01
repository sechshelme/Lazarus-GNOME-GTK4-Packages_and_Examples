{$IFDEF read_interface}


function cd_it8_utils_calculate_ccmx(it8_reference: PCdIt8; it8_measured: PCdIt8; it8_ccmx: PCdIt8; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_utils_calculate_xyz_from_cmf(cmf: PCdIt8; illuminant: PCdSpectrum; spectrum: PCdSpectrum; value: PCdColorXYZ; resolution: Tgdouble;
  error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_utils_calculate_cri_from_cmf(cmf: PCdIt8; tcs: PCdIt8; illuminant: PCdSpectrum; value: Pgdouble; resolution: Tgdouble;
  error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_utils_calculate_gamma(it8: PCdIt8; gamma_y: Pgdouble; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
