unit hpdf_3dmeasure;

interface

uses
  fp_hpdf, hpdf_types, hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function HPDF_3DC3DMeasure_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; firstanchorpoint:THPDF_Point3D; textanchorpoint:THPDF_Point3D):THPDF_3DMeasure;cdecl;external libhpdf;
function HPDF_PD33DMeasure_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; annotationPlaneNormal:THPDF_Point3D; firstAnchorPoint:THPDF_Point3D; secondAnchorPoint:THPDF_Point3D; 
           leaderLinesDirection:THPDF_Point3D; measurementValuePoint:THPDF_Point3D; textYDirection:THPDF_Point3D; value:THPDF_REAL; unitsString:Pchar):THPDF_3DMeasure;cdecl;external libhpdf;

// === Konventiert am: 28-1-26 13:59:45 ===


implementation



end.
