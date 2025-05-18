unit efl_text_font_properties_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Text_Font_Properties = ^TEfl_Text_Font_Properties;
  TEfl_Text_Font_Properties = TEo;

type
  PEfl_Text_Font_Weight = ^TEfl_Text_Font_Weight;
  TEfl_Text_Font_Weight = longint;

const
  EFL_TEXT_FONT_WEIGHT_NORMAL = 0;
  EFL_TEXT_FONT_WEIGHT_THIN = 1;
  EFL_TEXT_FONT_WEIGHT_ULTRALIGHT = 2;
  EFL_TEXT_FONT_WEIGHT_EXTRALIGHT = 3;
  EFL_TEXT_FONT_WEIGHT_LIGHT = 4;
  EFL_TEXT_FONT_WEIGHT_BOOK = 5;
  EFL_TEXT_FONT_WEIGHT_MEDIUM = 6;
  EFL_TEXT_FONT_WEIGHT_SEMIBOLD = 7;
  EFL_TEXT_FONT_WEIGHT_BOLD = 8;
  EFL_TEXT_FONT_WEIGHT_ULTRABOLD = 9;
  EFL_TEXT_FONT_WEIGHT_EXTRABOLD = 10;
  EFL_TEXT_FONT_WEIGHT_BLACK = 11;
  EFL_TEXT_FONT_WEIGHT_EXTRABLACK = 12;

type
  PEfl_Text_Font_Width = ^TEfl_Text_Font_Width;
  TEfl_Text_Font_Width = longint;

const
  EFL_TEXT_FONT_WIDTH_NORMAL = 0;
  EFL_TEXT_FONT_WIDTH_ULTRACONDENSED = 1;
  EFL_TEXT_FONT_WIDTH_EXTRACONDENSED = 2;
  EFL_TEXT_FONT_WIDTH_CONDENSED = 3;
  EFL_TEXT_FONT_WIDTH_SEMICONDENSED = 4;
  EFL_TEXT_FONT_WIDTH_SEMIEXPANDED = 5;
  EFL_TEXT_FONT_WIDTH_EXPANDED = 6;
  EFL_TEXT_FONT_WIDTH_EXTRAEXPANDED = 7;
  EFL_TEXT_FONT_WIDTH_ULTRAEXPANDED = 8;

type
  PEfl_Text_Font_Slant = ^TEfl_Text_Font_Slant;
  TEfl_Text_Font_Slant = longint;

const
  EFL_TEXT_FONT_SLANT_NORMAL = 0;
  EFL_TEXT_FONT_SLANT_OBLIQUE = 1;
  EFL_TEXT_FONT_SLANT_ITALIC = 2;

type
  PEfl_Text_Font_Bitmap_Scalable = ^TEfl_Text_Font_Bitmap_Scalable;
  TEfl_Text_Font_Bitmap_Scalable = longint;

const
  EFL_TEXT_FONT_BITMAP_SCALABLE_NONE = 0;
  EFL_TEXT_FONT_BITMAP_SCALABLE_COLOR = 1;

function EFL_TEXT_FONT_PROPERTIES_INTERFACE: PEfl_Class;

function efl_text_font_properties_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_text_font_family_set(obj: PEo; font: pchar); cdecl; external libefl;
function efl_text_font_family_get(obj: PEo): pchar; cdecl; external libefl;
procedure efl_text_font_size_set(obj: PEo; size: TEfl_Font_Size); cdecl; external libefl;
function efl_text_font_size_get(obj: PEo): TEfl_Font_Size; cdecl; external libefl;
procedure efl_text_font_source_set(obj: PEo; font_source: pchar); cdecl; external libefl;
function efl_text_font_source_get(obj: PEo): pchar; cdecl; external libefl;
procedure efl_text_font_fallbacks_set(obj: PEo; font_fallbacks: pchar); cdecl; external libefl;
function efl_text_font_fallbacks_get(obj: PEo): pchar; cdecl; external libefl;
procedure efl_text_font_weight_set(obj: PEo; font_weight: TEfl_Text_Font_Weight); cdecl; external libefl;
function efl_text_font_weight_get(obj: PEo): TEfl_Text_Font_Weight; cdecl; external libefl;
procedure efl_text_font_slant_set(obj: PEo; style: TEfl_Text_Font_Slant); cdecl; external libefl;
function efl_text_font_slant_get(obj: PEo): TEfl_Text_Font_Slant; cdecl; external libefl;
procedure efl_text_font_width_set(obj: PEo; width: TEfl_Text_Font_Width); cdecl; external libefl;
function efl_text_font_width_get(obj: PEo): TEfl_Text_Font_Width; cdecl; external libefl;
procedure efl_text_font_lang_set(obj: PEo; lang: pchar); cdecl; external libefl;
function efl_text_font_lang_get(obj: PEo): pchar; cdecl; external libefl;
procedure efl_text_font_bitmap_scalable_set(obj: PEo; scalable: TEfl_Text_Font_Bitmap_Scalable); cdecl; external libefl;
function efl_text_font_bitmap_scalable_get(obj: PEo): TEfl_Text_Font_Bitmap_Scalable; cdecl; external libefl;

// === Konventiert am: 18-5-25 19:36:14 ===


implementation


function EFL_TEXT_FONT_PROPERTIES_INTERFACE: PEfl_Class;
begin
  EFL_TEXT_FONT_PROPERTIES_INTERFACE := efl_text_font_properties_interface_get;
end;


end.
