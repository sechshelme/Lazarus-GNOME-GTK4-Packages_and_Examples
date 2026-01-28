
unit hpdf_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_list.h
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
PHPDF_List  = ^HPDF_List;
PHPDF_List_Rec  = ^HPDF_List_Rec;
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

function HPDF_List_New(mmgr:THPDF_MMgr; items_per_block:THPDF_UINT):THPDF_List;cdecl;external;
procedure HPDF_List_Free(list:THPDF_List);cdecl;external;
function HPDF_List_Add(list:THPDF_List; item:pointer):THPDF_STATUS;cdecl;external;
function HPDF_List_Insert(list:THPDF_List; target:pointer; item:pointer):THPDF_STATUS;cdecl;external;
function HPDF_List_Remove(list:THPDF_List; item:pointer):THPDF_STATUS;cdecl;external;
function HPDF_List_RemoveByIndex(list:THPDF_List; index:THPDF_UINT):pointer;cdecl;external;
function HPDF_List_ItemAt(list:THPDF_List; index:THPDF_UINT):pointer;cdecl;external;
function HPDF_List_Find(list:THPDF_List; item:pointer):THPDF_INT32;cdecl;external;
procedure HPDF_List_Clear(list:THPDF_List);cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_LIST_H  }

implementation


end.
