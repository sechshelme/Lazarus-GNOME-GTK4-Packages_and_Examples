unit hpdf_3dmeasure;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_annotation.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_3DMEASURE_H}
{$define _HPDF_3DMEASURE_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{------ HPDF_3DMeasure ----------------------------------------------------- }

function HPDF_3DC3DMeasure_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; firstanchorpoint:THPDF_Point3D; textanchorpoint:THPDF_Point3D):THPDF_3DMeasure;cdecl;external libhpdf;
function HPDF_PD33DMeasure_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; annotationPlaneNormal:THPDF_Point3D; firstAnchorPoint:THPDF_Point3D; secondAnchorPoint:THPDF_Point3D; 
           leaderLinesDirection:THPDF_Point3D; measurementValuePoint:THPDF_Point3D; textYDirection:THPDF_Point3D; value:THPDF_REAL; unitsString:Pchar):THPDF_3DMeasure;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_3DMEASURE_H  }

// === Konventiert am: 28-1-26 13:59:45 ===


implementation



end.
