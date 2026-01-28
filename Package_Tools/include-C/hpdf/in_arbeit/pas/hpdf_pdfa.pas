unit hpdf_pdfa;

interface

uses
  fp_hpdf, hpdf, hpdf_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_PDFA_AppendOutputIntents(pdf: THPDF_Doc; iccname: pchar; iccdict: THPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_PDFA_SetPDFAConformance(pdf: THPDF_Doc; pdfatype: THPDF_PDFAType): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_PDFA_AddXmpMetadata(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_PDFA_AddXmpExtension(pdf: THPDF_Doc; xmp_description: pchar): THPDF_STATUS; cdecl; external libhpdf;
procedure HPDF_PDFA_ClearXmpExtensions(pdf: THPDF_Doc); cdecl; external libhpdf;
function HPDF_PDFA_GenerateID(para1: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:09:42 ===


implementation



end.
