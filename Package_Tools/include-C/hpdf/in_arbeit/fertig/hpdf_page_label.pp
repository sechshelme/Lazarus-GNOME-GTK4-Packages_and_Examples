
unit hpdf_page_label;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_page_label.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_page_label.h
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
(* Const before type ignored *)

function HPDF_PageLabel_New(pdf:THPDF_Doc; style:THPDF_PageNumStyle; first_page:THPDF_INT; prefix:Pchar):THPDF_Dict;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}

implementation


end.
