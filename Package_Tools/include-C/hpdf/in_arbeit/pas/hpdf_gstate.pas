unit hpdf_gstate;

interface

uses
  fp_hpdf, hpdf, hpdf_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PHPDF_GState_Rec = ^THPDF_GState_Rec;
  PHPDF_GState = ^THPDF_GState;
  THPDF_GState = PHPDF_GState_Rec;

  THPDF_GState_Rec = record
    trans_matrix: THPDF_TransMatrix;
    line_width: THPDF_REAL;
    line_cap: THPDF_LineCap;
    line_join: THPDF_LineJoin;
    miter_limit: THPDF_REAL;
    dash_mode: THPDF_DashMode;
    flatness: THPDF_REAL;
    char_space: THPDF_REAL;
    word_space: THPDF_REAL;
    h_scalling: THPDF_REAL;
    text_leading: THPDF_REAL;
    rendering_mode: THPDF_TextRenderingMode;
    text_rise: THPDF_REAL;
    cs_fill: THPDF_ColorSpace;
    cs_stroke: THPDF_ColorSpace;
    rgb_fill: THPDF_RGBColor;
    rgb_stroke: THPDF_RGBColor;
    cmyk_fill: THPDF_CMYKColor;
    cmyk_stroke: THPDF_CMYKColor;
    gray_fill: THPDF_REAL;
    gray_stroke: THPDF_REAL;
    font: THPDF_Font;
    font_size: THPDF_REAL;
    writing_mode: THPDF_WritingMode;
    prev: THPDF_GState;
    depth: THPDF_UINT;
  end;

function HPDF_GState_New(mmgr: THPDF_MMgr; current: THPDF_GState): THPDF_GState; cdecl; external libhpdf;
function HPDF_GState_Free(mmgr: THPDF_MMgr; gstate: THPDF_GState): THPDF_GState; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:33 ===


implementation



end.
