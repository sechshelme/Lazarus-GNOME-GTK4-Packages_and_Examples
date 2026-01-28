unit hpdf_mmgr;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_mmgr.h
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
{$ifndef _HPDF_MMGR_H}
{$define _HPDF_MMGR_H}
{$include "hpdf_types.h"}
{$include "hpdf_error.h"}
{ C++ extern C conditionnal removed }
type
  PHPDF_MPool_Node = ^THPDF_MPool_Node;
  THPDF_MPool_Node = PHPDF_MPool_Node_Rec;

  PHPDF_MPool_Node_Rec = ^THPDF_MPool_Node_Rec;
  THPDF_MPool_Node_Rec = record
      buf : PHPDF_BYTE;
      size : THPDF_UINT;
      used_size : THPDF_UINT;
      next_node : THPDF_MPool_Node;
    end;

  PHPDF_MMgr = ^THPDF_MMgr;
  THPDF_MMgr = PHPDF_MMgr_Rec;
{$ifdef HPDF_MEM_DEBUG}
{$endif}
type
  PHPDF_MMgr_Rec = ^THPDF_MMgr_Rec;
  THPDF_MMgr_Rec = record
      error : THPDF_Error;
      alloc_fn : THPDF_Alloc_Func;
      free_fn : THPDF_Free_Func;
      mpool : THPDF_MPool_Node;
      buf_size : THPDF_UINT;
      alloc_cnt : THPDF_UINT;
      free_cnt : THPDF_UINT;
    end;
{  HPDF_mpool_new
 *
 *  create new HPDF_mpool object. when memory allocation goes wrong,
 *  it returns NULL and error handling function will be called.
 *  if buf_size is non-zero, mmgr is configured to be using memory-pool
  }

function HPDF_MMgr_New(error:THPDF_Error; buf_size:THPDF_UINT; alloc_fn:THPDF_Alloc_Func; free_fn:THPDF_Free_Func):THPDF_MMgr;cdecl;external libhpdf;
procedure HPDF_MMgr_Free(mmgr:THPDF_MMgr);cdecl;external libhpdf;
function HPDF_GetMem(mmgr:THPDF_MMgr; size:THPDF_UINT):pointer;cdecl;external libhpdf;
procedure HPDF_FreeMem(mmgr:THPDF_MMgr; aptr:pointer);cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_MMGR_H  }

// === Konventiert am: 28-1-26 14:02:42 ===


implementation



end.
