
{$IFDEF read_interface}

const
  PANGO_RENDER_TYPE_FT2 = 'PangoRenderFT2';

type
  TPangoFT2SubstituteFunc = procedure(pattern: PFcPattern; Data: Tgpointer); cdecl;

  TPangoFT2FontMap = record
  end;
  PPangoFT2FontMap = ^TPangoFT2FontMap;

procedure pango_ft2_render(bitmap: PFT_Bitmap; font: PPangoFont; glyphs: PPangoGlyphString; x: Tgint; y: Tgint); cdecl; external libpangoft2;
procedure pango_ft2_render_transformed(bitmap: PFT_Bitmap; matrix: PPangoMatrix; font: PPangoFont; glyphs: PPangoGlyphString; x: longint; y: longint); cdecl; external libpangoft2;
procedure pango_ft2_render_layout_line(bitmap: PFT_Bitmap; line: PPangoLayoutLine; x: longint; y: longint); cdecl; external libpangoft2;
procedure pango_ft2_render_layout_line_subpixel(bitmap: PFT_Bitmap; line: PPangoLayoutLine; x: longint; y: longint); cdecl; external libpangoft2;
procedure pango_ft2_render_layout(bitmap: PFT_Bitmap; layout: PPangoLayout; x: longint; y: longint); cdecl; external libpangoft2;
procedure pango_ft2_render_layout_subpixel(bitmap: PFT_Bitmap; layout: PPangoLayout; x: longint; y: longint); cdecl; external libpangoft2;
function pango_ft2_font_map_get_type: TGType; cdecl; external libpangoft2;
function pango_ft2_font_map_new: PPangoFontMap; cdecl; external libpangoft2;
procedure pango_ft2_font_map_set_resolution(fontmap: PPangoFT2FontMap; dpi_x: Tdouble; dpi_y: Tdouble); cdecl; external libpangoft2;
procedure pango_ft2_font_map_set_default_substitute(fontmap: PPangoFT2FontMap; func: TPangoFT2SubstituteFunc; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_48_FOR(pango_fc_font_map_set_default_substitute)';
procedure pango_ft2_font_map_substitute_changed(fontmap: PPangoFT2FontMap); cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_48_FOR(pango_fc_font_map_substitute_changed)';
function pango_ft2_font_map_create_context(fontmap: PPangoFT2FontMap): PPangoContext; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_22_FOR(pango_font_map_create_context)';
function pango_ft2_get_context(dpi_x: Tdouble; dpi_y: Tdouble): PPangoContext; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(pango_font_map_create_context)';
function pango_ft2_font_map_for_display: PPangoFontMap; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(pango_ft2_font_map_new)';
procedure pango_ft2_shutdown_display; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED';
function pango_ft2_get_unknown_glyph(font: PPangoFont): TPangoGlyph; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(PANGO_GET_UNKNOWN_GLYPH)';
function pango_ft2_font_get_kerning(font: PPangoFont; left: TPangoGlyph; right: TPangoGlyph): longint; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(pango_fc_font_kern_glyphs)';
function pango_ft2_font_get_face(font: PPangoFont): TFT_Face; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(pango_fc_font_lock_face)';
function pango_ft2_font_get_coverage(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_FOR(pango_font_get_coverage)';

// === Konventiert am: 25-11-24 19:28:20 ===

function PANGO_TYPE_FT2_FONT_MAP: TGType;
function PANGO_FT2_FONT_MAP(obj: Pointer): PPangoFT2FontMap;
function PANGO_FT2_IS_FONT_MAP(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FT2_FONT_MAP: TGType;
begin
  PANGO_TYPE_FT2_FONT_MAP := pango_ft2_font_map_get_type;
end;

function PANGO_FT2_FONT_MAP(obj: Pointer): PPangoFT2FontMap;
begin
  Result := PPangoFT2FontMap(g_type_check_instance_cast(obj, PANGO_TYPE_FT2_FONT_MAP));
end;

function PANGO_FT2_IS_FONT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FT2_FONT_MAP);
end;



{$ENDIF read_implementation}
