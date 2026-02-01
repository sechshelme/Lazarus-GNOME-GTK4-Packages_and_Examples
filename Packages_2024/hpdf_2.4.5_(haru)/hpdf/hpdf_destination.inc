{$IFDEF read_interface}


function HPDF_Destination_New(mmgr: THPDF_MMgr; target: THPDF_Page; xref: THPDF_Xref): THPDF_Destination; cdecl; external libhpdf;
function HPDF_Destination_Validate(dst: THPDF_Destination): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:00:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
