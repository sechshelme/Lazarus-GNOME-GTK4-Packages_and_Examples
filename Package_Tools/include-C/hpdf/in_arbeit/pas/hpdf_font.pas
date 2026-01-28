unit hpdf_font;

interface

uses
  fp_hpdf, hpdf_types, hpdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PHPDF_FontType = ^THPDF_FontType;
  THPDF_FontType = longint;

const
  HPDF_FONT_TYPE1 = 0;
  HPDF_FONT_TRUETYPE = 1;
  HPDF_FONT_TYPE3 = 2;
  HPDF_FONT_TYPE0_CID = 3;
  HPDF_FONT_TYPE0_TT = 4;
  HPDF_FONT_CID_TYPE0 = 5;
  HPDF_FONT_CID_TYPE2 = 6;
  HPDF_FONT_MMTYPE1 = 7;

type
  PHPDF_Font = ^THPDF_Font;
  THPDF_Font = THPDF_Dict;

  THPDF_Font_TextWidths_Func = function(font: THPDF_Font; text: PHPDF_BYTE; len: THPDF_UINT): THPDF_TextWidth; cdecl;
  THPDF_Font_MeasureText_Func = function(font: THPDF_Font; text: PHPDF_BYTE; len: THPDF_UINT; width: THPDF_REAL; fontsize: THPDF_REAL;
    charspace: THPDF_REAL; wordspace: THPDF_REAL; wordwrap: THPDF_BOOL; real_width: PHPDF_REAL): THPDF_UINT; cdecl;

  PHPDF_FontAttr_Rec = ^THPDF_FontAttr_Rec;
  PHPDF_FontAttr = ^THPDF_FontAttr;
  THPDF_FontAttr = PHPDF_FontAttr_Rec;

  THPDF_FontAttr_Rec = record
    _type: THPDF_FontType;
    writing_mode: THPDF_WritingMode;
    text_width_fn: THPDF_Font_TextWidths_Func;
    measure_text_fn: THPDF_Font_MeasureText_Func;
    fontdef: THPDF_FontDef;
    encoder: THPDF_Encoder;
    widths: PHPDF_INT16;
    used: PHPDF_BYTE;
    xref: THPDF_Xref;
    descendant_font: THPDF_Font;
    map_stream: THPDF_Dict;
    cmap_stream: THPDF_Dict;
  end;

function HPDF_Type1Font_New(mmgr: THPDF_MMgr; fontdef: THPDF_FontDef; encoder: THPDF_Encoder; xref: THPDF_Xref): THPDF_Font; cdecl; external libhpdf;
function HPDF_TTFont_New(mmgr: THPDF_MMgr; fontdef: THPDF_FontDef; encoder: THPDF_Encoder; xref: THPDF_Xref): THPDF_Font; cdecl; external libhpdf;
function HPDF_Type0Font_New(mmgr: THPDF_MMgr; fontdef: THPDF_FontDef; encoder: THPDF_Encoder; xref: THPDF_Xref): THPDF_Font; cdecl; external libhpdf;
function HPDF_Font_Validate(font: THPDF_Font): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:28 ===


implementation



end.
