
{$IFDEF read_interface}

type
  TPangoFcFontMap = record
  end;
  PPangoFcFontMap = ^TPangoFcFontMap;

function pango_fc_font_map_get_type: TGType; cdecl; external libpangoft2;
procedure pango_fc_font_map_cache_clear(fcfontmap: PPangoFcFontMap); cdecl; external libpangoft2;
procedure pango_fc_font_map_config_changed(fcfontmap: PPangoFcFontMap); cdecl; external libpangoft2;
procedure pango_fc_font_map_set_config(fcfontmap: PPangoFcFontMap; fcconfig: PFcConfig); cdecl; external libpangoft2;
function pango_fc_font_map_get_config(fcfontmap: PPangoFcFontMap): PFcConfig; cdecl; external libpangoft2;

type
  TPangoFcDecoderFindFunc = function(pattern: PFcPattern; user_data: Tgpointer): PPangoFcDecoder; cdecl;
  PPangoFcDecoderFindFunc = ^TPangoFcDecoderFindFunc;

procedure pango_fc_font_map_add_decoder_find_func(fcfontmap: PPangoFcFontMap; findfunc: TPangoFcDecoderFindFunc; user_data: Tgpointer; dnotify: TGDestroyNotify); cdecl; external libpangoft2;
function pango_fc_font_map_find_decoder(fcfontmap: PPangoFcFontMap; pattern: PFcPattern): PPangoFcDecoder; cdecl; external libpangoft2;
function pango_fc_font_description_from_pattern(pattern: PFcPattern; include_size: Tgboolean): PPangoFontDescription; cdecl; external libpangoft2;
function pango_fc_font_map_create_context(fcfontmap: PPangoFcFontMap): PPangoContext; cdecl; external libpangoft2; deprecated 'PANGO_DEPRECATED_IN_1_22_FOR(pango_font_map_create_context)';

procedure pango_fc_font_map_shutdown(fcfontmap: PPangoFcFontMap); cdecl; external libpangoft2;
function pango_fc_font_map_get_hb_face(fcfontmap: PPangoFcFontMap; fcfont: PPangoFcFont): Phb_face_t; cdecl; external libpangoft2;

type
  TPangoFcSubstituteFunc = procedure(pattern: PFcPattern; Data: Tgpointer); cdecl;

procedure pango_fc_font_map_set_default_substitute(fontmap: PPangoFcFontMap; func: TPangoFcSubstituteFunc; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libpangoft2;
procedure pango_fc_font_map_substitute_changed(fontmap: PPangoFcFontMap); cdecl; external libpangoft2;

const
  PANGO_FC_GRAVITY = 'pangogravity';
  PANGO_FC_VERSION = 'pangoversion';
  PANGO_FC_PRGNAME = 'prgname';
  PANGO_FC_FONT_FEATURES = 'fontfeatures';
  PANGO_FC_FONT_VARIATIONS = 'fontvariations';

  // === Konventiert am: 26-11-24 13:23:37 ===

function PANGO_TYPE_FC_FONT_MAP: TGType;
function PANGO_FC_FONT_MAP(obj: Pointer): PPangoFcFontMap;
function PANGO_IS_FC_FONT_MAP(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FC_FONT_MAP: TGType;
begin
  PANGO_TYPE_FC_FONT_MAP := pango_fc_font_map_get_type;
end;

function PANGO_FC_FONT_MAP(obj: Pointer): PPangoFcFontMap;
begin
  Result := PPangoFcFontMap(g_type_check_instance_cast(obj, PANGO_TYPE_FC_FONT_MAP));
end;

function PANGO_IS_FC_FONT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FC_FONT_MAP);
end;



{$ENDIF read_implementation}
