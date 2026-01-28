
unit hpdf_gstate;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_gstate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_gstate.h
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
PHPDF_GState  = ^HPDF_GState;
PHPDF_GState_Rec  = ^HPDF_GState_Rec;
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

function HPDF_GState_New(mmgr:THPDF_MMgr; current:THPDF_GState):THPDF_GState;cdecl;external;
function HPDF_GState_Free(mmgr:THPDF_MMgr; gstate:THPDF_GState):THPDF_GState;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_GSTATE_H  }

implementation


end.
