
{$IFDEF read_interface}

type
  PPangoOTTag = ^TPangoOTTag;
  TPangoOTTag = Tguint32;
  PPangoOTTableType = ^TPangoOTTableType;
  TPangoOTTableType = longint;

const
  PANGO_OT_TABLE_GSUB = 0;
  PANGO_OT_TABLE_GPOS = 1;

type
  TPangoOTGlyph = record
    glyph: Tguint32;
    properties: Tguint;
    cluster: Tguint;
    component: Tgushort;
    ligID: Tgushort;
    internal: Tguint;
  end;
  PPangoOTGlyph = ^TPangoOTGlyph;
  PPPangoOTGlyph = ^PPangoOTGlyph;

  TPangoOTFeatureMap = record
    feature_name: array[0..4] of char;
    property_bit: Tgulong;
  end;
  PPangoOTFeatureMap = ^TPangoOTFeatureMap;

  TPangoOTRulesetDescription = record
    script: TPangoScript;
    language: PPangoLanguage;
    static_gsub_features: PPangoOTFeatureMap;
    n_static_gsub_features: Tguint;
    static_gpos_features: PPangoOTFeatureMap;
    n_static_gpos_features: Tguint;
    other_features: PPangoOTFeatureMap;
    n_other_features: Tguint;
  end;
  PPangoOTRulesetDescription = ^TPangoOTRulesetDescription;

  TPangoOTInfo = record
  end;
  PPangoOTInfo = ^TPangoOTInfo;

  TPangoOTBuffer = record
  end;
  PPangoOTBuffer = ^TPangoOTBuffer;

  TPangoOTRuleset = record
  end;
  PPangoOTRuleset = ^TPangoOTRuleset;

function pango_ot_info_get_type: TGType; cdecl; external libpangoft2;
function pango_ot_ruleset_get_type: TGType; cdecl; external libpangoft2;
function pango_ot_info_get(face: TFT_Face): PPangoOTInfo; cdecl; external libpangoft2;
function pango_ot_info_find_script(info: PPangoOTInfo; table_type: TPangoOTTableType; script_tag: TPangoOTTag; script_index: Pguint): Tgboolean; cdecl; external libpangoft2;
function pango_ot_info_find_language(info: PPangoOTInfo; table_type: TPangoOTTableType; script_index: Tguint; language_tag: TPangoOTTag; language_index: Pguint;
  required_feature_index: Pguint): Tgboolean; cdecl; external libpangoft2;
function pango_ot_info_find_feature(info: PPangoOTInfo; table_type: TPangoOTTableType; feature_tag: TPangoOTTag; script_index: Tguint; language_index: Tguint;
  feature_index: Pguint): Tgboolean; cdecl; external libpangoft2;
function pango_ot_info_list_scripts(info: PPangoOTInfo; table_type: TPangoOTTableType): PPangoOTTag; cdecl; external libpangoft2;
function pango_ot_info_list_languages(info: PPangoOTInfo; table_type: TPangoOTTableType; script_index: Tguint; language_tag: TPangoOTTag): PPangoOTTag; cdecl; external libpangoft2;
function pango_ot_info_list_features(info: PPangoOTInfo; table_type: TPangoOTTableType; tag: TPangoOTTag; script_index: Tguint; language_index: Tguint): PPangoOTTag; cdecl; external libpangoft2;

