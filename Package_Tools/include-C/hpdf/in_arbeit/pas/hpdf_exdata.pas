unit hpdf_exdata;

interface

uses
  fp_hpdf, hpdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_3DAnnotExData_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_ExData; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:24 ===


implementation



end.
