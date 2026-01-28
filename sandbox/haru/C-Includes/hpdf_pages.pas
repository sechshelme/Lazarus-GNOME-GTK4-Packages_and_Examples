unit hpdf_pages;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_pages.c
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
{$ifndef _HPDF_PAGES_H}
{$define _HPDF_PAGES_H}
{$include "hpdf_gstate.h"}
{$include "hpdf_ext_gstate.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{----- HPDF_Pages ----------------------------------------------------------- }

function HPDF_Pages_New(mmgr:THPDF_MMgr; parent:THPDF_Pages; xref:THPDF_Xref):THPDF_Pages;cdecl;external libhpdf;
function HPDF_Pages_Validate(pages:THPDF_Pages):THPDF_BOOL;cdecl;external libhpdf;
function HPDF_Pages_AddKids(parent:THPDF_Pages; kid:THPDF_Dict):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Page_InsertBefore(page:THPDF_Page; target:THPDF_Page):THPDF_STATUS;cdecl;external libhpdf;
type
  PHPDF_PageAttr = ^THPDF_PageAttr;
  THPDF_PageAttr = PHPDF_PageAttr_Rec;

  PHPDF_PageAttr_Rec = ^THPDF_PageAttr_Rec;
  THPDF_PageAttr_Rec = record
      parent : THPDF_Pages;
      fonts : THPDF_Dict;
      xobjects : THPDF_Dict;
      ext_gstates : THPDF_Dict;
      shadings : THPDF_Dict;
      gstate : THPDF_GState;
      str_pos : THPDF_Point;
      cur_pos : THPDF_Point;
      text_pos : THPDF_Point;
      text_matrix : THPDF_TransMatrix;
      gmode : THPDF_UINT16;
      contents : THPDF_Dict;
      stream : THPDF_Stream;
      xref : THPDF_Xref;
      compression_mode : THPDF_UINT;
      ver : PHPDF_PDFVer;
    end;
{---------------------------------------------------------------------------- }
{----- HPDF_Page ------------------------------------------------------------ }

function HPDF_Page_Validate(page:THPDF_Page):THPDF_BOOL;cdecl;external libhpdf;
function HPDF_Page_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_Page;cdecl;external libhpdf;
function HPDF_Page_GetInheritableItem(page:THPDF_Page; key:Pchar; obj_class:THPDF_UINT16):pointer;cdecl;external libhpdf;
function HPDF_Page_GetXObjectName(page:THPDF_Page; xobj:THPDF_XObject):Pchar;cdecl;external libhpdf;
function HPDF_Page_GetLocalFontName(page:THPDF_Page; font:THPDF_Font):Pchar;cdecl;external libhpdf;
function HPDF_Page_GetExtGStateName(page:THPDF_Page; gstate:THPDF_ExtGState):Pchar;cdecl;external libhpdf;
function HPDF_Page_GetShadingName(page:THPDF_Page; shading:THPDF_Shading):Pchar;cdecl;external libhpdf;
function HPDF_Page_GetMediaBox(page:THPDF_Page):THPDF_Box;cdecl;external libhpdf;
function HPDF_Page_SetBoxValue(page:THPDF_Page; name:Pchar; index:THPDF_UINT; value:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
procedure HPDF_Page_SetFilter(page:THPDF_Page; filter:THPDF_UINT);cdecl;external libhpdf;
function HPDF_Page_CheckState(page:THPDF_Page; mode:THPDF_UINT):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_PAGES_H  }

// === Konventiert am: 28-1-26 14:09:40 ===


implementation



end.
