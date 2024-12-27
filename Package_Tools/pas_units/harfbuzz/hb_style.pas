unit hb_style;

interface

uses
  fp_glib2, hb_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Phb_style_tag_t = ^Thb_style_tag_t;
  Thb_style_tag_t = longint;

const
  HB_STYLE_TAG_ITALIC = (Ord('i') shl 24) or (Ord('t') shl 16) or (Ord('a') shl 8) or Ord('l');
  HB_STYLE_TAG_OPTICAL_SIZE = (Ord('o') shl 24) or (Ord('p') shl 16) or (Ord('s') shl 8) or Ord('z');
  HB_STYLE_TAG_SLANT_ANGLE = (Ord('s') shl 24) or (Ord('l') shl 16) or (Ord('n') shl 8) or Ord('t');
  HB_STYLE_TAG_SLANT_RATIO = (Ord('S') shl 24) or (Ord('l') shl 16) or (Ord('n') shl 8) or Ord('t');
  HB_STYLE_TAG_WIDTH = (Ord('w') shl 24) or (Ord('d') shl 16) or (Ord('t') shl 8) or Ord('h');
  HB_STYLE_TAG_WEIGHT = (Ord('w') shl 24) or (Ord('g') shl 16) or (Ord('h') shl 8) or Ord('t');
  _HB_STYLE_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED;


function hb_style_get_value(font: Phb_font_t; style_tag: Thb_style_tag_t): single; cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:07:22 ===


implementation



end.
