unit hb_ot_metrics;

interface

uses
  fp_glib2, hb_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Phb_ot_metrics_tag_t = ^Thb_ot_metrics_tag_t;
  Thb_ot_metrics_tag_t = longint;

const
  HB_OT_METRICS_TAG_HORIZONTAL_ASCENDER = (Ord('h') shl 24) or (Ord('a') shl 16) or (Ord('s') shl 8) or Ord('c');
  HB_OT_METRICS_TAG_HORIZONTAL_DESCENDER = (Ord('h') shl 24) or (Ord('d') shl 16) or (Ord('s') shl 8) or Ord('c');
  HB_OT_METRICS_TAG_HORIZONTAL_LINE_GAP = (Ord('h') shl 24) or (Ord('l') shl 16) or (Ord('g') shl 8) or Ord('p');
  HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_ASCENT = (Ord('h') shl 24) or (Ord('c') shl 16) or (Ord('l') shl 8) or Ord('a');
  HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_DESCENT = (Ord('h') shl 24) or (Ord('c') shl 16) or (Ord('l') shl 8) or Ord('d');
  HB_OT_METRICS_TAG_VERTICAL_ASCENDER = (Ord('v') shl 24) or (Ord('a') shl 16) or (Ord('s') shl 8) or Ord('c');
  HB_OT_METRICS_TAG_VERTICAL_DESCENDER = (Ord('v') shl 24) or (Ord('d') shl 16) or (Ord('s') shl 8) or Ord('c');
  HB_OT_METRICS_TAG_VERTICAL_LINE_GAP = (Ord('v') shl 24) or (Ord('l') shl 16) or (Ord('g') shl 8) or Ord('p');
  HB_OT_METRICS_TAG_HORIZONTAL_CARET_RISE = (Ord('h') shl 24) or (Ord('c') shl 16) or (Ord('r') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_HORIZONTAL_CARET_RUN = (Ord('h') shl 24) or (Ord('c') shl 16) or (Ord('r') shl 8) or Ord('n');
  HB_OT_METRICS_TAG_HORIZONTAL_CARET_OFFSET = (Ord('h') shl 24) or (Ord('c') shl 16) or (Ord('o') shl 8) or Ord('f');
  HB_OT_METRICS_TAG_VERTICAL_CARET_RISE = (Ord('v') shl 24) or (Ord('c') shl 16) or (Ord('r') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_VERTICAL_CARET_RUN = (Ord('v') shl 24) or (Ord('c') shl 16) or (Ord('r') shl 8) or Ord('n');
  HB_OT_METRICS_TAG_VERTICAL_CARET_OFFSET = (Ord('v') shl 24) or (Ord('c') shl 16) or (Ord('o') shl 8) or Ord('f');
  HB_OT_METRICS_TAG_X_HEIGHT = (Ord('x') shl 24) or (Ord('h') shl 16) or (Ord('g') shl 8) or Ord('t');
  HB_OT_METRICS_TAG_CAP_HEIGHT = (Ord('c') shl 24) or (Ord('p') shl 16) or (Ord('h') shl 8) or Ord('t');
  HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_SIZE = (Ord('s') shl 24) or (Ord('b') shl 16) or (Ord('x') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_SIZE = (Ord('s') shl 24) or (Ord('b') shl 16) or (Ord('y') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_OFFSET = (Ord('s') shl 24) or (Ord('b') shl 16) or (Ord('x') shl 8) or Ord('o');
  HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_OFFSET = (Ord('s') shl 24) or (Ord('b') shl 16) or (Ord('y') shl 8) or Ord('o');
  HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_SIZE = (Ord('s') shl 24) or (Ord('p') shl 16) or (Ord('x') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_SIZE = (Ord('s') shl 24) or (Ord('p') shl 16) or (Ord('y') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_OFFSET = (Ord('s') shl 24) or (Ord('p') shl 16) or (Ord('x') shl 8) or Ord('o');
  HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_OFFSET = (Ord('s') shl 24) or (Ord('p') shl 16) or (Ord('y') shl 8) or Ord('o');
  HB_OT_METRICS_TAG_STRIKEOUT_SIZE = (Ord('s') shl 24) or (Ord('t') shl 16) or (Ord('r') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_STRIKEOUT_OFFSET = (Ord('s') shl 24) or (Ord('t') shl 16) or (Ord('r') shl 8) or Ord('o');
  HB_OT_METRICS_TAG_UNDERLINE_SIZE = (Ord('u') shl 24) or (Ord('n') shl 16) or (Ord('d') shl 8) or Ord('s');
  HB_OT_METRICS_TAG_UNDERLINE_OFFSET = (Ord('u') shl 24) or (Ord('n') shl 16) or (Ord('d') shl 8) or Ord('o');
  _HB_OT_METRICS_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED;

function hb_ot_metrics_get_position(font: Phb_font_t; metrics_tag: Thb_ot_metrics_tag_t; position: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_ot_metrics_get_position_with_fallback(font: Phb_font_t; metrics_tag: Thb_ot_metrics_tag_t; position: Phb_position_t); cdecl; external libharfbuzz;
function hb_ot_metrics_get_variation(font: Phb_font_t; metrics_tag: Thb_ot_metrics_tag_t): single; cdecl; external libharfbuzz;
function hb_ot_metrics_get_x_variation(font: Phb_font_t; metrics_tag: Thb_ot_metrics_tag_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_metrics_get_y_variation(font: Phb_font_t; metrics_tag: Thb_ot_metrics_tag_t): Thb_position_t; cdecl; external libharfbuzz;

// === Konventiert am: 26-12-24 17:22:16 ===


implementation



end.
