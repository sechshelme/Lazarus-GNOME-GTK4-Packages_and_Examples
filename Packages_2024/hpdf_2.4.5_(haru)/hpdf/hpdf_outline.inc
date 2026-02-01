{$IFDEF read_interface}


function HPDF_OutlineRoot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_New(mmgr: THPDF_MMgr; parent: THPDF_Outline; title: pchar; encoder: THPDF_Encoder; xref: THPDF_Xref): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_GetFirst(outline: THPDF_Outline): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_GetLast(outline: THPDF_Outline): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_GetPrev(outline: THPDF_Outline): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_GetNext(outline: THPDF_Outline): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_GetParent(outline: THPDF_Outline): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_GetOpened(outline: THPDF_Outline): THPDF_BOOL; cdecl; external libhpdf;
function HPDF_Outline_Validate(obj: THPDF_Outline): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:09:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
