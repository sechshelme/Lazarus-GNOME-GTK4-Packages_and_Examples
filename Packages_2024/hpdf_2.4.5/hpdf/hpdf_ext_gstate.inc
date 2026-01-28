{$IFDEF read_interface}


function HPDF_ExtGState_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_Dict; cdecl; external libhpdf;
function HPDF_ExtGState_Validate(ext_gstate: THPDF_ExtGState): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
