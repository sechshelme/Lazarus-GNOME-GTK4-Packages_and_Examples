
unit hpdf_outline;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_outline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_outline.h
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

function HPDF_OutlineRoot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_Outline;cdecl;external;
(* Const before type ignored *)
function HPDF_Outline_New(mmgr:THPDF_MMgr; parent:THPDF_Outline; title:Pchar; encoder:THPDF_Encoder; xref:THPDF_Xref):THPDF_Outline;cdecl;external;
function HPDF_Outline_GetFirst(outline:THPDF_Outline):THPDF_Outline;cdecl;external;
function HPDF_Outline_GetLast(outline:THPDF_Outline):THPDF_Outline;cdecl;external;
function HPDF_Outline_GetPrev(outline:THPDF_Outline):THPDF_Outline;cdecl;external;
function HPDF_Outline_GetNext(outline:THPDF_Outline):THPDF_Outline;cdecl;external;
function HPDF_Outline_GetParent(outline:THPDF_Outline):THPDF_Outline;cdecl;external;
function HPDF_Outline_GetOpened(outline:THPDF_Outline):THPDF_BOOL;cdecl;external;
function HPDF_Outline_Validate(obj:THPDF_Outline):THPDF_BOOL;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_OUTLINE_H  }

implementation


end.
