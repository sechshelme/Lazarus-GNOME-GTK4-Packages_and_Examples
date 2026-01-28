unit hpdf_outline;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_outline.h
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
{$ifndef _HPDF_OUTLINE_H}
{$define _HPDF_OUTLINE_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{----- HPDF_Outline --------------------------------------------------------- }

function HPDF_OutlineRoot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_New(mmgr:THPDF_MMgr; parent:THPDF_Outline; title:Pchar; encoder:THPDF_Encoder; xref:THPDF_Xref):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_GetFirst(outline:THPDF_Outline):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_GetLast(outline:THPDF_Outline):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_GetPrev(outline:THPDF_Outline):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_GetNext(outline:THPDF_Outline):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_GetParent(outline:THPDF_Outline):THPDF_Outline;cdecl;external libhpdf;
function HPDF_Outline_GetOpened(outline:THPDF_Outline):THPDF_BOOL;cdecl;external libhpdf;
function HPDF_Outline_Validate(obj:THPDF_Outline):THPDF_BOOL;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_OUTLINE_H  }

// === Konventiert am: 28-1-26 14:09:36 ===


implementation



end.
