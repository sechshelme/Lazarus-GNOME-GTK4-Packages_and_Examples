
unit hpdf_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_info.h
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
 * << Haru Free PDF Library >> -- hpdf_info.c
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
{$ifndef _HPDF_INFO_H}
{$define _HPDF_INFO_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)

function HPDF_Info_SetInfoAttr(info:THPDF_Dict; _type:THPDF_InfoType; value:Pchar; encoder:THPDF_Encoder):THPDF_STATUS;cdecl;external;
(* Const before type ignored *)
function HPDF_Info_GetInfoAttr(info:THPDF_Dict; _type:THPDF_InfoType):Pchar;cdecl;external;
function HPDF_Info_SetInfoDateAttr(info:THPDF_Dict; _type:THPDF_InfoType; value:THPDF_Date):THPDF_STATUS;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_INFO_H  }

implementation


end.