function pango_ot_buffer_get_type: TGType; cdecl; external libpangoft2;
function pango_ot_buffer_new(font: PPangoFcFont): PPangoOTBuffer; cdecl; external libpangoft2;
procedure pango_ot_buffer_destroy(buffer: PPangoOTBuffer); cdecl; external libpangoft2;
procedure pango_ot_buffer_clear(buffer: PPangoOTBuffer); cdecl; external libpangoft2;
procedure pango_ot_buffer_set_rtl(buffer: PPangoOTBuffer; rtl: Tgboolean); cdecl; external libpangoft2;
procedure pango_ot_buffer_add_glyph(buffer: PPangoOTBuffer; glyph: Tguint; properties: Tguint; cluster: Tguint); cdecl; external libpangoft2;
procedure pango_ot_buffer_get_glyphs(buffer: PPangoOTBuffer; glyphs: PPPangoOTGlyph; n_glyphs: Plongint); cdecl; external libpangoft2;
procedure pango_ot_buffer_output(buffer: PPangoOTBuffer; glyphs: PPangoGlyphString); cdecl; external libpangoft2;
procedure pango_ot_buffer_set_zero_width_marks(buffer: PPangoOTBuffer; zero_width_marks: Tgboolean); cdecl; external libpangoft2;
function pango_ot_ruleset_get_for_description(info: PPangoOTInfo; desc: PPangoOTRulesetDescription): PPangoOTRuleset; cdecl; external libpangoft2;
function pango_ot_ruleset_new(info: PPangoOTInfo): PPangoOTRuleset; cdecl; external libpangoft2;
function pango_ot_ruleset_new_for(info: PPangoOTInfo; script: TPangoScript; language: PPangoLanguage): PPangoOTRuleset; cdecl; external libpangoft2;
function pango_ot_ruleset_new_from_description(info: PPangoOTInfo; desc: PPangoOTRulesetDescription): PPangoOTRuleset; cdecl; external libpangoft2;
procedure pango_ot_ruleset_add_feature(ruleset: PPangoOTRuleset; table_type: TPangoOTTableType; feature_index: Tguint; property_bit: Tgulong); cdecl; external libpangoft2;
function pango_ot_ruleset_maybe_add_feature(ruleset: PPangoOTRuleset; table_type: TPangoOTTableType; feature_tag: TPangoOTTag; property_bit: Tgulong): Tgboolean; cdecl; external libpangoft2;
function pango_ot_ruleset_maybe_add_features(ruleset: PPangoOTRuleset; table_type: TPangoOTTableType; features: PPangoOTFeatureMap; n_features: Tguint): Tguint; cdecl; external libpangoft2;
function pango_ot_ruleset_get_feature_count(ruleset: PPangoOTRuleset; n_gsub_features: Pguint; n_gpos_features: Pguint): Tguint; cdecl; external libpangoft2;
procedure pango_ot_ruleset_substitute(ruleset: PPangoOTRuleset; buffer: PPangoOTBuffer); cdecl; external libpangoft2;
procedure pango_ot_ruleset_position(ruleset: PPangoOTRuleset; buffer: PPangoOTBuffer); cdecl; external libpangoft2;
function pango_ot_tag_to_script(script_tag: TPangoOTTag): TPangoScript; cdecl; external libpangoft2;
function pango_ot_tag_from_script(script: TPangoScript): TPangoOTTag; cdecl; external libpangoft2;
function pango_ot_tag_to_language(language_tag: TPangoOTTag): PPangoLanguage; cdecl; external libpangoft2;
function pango_ot_tag_from_language(language: PPangoLanguage): TPangoOTTag; cdecl; external libpangoft2;
function pango_ot_ruleset_description_get_type: TGType; cdecl; external libpangoft2;
function pango_ot_ruleset_description_hash(desc: PPangoOTRulesetDescription): Tguint; cdecl; external libpangoft2;
function pango_ot_ruleset_description_equal(desc1: PPangoOTRulesetDescription; desc2: PPangoOTRulesetDescription): Tgboolean; cdecl; external libpangoft2;
function pango_ot_ruleset_description_copy(desc: PPangoOTRulesetDescription): PPangoOTRulesetDescription; cdecl; external libpangoft2;
procedure pango_ot_ruleset_description_free(desc: PPangoOTRulesetDescription); cdecl; external libpangoft2;

const
  PANGO_OT_ALL_GLYPHS = Tguint($FFFF);
  PANGO_OT_NO_FEATURE = Tguint($FFFF);
  PANGO_OT_NO_SCRIPT = Tguint($FFFF);
  PANGO_OT_DEFAULT_LANGUAGE = Tguint($FFFF);

function PANGO_OT_TAG_DEFAULT_SCRIPT: uint32;
function PANGO_OT_TAG_DEFAULT_LANGUAGE: uint32;
function PANGO_TYPE_OT_BUFFER: TGType;
function PANGO_TYPE_OT_RULESET_DESCRIPTION: TGType;

// === Konventiert am: 25-11-24 17:35:33 ===

function PANGO_TYPE_OT_INFO: TGType;
function PANGO_OT_INFO(obj: Pointer): PPangoOTInfo;
function PANGO_IS_OT_INFO(obj: Pointer): Tgboolean;

function PANGO_TYPE_OT_RULESET: TGType;
function PANGO_OT_RULESET(obj: Pointer): PPangoOTRuleset;
function PANGO_IS_OT_RULESET(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_OT_INFO: TGType;
begin
  PANGO_TYPE_OT_INFO := pango_ot_info_get_type;
end;

function PANGO_OT_INFO(obj: Pointer): PPangoOTInfo;
begin
  Result := PPangoOTInfo(g_type_check_instance_cast(obj, PANGO_TYPE_OT_INFO));
end;

function PANGO_IS_OT_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_OT_INFO);
end;

// ====

function PANGO_TYPE_OT_RULESET: TGType;
begin
  PANGO_TYPE_OT_RULESET := pango_ot_ruleset_get_type;
end;

function PANGO_OT_RULESET(obj: Pointer): PPangoOTRuleset;
begin
  Result := PPangoOTRuleset(g_type_check_instance_cast(obj, PANGO_TYPE_OT_RULESET));
end;

function PANGO_IS_OT_RULESET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_OT_RULESET);
end;

// ====

function PANGO_OT_TAG_DEFAULT_SCRIPT: uint32;
begin
  //  PANGO_OT_TAG_DEFAULT_SCRIPT := PANGO_OT_TAG_MAKE('D', 'F', 'L', 'T');
  Result := $44464C54;
end;

function PANGO_OT_TAG_DEFAULT_LANGUAGE: uint32;
begin
  //  PANGO_OT_TAG_DEFAULT_LANGUAGE := PANGO_OT_TAG_MAKE('d', 'f', 'l', 't');
  Result := $64666C74;
end;

function PANGO_TYPE_OT_BUFFER: TGType;
begin
  PANGO_TYPE_OT_BUFFER := pango_ot_buffer_get_type;
end;

function PANGO_TYPE_OT_RULESET_DESCRIPTION: TGType;
begin
  PANGO_TYPE_OT_RULESET_DESCRIPTION := pango_ot_ruleset_description_get_type;
end;


{$ENDIF read_implementation}
