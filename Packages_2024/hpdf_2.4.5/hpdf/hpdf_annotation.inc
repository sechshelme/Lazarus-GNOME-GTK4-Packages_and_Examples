{$IFDEF read_interface}


function HPDF_Annotation_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; _type: THPDF_AnnotType; rect: THPDF_Rect): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_WidgetAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_LinkAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; dst: THPDF_Destination): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_URILinkAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; uri: pchar): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_3DAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; tb: THPDF_BOOL; np: THPDF_BOOL;
  u3d: THPDF_U3D; ap: THPDF_Image): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_MarkupAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder;
  subtype: THPDF_AnnotType): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_PopupAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; parent: THPDF_Annotation): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_StampAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; name: THPDF_StampAnnotName; text: pchar;
  encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_ProjectionAnnot_New(mmgr: THPDF_MMgr; xref: THPDF_Xref; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Annotation_Validate(annot: THPDF_Annotation): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 13:59:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
