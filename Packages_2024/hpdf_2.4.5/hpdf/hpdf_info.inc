{$IFDEF read_interface}


function HPDF_Info_SetInfoAttr(info: THPDF_Dict; _type: THPDF_InfoType; value: pchar; encoder: THPDF_Encoder): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Info_GetInfoAttr(info: THPDF_Dict; _type: THPDF_InfoType): pchar; cdecl; external libhpdf;
function HPDF_Info_SetInfoDateAttr(info: THPDF_Dict; _type: THPDF_InfoType; value: THPDF_Date): THPDF_STATUS; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
