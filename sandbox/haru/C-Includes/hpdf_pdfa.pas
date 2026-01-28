unit hpdf_pdfa;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_pdfa.h
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
{$ifndef _HPDF_PDFA_H}
{$define _HPDF_PDFA_H}
{$include "hpdf.h"}
{$include "hpdf_doc.h"}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }

function HPDF_PDFA_AppendOutputIntents(pdf:THPDF_Doc; iccname:Pchar; iccdict:THPDF_Dict):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_PDFA_SetPDFAConformance(pdf:THPDF_Doc; pdfatype:THPDF_PDFAType):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_PDFA_AddXmpMetadata(pdf:THPDF_Doc):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_PDFA_AddXmpExtension(pdf:THPDF_Doc; xmp_description:Pchar):THPDF_STATUS;cdecl;external libhpdf;
procedure HPDF_PDFA_ClearXmpExtensions(pdf:THPDF_Doc);cdecl;external libhpdf;
function HPDF_PDFA_GenerateID(para1:THPDF_Doc):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 28-1-26 14:09:42 ===


implementation



end.
