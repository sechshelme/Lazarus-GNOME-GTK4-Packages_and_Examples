{$IFDEF read_interface}



function cd_icc_utils_get_coverage(icc: PCdIcc; icc_reference: PCdIcc; coverage: Pgdouble; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_icc_utils_get_adaptation_matrix(icc: PCdIcc; icc_reference: PCdIcc; out_: PCdMat3x3; error: PPGError): Tgboolean; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
