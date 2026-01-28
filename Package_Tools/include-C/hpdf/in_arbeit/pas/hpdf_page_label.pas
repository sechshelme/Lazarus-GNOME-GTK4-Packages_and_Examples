unit hpdf_page_label;

interface

uses
  fp_hpdf, hpdf, hpdf_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_PageLabel_New(pdf: THPDF_Doc; style: THPDF_PageNumStyle; first_page: THPDF_INT; prefix: pchar): THPDF_Dict; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:09:38 ===


implementation



end.
