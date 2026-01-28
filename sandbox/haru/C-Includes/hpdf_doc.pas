unit hpdf_doc;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_doc.h
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
{$ifndef _HPDF_DOC_H}
{$define _HPDF_DOC_H}

const
  HPDF_SIG_BYTES = $41504446;  
{$include "hpdf_catalog.h"}
{$include "hpdf_image.h"}
{$include "hpdf_pages.h"}
{$include "hpdf_outline.h"}
{$include "hpdf_ext_gstate.h"}
{ C++ extern C conditionnal removed }

const
  HPDF_VER_DEFAULT = HPDF_VER_13;  
{ list for loaded fontdefs  }
{ list for loaded encodings  }
{ default compression mode  }
{ buffer for saving into memory stream  }
{ PDF/A conformance  }
type
  PHPDF_Doc_Rec = ^THPDF_Doc_Rec;
  THPDF_Doc_Rec = record
      sig_bytes : THPDF_UINT32;
      pdf_version : THPDF_PDFVer;
      mmgr : THPDF_MMgr;
      catalog : THPDF_Catalog;
      outlines : THPDF_Outline;
      xref : THPDF_Xref;
      root_pages : THPDF_Pages;
      cur_pages : THPDF_Pages;
      cur_page : THPDF_Page;
      page_list : THPDF_List;
      error : THPDF_Error_Rec;
      info : THPDF_Dict;
      trailer : THPDF_Dict;
      font_mgr : THPDF_List;
      ttfont_tag : array[0..5] of THPDF_BYTE;
      fontdef_list : THPDF_List;
      encoder_list : THPDF_List;
      cur_encoder : THPDF_Encoder;
      compression_mode : THPDF_BOOL;
      encrypt_on : THPDF_BOOL;
      encrypt_dict : THPDF_EncryptDict;
      def_encoder : THPDF_Encoder;
      page_per_pages : THPDF_UINT;
      cur_page_num : THPDF_UINT;
      stream : THPDF_Stream;
      pdfa_type : THPDF_PDFAType;
      xmp_extensions : THPDF_List;
    end;

  PHPDF_Doc = ^THPDF_Doc;
  THPDF_Doc = PHPDF_Doc_Rec;

function HPDF_Doc_FindEncoder(pdf:THPDF_Doc; encoding_name:Pchar):THPDF_Encoder;cdecl;external libhpdf;
function HPDF_Doc_FindFontDef(pdf:THPDF_Doc; font_name:Pchar):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_Doc_FindFont(pdf:THPDF_Doc; font_name:Pchar; encoding_name:Pchar):THPDF_Font;cdecl;external libhpdf;
function HPDF_Doc_Validate(pdf:THPDF_Doc):THPDF_BOOL;cdecl;external libhpdf;
{----- page handling ------------------------------------------------------- }
function HPDF_Doc_GetCurrentPages(pdf:THPDF_Doc):THPDF_Pages;cdecl;external libhpdf;
function HPDF_Doc_AddPagesTo(pdf:THPDF_Doc; parent:THPDF_Pages):THPDF_Pages;cdecl;external libhpdf;
function HPDF_Doc_SetCurrentPages(pdf:THPDF_Doc; pages:THPDF_Pages):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Doc_SetCurrentPage(pdf:THPDF_Doc; page:THPDF_Page):THPDF_STATUS;cdecl;external libhpdf;
{----- font handling ------------------------------------------------------- }
function HPDF_GetFontDef(pdf:THPDF_Doc; font_name:Pchar):THPDF_FontDef;cdecl;external libhpdf;
function HPDF_Doc_RegisterFontDef(pdf:THPDF_Doc; fontdef:THPDF_FontDef):THPDF_STATUS;cdecl;external libhpdf;
{----- encoding handling --------------------------------------------------- }
function HPDF_Doc_RegisterEncoder(pdf:THPDF_Doc; encoder:THPDF_Encoder):THPDF_STATUS;cdecl;external libhpdf;
{----- encryption ---------------------------------------------------------- }
function HPDF_Doc_SetEncryptOn(pdf:THPDF_Doc):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Doc_SetEncryptOff(pdf:THPDF_Doc):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Doc_PrepareEncryption(pdf:THPDF_Doc):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_DOC_H  }

// === Konventiert am: 28-1-26 14:00:02 ===


implementation



end.
