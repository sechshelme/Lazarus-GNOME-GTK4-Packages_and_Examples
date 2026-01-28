
unit hpdf_pdfa;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_pdfa.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_pdfa.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
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
(* Const before type ignored *)

function HPDF_PDFA_AppendOutputIntents(pdf:THPDF_Doc; iccname:Pchar; iccdict:THPDF_Dict):THPDF_STATUS;cdecl;external;
function HPDF_PDFA_SetPDFAConformance(pdf:THPDF_Doc; pdfatype:THPDF_PDFAType):THPDF_STATUS;cdecl;external;
function HPDF_PDFA_AddXmpMetadata(pdf:THPDF_Doc):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_PDFA_AddXmpExtension(pdf:THPDF_Doc; xmp_description:Pchar):THPDF_STATUS;cdecl;external;
procedure HPDF_PDFA_ClearXmpExtensions(pdf:THPDF_Doc);cdecl;external;
function HPDF_PDFA_GenerateID(para1:THPDF_Doc):THPDF_STATUS;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
