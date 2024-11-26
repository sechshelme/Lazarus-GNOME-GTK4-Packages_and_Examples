/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 26-11-2024   16:54                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  PANGO_RENDER_TYPE_XFT = 'PangoRenderXft';

type
  TPangoXftSubstituteFunc = procedure(pattern: PFcPattern; Data: Tgpointer); cdecl;

  TPangoXftFontMap = record
  end;
  PPangoXftFontMap = ^TPangoXftFontMap;

  TPangoXftFont = record
  end;
  PPangoXftFont = ^TPangoXftFont;

function pango_xft_get_font_map(display: PDisplay; screen: longint): PPangoFontMap; cdecl; external libpangoxft;
function pango_xft_get_context(display: PDisplay; screen: longint): PPangoContext; cdecl; external libpangoxft;
procedure pango_xft_shutdown_display(display: PDisplay; screen: longint); cdecl; external libpangoxft;
procedure pango_xft_set_default_substitute(display: PDisplay; screen: longint; func: TPangoXftSubstituteFunc; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libpangoxft;
procedure pango_xft_substitute_changed(display: PDisplay; screen: longint); cdecl; external libpangoxft;

function pango_xft_font_map_get_type: TGType; cdecl; external libpangoxft;
function pango_xft_font_get_type: TGType; cdecl; external libpangoxft;

function pango_xft_font_get_font(font: PPangoFont): PXftFont; cdecl; external libpangoxft;
function pango_xft_font_get_display(font: PPangoFont): PDisplay; cdecl; external libpangoxft;
function pango_xft_font_lock_face(font: PPangoFont): TFT_Face; cdecl; external libpangoxft;
procedure pango_xft_font_unlock_face(font: PPangoFont); cdecl; external libpangoxft;
function pango_xft_font_get_glyph(font: PPangoFont; wc: Tgunichar): Tguint; cdecl; external libpangoxft;
function pango_xft_font_has_char(font: PPangoFont; wc: Tgunichar): Tgboolean; cdecl; external libpangoxft;
function pango_xft_font_get_unknown_glyph(font: PPangoFont; wc: Tgunichar): TPangoGlyph; cdecl; external libpangoxft;

// === Konventiert am: 26-11-24 13:57:44 ===

function PANGO_TYPE_XFT_FONT_MAP: TGType;
function PANGO_XFT_FONT_MAP(obj: Pointer): PPangoXftFontMap;
function PANGO_XFT_IS_FONT_MAP(obj: Pointer): Tgboolean;

function PANGO_TYPE_XFT_FONT: TGType;
function PANGO_XFT_FONT(obj: Pointer): PPangoXftFont;
function PANGO_XFT_IS_FONT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_XFT_FONT_MAP: TGType;
begin
  PANGO_TYPE_XFT_FONT_MAP := pango_xft_font_map_get_type;
end;

function PANGO_XFT_FONT_MAP(obj: Pointer): PPangoXftFontMap;
begin
  Result := PPangoXftFontMap(g_type_check_instance_cast(obj, PANGO_TYPE_XFT_FONT_MAP));
end;

function PANGO_XFT_IS_FONT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_XFT_FONT_MAP);
end;

// ====

function PANGO_TYPE_XFT_FONT: TGType;
begin
  PANGO_TYPE_XFT_FONT := pango_xft_font_get_type;
end;

function PANGO_XFT_FONT(obj: Pointer): PPangoXftFont;
begin
  Result := PPangoXftFont(g_type_check_instance_cast(obj, PANGO_TYPE_XFT_FONT));
end;

function PANGO_XFT_IS_FONT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_XFT_FONT);
end;


{$ENDIF read_implementation}
