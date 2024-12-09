
{$IFDEF read_interface}

type
  TPangoCairoShapeRendererFunc = procedure(cr: Pcairo_t; attr: PPangoAttrShape; do_path: Tgboolean; Data: Tgpointer); cdecl;

  TPangoCairoFontMap = record
  end;
  PPangoCairoFontMap = ^TPangoCairoFontMap;

  TPangoCairoFont = record
  end;
  PPangoCairoFont = ^TPangoCairoFont;

function pango_cairo_font_map_get_type: TGType; cdecl; external libpangocairo;
function pango_cairo_font_map_new: PPangoFontMap; cdecl; external libpangocairo;
function pango_cairo_font_map_new_for_font_type(fonttype: Tcairo_font_type_t): PPangoFontMap; cdecl; external libpangocairo;
function pango_cairo_font_map_get_default: PPangoFontMap; cdecl; external libpangocairo;
procedure pango_cairo_font_map_set_default(fontmap: PPangoCairoFontMap); cdecl; external libpangocairo;
function pango_cairo_font_map_get_font_type(fontmap: PPangoCairoFontMap): Tcairo_font_type_t; cdecl; external libpangocairo;
procedure pango_cairo_font_map_set_resolution(fontmap: PPangoCairoFontMap; dpi: Tdouble); cdecl; external libpangocairo;
function pango_cairo_font_map_get_resolution(fontmap: PPangoCairoFontMap): Tdouble; cdecl; external libpangocairo;
function pango_cairo_font_map_create_context(fontmap: PPangoCairoFontMap): PPangoContext; cdecl; external libpangocairo;
function pango_cairo_font_get_type: TGType; cdecl; external libpangocairo;
function pango_cairo_font_get_scaled_font(font: PPangoCairoFont): Pcairo_scaled_font_t; cdecl; external libpangocairo;
procedure pango_cairo_update_context(cr: Pcairo_t; context: PPangoContext); cdecl; external libpangocairo;
procedure pango_cairo_context_set_font_options(context: PPangoContext; options: Pcairo_font_options_t); cdecl; external libpangocairo;
function pango_cairo_context_get_font_options(context: PPangoContext): Pcairo_font_options_t; cdecl; external libpangocairo;
procedure pango_cairo_context_set_resolution(context: PPangoContext; dpi: Tdouble); cdecl; external libpangocairo;
function pango_cairo_context_get_resolution(context: PPangoContext): Tdouble; cdecl; external libpangocairo;
procedure pango_cairo_context_set_shape_renderer(context: PPangoContext; func: TPangoCairoShapeRendererFunc; Data: Tgpointer; dnotify: TGDestroyNotify); cdecl; external libpangocairo;
function pango_cairo_context_get_shape_renderer(context: PPangoContext; Data: Pgpointer): TPangoCairoShapeRendererFunc; cdecl; external libpangocairo;
function pango_cairo_create_context(cr: Pcairo_t): PPangoContext; cdecl; external libpangocairo;
function pango_cairo_create_layout(cr: Pcairo_t): PPangoLayout; cdecl; external libpangocairo;
procedure pango_cairo_update_layout(cr: Pcairo_t; layout: PPangoLayout); cdecl; external libpangocairo;
procedure pango_cairo_show_glyph_string(cr: Pcairo_t; font: PPangoFont; glyphs: PPangoGlyphString); cdecl; external libpangocairo;
procedure pango_cairo_show_glyph_item(cr: Pcairo_t; Text: pchar; glyph_item: PPangoGlyphItem); cdecl; external libpangocairo;
procedure pango_cairo_show_layout_line(cr: Pcairo_t; line: PPangoLayoutLine); cdecl; external libpangocairo;
procedure pango_cairo_show_layout(cr: Pcairo_t; layout: PPangoLayout); cdecl; external libpangocairo;
procedure pango_cairo_show_error_underline(cr: Pcairo_t; x: Tdouble; y: Tdouble; Width: Tdouble; Height: Tdouble); cdecl; external libpangocairo;
procedure pango_cairo_glyph_string_path(cr: Pcairo_t; font: PPangoFont; glyphs: PPangoGlyphString); cdecl; external libpangocairo;
procedure pango_cairo_layout_line_path(cr: Pcairo_t; line: PPangoLayoutLine); cdecl; external libpangocairo;
procedure pango_cairo_layout_path(cr: Pcairo_t; layout: PPangoLayout); cdecl; external libpangocairo;
procedure pango_cairo_error_underline_path(cr: Pcairo_t; x: Tdouble; y: Tdouble; Width: Tdouble; Height: Tdouble); cdecl; external libpangocairo;

// === Konventiert am: 25-11-24 19:41:47 ===

function PANGO_TYPE_CAIRO_FONT: TGType;
function PANGO_CAIRO_FONT(obj: Pointer): PPangoCairoFont;
function PANGO_IS_CAIRO_FONT(obj: Pointer): Tgboolean;

function PANGO_TYPE_CAIRO_FONT_MAP: TGType;
function PANGO_CAIRO_FONT_MAP(obj: Pointer): PPangoCairoFontMap;
function PANGO_IS_CAIRO_FONT_MAP(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_CAIRO_FONT: TGType;
begin
  PANGO_TYPE_CAIRO_FONT := pango_cairo_font_get_type;
end;

function PANGO_CAIRO_FONT(obj: Pointer): PPangoCairoFont;
begin
  Result := PPangoCairoFont(g_type_check_instance_cast(obj, PANGO_TYPE_CAIRO_FONT));
end;

function PANGO_IS_CAIRO_FONT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_CAIRO_FONT);
end;

// ====

function PANGO_TYPE_CAIRO_FONT_MAP: TGType;
begin
  PANGO_TYPE_CAIRO_FONT_MAP := pango_cairo_font_map_get_type;
end;

function PANGO_CAIRO_FONT_MAP(obj: Pointer): PPangoCairoFontMap;
begin
  Result := PPangoCairoFontMap(g_type_check_instance_cast(obj, PANGO_TYPE_CAIRO_FONT_MAP));
end;

function PANGO_IS_CAIRO_FONT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_CAIRO_FONT_MAP);
end;


{$ENDIF read_implementation}
