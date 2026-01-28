unit hpdf_ext_gstate;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_ext_gstate.h
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
{$ifndef _HPDF_EXT_GSTATE_H}
{$define _HPDF_EXT_GSTATE_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }

function HPDF_ExtGState_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_Dict;cdecl;external libhpdf;
function HPDF_ExtGState_Validate(ext_gstate:THPDF_ExtGState):THPDF_BOOL;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_EXT_GSTATE_H  }

// === Konventiert am: 28-1-26 14:02:26 ===


implementation



end.
