
unit hpdf_destination;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_destination.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_destination.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_destination.c
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
{$ifndef _HPDF_DESTINATION_H}
{$define _HPDF_DESTINATION_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{----- HPDF_Destination ----------------------------------------------------- }

function HPDF_Destination_New(mmgr:THPDF_MMgr; target:THPDF_Page; xref:THPDF_Xref):THPDF_Destination;cdecl;external;
function HPDF_Destination_Validate(dst:THPDF_Destination):THPDF_BOOL;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_DESTINATION_H  }

implementation


end.
