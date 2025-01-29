unit chafa_symbol_map;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CHAFA_SYMBOL_WIDTH_PIXELS = 8;
  CHAFA_SYMBOL_HEIGHT_PIXELS = 8;

type
  PChafaSymbolTags = ^TChafaSymbolTags;
  TChafaSymbolTags = longint;

const
  CHAFA_SYMBOL_TAG_NONE = 0;
  CHAFA_SYMBOL_TAG_SPACE = 1 shl 0;
  CHAFA_SYMBOL_TAG_SOLID = 1 shl 1;
  CHAFA_SYMBOL_TAG_STIPPLE = 1 shl 2;
  CHAFA_SYMBOL_TAG_BLOCK = 1 shl 3;
  CHAFA_SYMBOL_TAG_BORDER = 1 shl 4;
  CHAFA_SYMBOL_TAG_DIAGONAL = 1 shl 5;
  CHAFA_SYMBOL_TAG_DOT = 1 shl 6;
  CHAFA_SYMBOL_TAG_QUAD = 1 shl 7;
  CHAFA_SYMBOL_TAG_HHALF = 1 shl 8;
  CHAFA_SYMBOL_TAG_VHALF = 1 shl 9;
  CHAFA_SYMBOL_TAG_HALF = CHAFA_SYMBOL_TAG_HHALF or CHAFA_SYMBOL_TAG_VHALF;
  CHAFA_SYMBOL_TAG_INVERTED = 1 shl 10;
  CHAFA_SYMBOL_TAG_BRAILLE = 1 shl 11;
  CHAFA_SYMBOL_TAG_TECHNICAL = 1 shl 12;
  CHAFA_SYMBOL_TAG_GEOMETRIC = 1 shl 13;
  CHAFA_SYMBOL_TAG_ASCII = 1 shl 14;
  CHAFA_SYMBOL_TAG_ALPHA = 1 shl 15;
  CHAFA_SYMBOL_TAG_DIGIT = 1 shl 16;
  CHAFA_SYMBOL_TAG_ALNUM = CHAFA_SYMBOL_TAG_ALPHA or CHAFA_SYMBOL_TAG_DIGIT;
  CHAFA_SYMBOL_TAG_NARROW = 1 shl 17;
  CHAFA_SYMBOL_TAG_WIDE = 1 shl 18;
  CHAFA_SYMBOL_TAG_AMBIGUOUS = 1 shl 19;
  CHAFA_SYMBOL_TAG_UGLY = 1 shl 20;
  CHAFA_SYMBOL_TAG_LEGACY = 1 shl 21;
  CHAFA_SYMBOL_TAG_SEXTANT = 1 shl 22;
  CHAFA_SYMBOL_TAG_WEDGE = 1 shl 23;
  CHAFA_SYMBOL_TAG_LATIN = 1 shl 24;
  CHAFA_SYMBOL_TAG_IMPORTED = 1 shl 25;
  CHAFA_SYMBOL_TAG_EXTRA = 1 shl 30;
  CHAFA_SYMBOL_TAG_BAD = CHAFA_SYMBOL_TAG_AMBIGUOUS or CHAFA_SYMBOL_TAG_UGLY;
  CHAFA_SYMBOL_TAG_ALL = not (CHAFA_SYMBOL_TAG_EXTRA or CHAFA_SYMBOL_TAG_BAD);

type
  TChafaSymbolMap = record
  end;
  PChafaSymbolMap = ^TChafaSymbolMap;

function chafa_symbol_map_new: PChafaSymbolMap; cdecl; external libchafa;
function chafa_symbol_map_copy(symbol_map: PChafaSymbolMap): PChafaSymbolMap; cdecl; external libchafa;
procedure chafa_symbol_map_ref(symbol_map: PChafaSymbolMap); cdecl; external libchafa;
procedure chafa_symbol_map_unref(symbol_map: PChafaSymbolMap); cdecl; external libchafa;
procedure chafa_symbol_map_add_by_tags(symbol_map: PChafaSymbolMap; tags: TChafaSymbolTags); cdecl; external libchafa;
procedure chafa_symbol_map_remove_by_tags(symbol_map: PChafaSymbolMap; tags: TChafaSymbolTags); cdecl; external libchafa;
procedure chafa_symbol_map_add_by_range(symbol_map: PChafaSymbolMap; First: Tgunichar; last: Tgunichar); cdecl; external libchafa;
procedure chafa_symbol_map_remove_by_range(symbol_map: PChafaSymbolMap; First: Tgunichar; last: Tgunichar); cdecl; external libchafa;
function chafa_symbol_map_apply_selectors(symbol_map: PChafaSymbolMap; selectors: Pgchar; error: PPGError): Tgboolean; cdecl; external libchafa;
function chafa_symbol_map_get_allow_builtin_glyphs(symbol_map: PChafaSymbolMap): Tgboolean; cdecl; external libchafa;
procedure chafa_symbol_map_set_allow_builtin_glyphs(symbol_map: PChafaSymbolMap; use_builtin_glyphs: Tgboolean); cdecl; external libchafa;
procedure chafa_symbol_map_add_glyph(symbol_map: PChafaSymbolMap; code_point: Tgunichar; pixel_format: TChafaPixelType; pixels: Tgpointer; Width: Tgint;
  Height: Tgint; rowstride: Tgint); cdecl; external libchafa;
function chafa_symbol_map_get_glyph(symbol_map: PChafaSymbolMap; code_point: Tgunichar; pixel_format: TChafaPixelType; pixels_out: Pgpointer; width_out: Pgint;
  height_out: Pgint; rowstride_out: Pgint): Tgboolean; cdecl; external libchafa;

// === Konventiert am: 29-1-25 17:37:52 ===


implementation



end.
