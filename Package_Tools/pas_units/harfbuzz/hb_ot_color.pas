unit hb_ot_color;

interface

uses
  fp_glib2, hb_common, hb_ot_name, hb_blob;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function hb_ot_color_has_palettes(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_color_palette_get_count(face: Phb_face_t): dword; cdecl; external libharfbuzz;
function hb_ot_color_palette_get_name_id(face: Phb_face_t; palette_index: dword): Thb_ot_name_id_t; cdecl; external libharfbuzz;
function hb_ot_color_palette_color_get_name_id(face: Phb_face_t; color_index: dword): Thb_ot_name_id_t; cdecl; external libharfbuzz;

type
  Phb_ot_color_palette_flags_t = ^Thb_ot_color_palette_flags_t;
  Thb_ot_color_palette_flags_t = longint;

const
  HB_OT_COLOR_PALETTE_FLAG_DEFAULT = $00000000;
  HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_LIGHT_BACKGROUND = $00000001;
  HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_DARK_BACKGROUND = $00000002;

function hb_ot_color_palette_get_flags(face: Phb_face_t; palette_index: dword): Thb_ot_color_palette_flags_t; cdecl; external libharfbuzz;
function hb_ot_color_palette_get_colors(face: Phb_face_t; palette_index: dword; start_offset: dword; color_count: Pdword; colors: Phb_color_t): dword; cdecl; external libharfbuzz;
function hb_ot_color_has_layers(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Thb_ot_color_layer_t = record
    glyph: Thb_codepoint_t;
    color_index: dword;
  end;
  Phb_ot_color_layer_t = ^Thb_ot_color_layer_t;

function hb_ot_color_glyph_get_layers(face: Phb_face_t; glyph: Thb_codepoint_t; start_offset: dword; layer_count: Pdword; layers: Phb_ot_color_layer_t): dword; cdecl; external libharfbuzz;
function hb_ot_color_has_paint(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_color_glyph_has_paint(face: Phb_face_t; glyph: Thb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_color_has_svg(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_color_glyph_reference_svg(face: Phb_face_t; glyph: Thb_codepoint_t): Phb_blob_t; cdecl; external libharfbuzz;
function hb_ot_color_has_png(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_color_glyph_reference_png(font: Phb_font_t; glyph: Thb_codepoint_t): Phb_blob_t; cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 14:56:41 ===


implementation



end.
