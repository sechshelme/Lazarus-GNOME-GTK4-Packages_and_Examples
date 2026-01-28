unit hpdf_page_label;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_page_label.h
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
{$ifndef _HPDF_PAGE_LABEL_H}
{$define _HPDF_PAGE_LABEL_H}
{$include "hpdf.h"}
{ C++ extern C conditionnal removed }

function HPDF_PageLabel_New(pdf:THPDF_Doc; style:THPDF_PageNumStyle; first_page:THPDF_INT; prefix:Pchar):THPDF_Dict;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}

// === Konventiert am: 28-1-26 14:09:38 ===


implementation



end.
