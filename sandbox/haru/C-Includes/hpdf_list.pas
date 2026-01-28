unit hpdf_list;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_list.h
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
{$ifndef _HPDF_LIST_H}
{$define _HPDF_LIST_H}
{$include "hpdf_error.h"}
{$include "hpdf_mmgr.h"}
{ C++ extern C conditionnal removed }
type
  PHPDF_List = ^THPDF_List;
  THPDF_List = PHPDF_List_Rec;

  PHPDF_List_Rec = ^THPDF_List_Rec;
  THPDF_List_Rec = record
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      block_siz : THPDF_UINT;
      items_per_block : THPDF_UINT;
      count : THPDF_UINT;
      obj : ^pointer;
    end;

function HPDF_List_New(mmgr:THPDF_MMgr; items_per_block:THPDF_UINT):THPDF_List;cdecl;external libhpdf;
procedure HPDF_List_Free(list:THPDF_List);cdecl;external libhpdf;
function HPDF_List_Add(list:THPDF_List; item:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_List_Insert(list:THPDF_List; target:pointer; item:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_List_Remove(list:THPDF_List; item:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_List_RemoveByIndex(list:THPDF_List; index:THPDF_UINT):pointer;cdecl;external libhpdf;
function HPDF_List_ItemAt(list:THPDF_List; index:THPDF_UINT):pointer;cdecl;external libhpdf;
function HPDF_List_Find(list:THPDF_List; item:pointer):THPDF_INT32;cdecl;external libhpdf;
procedure HPDF_List_Clear(list:THPDF_List);cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_LIST_H  }

// === Konventiert am: 28-1-26 14:02:40 ===


implementation



end.
