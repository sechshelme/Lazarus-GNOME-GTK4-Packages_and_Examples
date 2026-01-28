unit hpdf_info;

interface

uses
  fp_hpdf;

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

function HPDF_Info_SetInfoAttr(info:THPDF_Dict; _type:THPDF_InfoType; value:Pchar; encoder:THPDF_Encoder):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Info_GetInfoAttr(info:THPDF_Dict; _type:THPDF_InfoType):Pchar;cdecl;external libhpdf;
function HPDF_Info_SetInfoDateAttr(info:THPDF_Dict; _type:THPDF_InfoType; value:THPDF_Date):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_INFO_H  }

// === Konventiert am: 28-1-26 14:02:38 ===


implementation



end.
