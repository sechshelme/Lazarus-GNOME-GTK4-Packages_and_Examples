{$IFDEF read_interface}


function HPDF_NameDict_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_NameDict; cdecl; external libhpdf;
function HPDF_NameDict_GetNameTree(namedict: THPDF_NameDict; key: THPDF_NameDictKey): THPDF_NameTree; cdecl; external libhpdf;
function HPDF_NameDict_SetNameTree(namedict: THPDF_NameDict; key: THPDF_NameDictKey; tree: THPDF_NameTree): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_NameDict_Validate(namedict: THPDF_NameDict): THPDF_BOOL; cdecl; external libhpdf;

function HPDF_NameTree_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_NameTree; cdecl; external libhpdf;
function HPDF_NameTree_Add(tree: THPDF_NameTree; name: THPDF_String; obj: pointer): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_NameTree_Add_String(tree: THPDF_NameTree; name: pchar; value: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_NameTree_Validate(tree: THPDF_NameTree): THPDF_BOOL; cdecl; external libhpdf;

function HPDF_EmbeddedFile_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; file_: pchar): THPDF_EmbeddedFile; cdecl; external libhpdf;
function HPDF_EmbeddedFile_Validate(emfile: THPDF_EmbeddedFile): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:09:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
