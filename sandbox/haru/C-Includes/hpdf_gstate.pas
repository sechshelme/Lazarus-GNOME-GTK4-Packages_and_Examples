unit hpdf_gstate;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_gstate.h
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
{$ifndef _HPDF_GSTATE_H}
{$define _HPDF_GSTATE_H}
{$include "hpdf_font.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{------ graphic state stack ------------------------------------------------- }
type
  PHPDF_GState = ^THPDF_GState;
  THPDF_GState = PHPDF_GState_Rec;

  PHPDF_GState_Rec = ^THPDF_GState_Rec;
  THPDF_GState_Rec = record
      trans_matrix : THPDF_TransMatrix;
      line_width : THPDF_REAL;
      line_cap : THPDF_LineCap;
      line_join : THPDF_LineJoin;
      miter_limit : THPDF_REAL;
      dash_mode : THPDF_DashMode;
      flatness : THPDF_REAL;
      char_space : THPDF_REAL;
      word_space : THPDF_REAL;
      h_scalling : THPDF_REAL;
      text_leading : THPDF_REAL;
      rendering_mode : THPDF_TextRenderingMode;
      text_rise : THPDF_REAL;
      cs_fill : THPDF_ColorSpace;
      cs_stroke : THPDF_ColorSpace;
      rgb_fill : THPDF_RGBColor;
      rgb_stroke : THPDF_RGBColor;
      cmyk_fill : THPDF_CMYKColor;
      cmyk_stroke : THPDF_CMYKColor;
      gray_fill : THPDF_REAL;
      gray_stroke : THPDF_REAL;
      font : THPDF_Font;
      font_size : THPDF_REAL;
      writing_mode : THPDF_WritingMode;
      prev : THPDF_GState;
      depth : THPDF_UINT;
    end;
{---------------------------------------------------------------------------- }
{---------------------------------------------------------------------------- }

function HPDF_GState_New(mmgr:THPDF_MMgr; current:THPDF_GState):THPDF_GState;cdecl;external libhpdf;
function HPDF_GState_Free(mmgr:THPDF_MMgr; gstate:THPDF_GState):THPDF_GState;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_GSTATE_H  }

// === Konventiert am: 28-1-26 14:02:33 ===


implementation



end.
