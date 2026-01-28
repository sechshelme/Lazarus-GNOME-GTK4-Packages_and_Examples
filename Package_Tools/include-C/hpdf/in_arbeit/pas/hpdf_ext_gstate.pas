unit hpdf_ext_gstate;

interface

uses
  fp_hpdf, hpdf, hpdf_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_ExtGState_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_Dict; cdecl; external libhpdf;
function HPDF_ExtGState_Validate(ext_gstate: THPDF_ExtGState): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:26 ===


implementation



end.
