unit pangofc_font;

interface

uses
  fp_glib2, pango_types, pango_matrix, pango_glyph;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TPangoFcFont = packed record
    parent_instance: TPangoFont;
    font_pattern: PFcPattern;
    fontmap: PPangoFontMap;
    priv: Tgpointer;
    matrix: TPangoMatrix;
    description: PPangoFontDescription;
    metrics_by_lang: PGSList;
    is_hinted: 0..1;
    is_transformed: 0..1;
  end;
  PPangoFcFont = ^TPangoFcFont;

const
  bm_TPangoFcFont_is_hinted = $1;
  bp_TPangoFcFont_is_hinted = 0;
  bm_TPangoFcFont_is_transformed = $2;
  bp_TPangoFcFont_is_transformed = 1;

function pango_fc_font_get_type: TGType; cdecl; external libpangoft2;
function pango_fc_font_has_char(font: PPangoFcFont; wc: Tgunichar): Tgboolean; cdecl; external libpangoft2;
function pango_fc_font_get_glyph(font: PPangoFcFont; wc: Tgunichar): Tguint; cdecl; external libpangoft2;
function pango_fc_font_get_languages(font: PPangoFcFont): PPPangoLanguage; cdecl; external libpangoft2;
function pango_fc_font_get_pattern(font: PPangoFcFont): PFcPattern; cdecl; external libpangoft2;
function pango_fc_font_get_unknown_glyph(font: PPangoFcFont; wc: Tgunichar): TPangoGlyph; cdecl; external libpangoft2;
procedure pango_fc_font_kern_glyphs(font: PPangoFcFont; glyphs: PPangoGlyphString); cdecl; external libpangoft2;
function pango_fc_font_lock_face(font: PPangoFcFont): TFT_Face; cdecl; external libpangoft2;
procedure pango_fc_font_unlock_face(font: PPangoFcFont); cdecl; external libpangoft2;

// === Konventiert am: 25-11-24 17:45:50 ===

function PANGO_TYPE_FC_FONT: TGType;
function PANGO_FC_FONT(obj: Pointer): PPangoFcFont;
function PANGO_IS_FC_FONT(obj: Pointer): Tgboolean;

implementation

function PANGO_TYPE_FC_FONT: TGType;
begin
  PANGO_TYPE_FC_FONT := pango_fc_font_get_type;
end;

function PANGO_FC_FONT(obj: Pointer): PPangoFcFont;
begin
  Result := PPangoFcFont(g_type_check_instance_cast(obj, PANGO_TYPE_FC_FONT));
end;

function PANGO_IS_FC_FONT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FC_FONT);
end;

end.
