
{$IFDEF read_interface}

type
  PPangoStyle = ^TPangoStyle;
  TPangoStyle = longint;

const
  PANGO_STYLE_NORMAL = 0;
  PANGO_STYLE_OBLIQUE = 1;
  PANGO_STYLE_ITALIC = 2;

type
  PPangoVariant = ^TPangoVariant;
  TPangoVariant = longint;

const
  PANGO_VARIANT_NORMAL = 0;
  PANGO_VARIANT_SMALL_CAPS = 1;
  PANGO_VARIANT_ALL_SMALL_CAPS = 2;
  PANGO_VARIANT_PETITE_CAPS = 3;
  PANGO_VARIANT_ALL_PETITE_CAPS = 4;
  PANGO_VARIANT_UNICASE = 5;
  PANGO_VARIANT_TITLE_CAPS = 6;

type
  PPangoWeight = ^TPangoWeight;
  TPangoWeight = longint;

const
  PANGO_WEIGHT_THIN = 100;
  PANGO_WEIGHT_ULTRALIGHT = 200;
  PANGO_WEIGHT_LIGHT = 300;
  PANGO_WEIGHT_SEMILIGHT = 350;
  PANGO_WEIGHT_BOOK = 380;
  PANGO_WEIGHT_NORMAL = 400;
  PANGO_WEIGHT_MEDIUM = 500;
  PANGO_WEIGHT_SEMIBOLD = 600;
  PANGO_WEIGHT_BOLD = 700;
  PANGO_WEIGHT_ULTRABOLD = 800;
  PANGO_WEIGHT_HEAVY = 900;
  PANGO_WEIGHT_ULTRAHEAVY = 1000;

type
  PPangoStretch = ^TPangoStretch;
  TPangoStretch = longint;

const
  PANGO_STRETCH_ULTRA_CONDENSED = 0;
  PANGO_STRETCH_EXTRA_CONDENSED = 1;
  PANGO_STRETCH_CONDENSED = 2;
  PANGO_STRETCH_SEMI_CONDENSED = 3;
  PANGO_STRETCH_NORMAL = 4;
  PANGO_STRETCH_SEMI_EXPANDED = 5;
  PANGO_STRETCH_EXPANDED = 6;
  PANGO_STRETCH_EXTRA_EXPANDED = 7;
  PANGO_STRETCH_ULTRA_EXPANDED = 8;

type
  PPangoFontMask = ^TPangoFontMask;
  TPangoFontMask = longint;

const
  PANGO_FONT_MASK_FAMILY = 1 shl 0;
  PANGO_FONT_MASK_STYLE = 1 shl 1;
  PANGO_FONT_MASK_VARIANT = 1 shl 2;
  PANGO_FONT_MASK_WEIGHT = 1 shl 3;
  PANGO_FONT_MASK_STRETCH = 1 shl 4;
  PANGO_FONT_MASK_SIZE = 1 shl 5;
  PANGO_FONT_MASK_GRAVITY = 1 shl 6;
  PANGO_FONT_MASK_VARIATIONS = 1 shl 7;

function pango_font_description_get_type: TGType; cdecl; external libpango;
function pango_font_description_new: PPangoFontDescription; cdecl; external libpango;
function pango_font_description_copy(desc: PPangoFontDescription): PPangoFontDescription; cdecl; external libpango;
function pango_font_description_copy_static(desc: PPangoFontDescription): PPangoFontDescription; cdecl; external libpango;
function pango_font_description_hash(desc: PPangoFontDescription): Tguint; cdecl; external libpango;
function pango_font_description_equal(desc1: PPangoFontDescription; desc2: PPangoFontDescription): Tgboolean; cdecl; external libpango;
procedure pango_font_description_free(desc: PPangoFontDescription); cdecl; external libpango;
procedure pango_font_descriptions_free(descs: PPPangoFontDescription; n_descs: longint); cdecl; external libpango;
procedure pango_font_description_set_family(desc: PPangoFontDescription; family: pchar); cdecl; external libpango;
procedure pango_font_description_set_family_static(desc: PPangoFontDescription; family: pchar); cdecl; external libpango;
function pango_font_description_get_family(desc: PPangoFontDescription): pchar; cdecl; external libpango;
procedure pango_font_description_set_style(desc: PPangoFontDescription; style: TPangoStyle); cdecl; external libpango;
function pango_font_description_get_style(desc: PPangoFontDescription): TPangoStyle; cdecl; external libpango;
procedure pango_font_description_set_variant(desc: PPangoFontDescription; variant: TPangoVariant); cdecl; external libpango;
function pango_font_description_get_variant(desc: PPangoFontDescription): TPangoVariant; cdecl; external libpango;
procedure pango_font_description_set_weight(desc: PPangoFontDescription; weight: TPangoWeight); cdecl; external libpango;
function pango_font_description_get_weight(desc: PPangoFontDescription): TPangoWeight; cdecl; external libpango;
procedure pango_font_description_set_stretch(desc: PPangoFontDescription; stretch: TPangoStretch); cdecl; external libpango;
function pango_font_description_get_stretch(desc: PPangoFontDescription): TPangoStretch; cdecl; external libpango;
procedure pango_font_description_set_size(desc: PPangoFontDescription; size: Tgint); cdecl; external libpango;
function pango_font_description_get_size(desc: PPangoFontDescription): Tgint; cdecl; external libpango;
procedure pango_font_description_set_absolute_size(desc: PPangoFontDescription; size: Tdouble); cdecl; external libpango;
function pango_font_description_get_size_is_absolute(desc: PPangoFontDescription): Tgboolean; cdecl; external libpango;
procedure pango_font_description_set_gravity(desc: PPangoFontDescription; gravity: TPangoGravity); cdecl; external libpango;
function pango_font_description_get_gravity(desc: PPangoFontDescription): TPangoGravity; cdecl; external libpango;
procedure pango_font_description_set_variations_static(desc: PPangoFontDescription; variations: pchar); cdecl; external libpango;
procedure pango_font_description_set_variations(desc: PPangoFontDescription; variations: pchar); cdecl; external libpango;
function pango_font_description_get_variations(desc: PPangoFontDescription): pchar; cdecl; external libpango;
function pango_font_description_get_set_fields(desc: PPangoFontDescription): TPangoFontMask; cdecl; external libpango;
procedure pango_font_description_unset_fields(desc: PPangoFontDescription; to_unset: TPangoFontMask); cdecl; external libpango;
procedure pango_font_description_merge(desc: PPangoFontDescription; desc_to_merge: PPangoFontDescription; replace_existing: Tgboolean); cdecl; external libpango;
procedure pango_font_description_merge_static(desc: PPangoFontDescription; desc_to_merge: PPangoFontDescription; replace_existing: Tgboolean); cdecl; external libpango;
function pango_font_description_better_match(desc: PPangoFontDescription; old_match: PPangoFontDescription; new_match: PPangoFontDescription): Tgboolean; cdecl; external libpango;
function pango_font_description_from_string(str: pchar): PPangoFontDescription; cdecl; external libpango;
function pango_font_description_to_string(desc: PPangoFontDescription): pchar; cdecl; external libpango;
function pango_font_description_to_filename(desc: PPangoFontDescription): pchar; cdecl; external libpango;

function pango_font_metrics_get_type: TGType; cdecl; external libpango;
function pango_font_metrics_ref(metrics: PPangoFontMetrics): PPangoFontMetrics; cdecl; external libpango;
procedure pango_font_metrics_unref(metrics: PPangoFontMetrics); cdecl; external libpango;
function pango_font_metrics_get_ascent(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_descent(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_height(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_approximate_char_width(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_approximate_digit_width(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_underline_position(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_underline_thickness(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_strikethrough_position(metrics: PPangoFontMetrics): longint; cdecl; external libpango;
function pango_font_metrics_get_strikethrough_thickness(metrics: PPangoFontMetrics): longint; cdecl; external libpango;

type
  TPangoFontFamilyClass = record
    parent_class: TGObjectClass;
    list_faces: procedure(family: PPangoFontFamily; faces: PPPPangoFontFace; n_faces: Plongint); cdecl;
    get_name: function(family: PPangoFontFamily): pchar; cdecl;
    is_monospace: function(family: PPangoFontFamily): Tgboolean; cdecl;
    is_variable: function(family: PPangoFontFamily): Tgboolean; cdecl;
    get_face: function(family: PPangoFontFamily; Name: pchar): PPangoFontFace; cdecl;
    _pango_reserved2: procedure; cdecl;
  end;
  PPangoFontFamilyClass = ^TPangoFontFamilyClass;


function pango_font_family_get_type: TGType; cdecl; external libpango;
procedure pango_font_family_list_faces(family: PPangoFontFamily; faces: PPPPangoFontFace; n_faces: Plongint); cdecl; external libpango;
function pango_font_family_get_name(family: PPangoFontFamily): pchar; cdecl; external libpango;
function pango_font_family_is_monospace(family: PPangoFontFamily): Tgboolean; cdecl; external libpango;
function pango_font_family_is_variable(family: PPangoFontFamily): Tgboolean; cdecl; external libpango;
function pango_font_family_get_face(family: PPangoFontFamily; Name: pchar): PPangoFontFace; cdecl; external libpango;

type
  TPangoFontFaceClass = record
    parent_class: TGObjectClass;
    get_face_name: function(face: PPangoFontFace): pchar; cdecl;
    describe: function(face: PPangoFontFace): PPangoFontDescription; cdecl;
    list_sizes: procedure(face: PPangoFontFace; sizes: PPlongint; n_sizes: Plongint); cdecl;
    is_synthesized: function(face: PPangoFontFace): Tgboolean; cdecl;
    get_family: function(face: PPangoFontFace): PPangoFontFamily; cdecl;
    _pango_reserved3: procedure; cdecl;
    _pango_reserved4: procedure; cdecl;
  end;
  PPangoFontFaceClass = ^TPangoFontFaceClass;


function pango_font_face_get_type: TGType; cdecl; external libpango;
function pango_font_face_describe(face: PPangoFontFace): PPangoFontDescription; cdecl; external libpango;
function pango_font_face_get_face_name(face: PPangoFontFace): pchar; cdecl; external libpango;
procedure pango_font_face_list_sizes(face: PPangoFontFace; sizes: PPlongint; n_sizes: Plongint); cdecl; external libpango;
function pango_font_face_is_synthesized(face: PPangoFontFace): Tgboolean; cdecl; external libpango;
function pango_font_face_get_family(face: PPangoFontFace): PPangoFontFamily; cdecl; external libpango;

type
  TPangoFontClass = record
    parent_class: TGObjectClass;
    describe: function(font: PPangoFont): PPangoFontDescription; cdecl;
    get_coverage: function(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl;
    get_glyph_extents: procedure(font: PPangoFont; glyph: TPangoGlyph; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl;
    get_metrics: function(font: PPangoFont; language: PPangoLanguage): PPangoFontMetrics; cdecl;
    get_font_map: function(font: PPangoFont): PPangoFontMap; cdecl;
    describe_absolute: function(font: PPangoFont): PPangoFontDescription; cdecl;
    get_features: procedure(font: PPangoFont; features: Phb_feature_t; len: Tguint; num_features: Pguint); cdecl;
    create_hb_font: function(font: PPangoFont): Phb_font_t; cdecl;
  end;
  PPangoFontClass = ^TPangoFontClass;

function pango_font_get_type: TGType; cdecl; external libpango;
function pango_font_describe(font: PPangoFont): PPangoFontDescription; cdecl; external libpango;
function pango_font_describe_with_absolute_size(font: PPangoFont): PPangoFontDescription; cdecl; external libpango;
function pango_font_get_coverage(font: PPangoFont; language: PPangoLanguage): PPangoCoverage; cdecl; external libpango;
function pango_font_find_shaper(font: PPangoFont; language: PPangoLanguage; ch: Tguint32): PPangoEngineShape; cdecl; external libpango;deprecated; // PANGO_DEPRECATED_IN_1_44
function pango_font_get_metrics(font: PPangoFont; language: PPangoLanguage): PPangoFontMetrics; cdecl; external libpango;
procedure pango_font_get_glyph_extents(font: PPangoFont; glyph: TPangoGlyph; ink_rect: PPangoRectangle; logical_rect: PPangoRectangle); cdecl; external libpango;
function pango_font_get_font_map(font: PPangoFont): PPangoFontMap; cdecl; external libpango;
function pango_font_get_face(font: PPangoFont): PPangoFontFace; cdecl; external libpango;
function pango_font_has_char(font: PPangoFont; wc: Tgunichar): Tgboolean; cdecl; external libpango;
procedure pango_font_get_features(font: PPangoFont; features: Phb_feature_t; len: Tguint; num_features: Pguint); cdecl; external libpango;
function pango_font_get_hb_font(font: PPangoFont): Phb_font_t; cdecl; external libpango;
function pango_font_get_languages(font: PPangoFont): PPPangoLanguage; cdecl; external libpango;
function pango_font_serialize(font: PPangoFont): PGBytes; cdecl; external libpango;
function pango_font_deserialize(context: PPangoContext; bytes: PGBytes; error: PPGError): PPangoFont; cdecl; external libpango;

const
  PANGO_UNKNOWN_GLYPH_WIDTH = 10;
  PANGO_UNKNOWN_GLYPH_HEIGHT = 14;

  PANGO_SCALE_XX_SMALL = Tdouble(0.5787037037037);
  PANGO_SCALE_X_SMALL = Tdouble(0.6944444444444);
  PANGO_SCALE_SMALL = Tdouble(0.8333333333333);
  PANGO_SCALE_MEDIUM = Tdouble(1.0);
  PANGO_SCALE_LARGE = Tdouble(1.2);
  PANGO_SCALE_X_LARGE = Tdouble(1.44);
  PANGO_SCALE_XX_LARGE = Tdouble(1.728);


function PANGO_TYPE_FONT_DESCRIPTION: TGType;
function PANGO_TYPE_FONT_METRICS: TGType;

const
  PANGO_GLYPH_EMPTY = TPangoGlyph($0FFFFFFF);
  PANGO_GLYPH_INVALID_INPUT = TPangoGlyph($FFFFFFFF);
  PANGO_GLYPH_UNKNOWN_FLAG = TPangoGlyph($10000000);

function PANGO_GET_UNKNOWN_GLYPH(wc: longint): longint;

// === Konventiert am: 23-11-24 17:45:10 ===

function PANGO_TYPE_FONT_FAMILY: TGType;
function PANGO_FONT_FAMILY(obj: Pointer): PPangoFontFamily;
function PANGO_FONT_FAMILY_CLASS(klass: Pointer): PPangoFontFamilyClass;
function PANGO_IS_FONT_FAMILY(obj: Pointer): Tgboolean;
function PANGO_IS_FONT_FAMILY_CLASS(klass: Pointer): Tgboolean;
function PANGO_FONT_FAMILY_GET_CLASS(obj: Pointer): PPangoFontFamilyClass;

function PANGO_TYPE_FONT_FACE: TGType;
function PANGO_FONT_FACE(obj: Pointer): PPangoFontFace;
function PANGO_FONT_FACE_CLASS(klass: Pointer): PPangoFontFaceClass;
function PANGO_IS_FONT_FACE(obj: Pointer): Tgboolean;
function PANGO_IS_FONT_FACE_CLASS(klass: Pointer): Tgboolean;
function PANGO_FONT_FACE_GET_CLASS(obj: Pointer): PPangoFontFaceClass;

function PANGO_TYPE_FONT: TGType;
function PANGO_FONT(obj: Pointer): PPangoFont;
function PANGO_FONT_CLASS(klass: Pointer): PPangoFontClass;
function PANGO_IS_FONT(obj: Pointer): Tgboolean;
function PANGO_IS_FONT_CLASS(klass: Pointer): Tgboolean;
function PANGO_FONT_GET_CLASS(obj: Pointer): PPangoFontClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FONT_FAMILY: TGType;
begin
  PANGO_TYPE_FONT_FAMILY := pango_font_family_get_type;
end;

function PANGO_FONT_FAMILY(obj: Pointer): PPangoFontFamily;
begin
  Result := PPangoFontFamily(g_type_check_instance_cast(obj, PANGO_TYPE_FONT_FAMILY));
end;

function PANGO_FONT_FAMILY_CLASS(klass: Pointer): PPangoFontFamilyClass;
begin
  Result := PPangoFontFamilyClass(g_type_check_class_cast(klass, PANGO_TYPE_FONT_FAMILY));
end;

function PANGO_IS_FONT_FAMILY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FONT_FAMILY);
end;

function PANGO_IS_FONT_FAMILY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_FONT_FAMILY);
end;

function PANGO_FONT_FAMILY_GET_CLASS(obj: Pointer): PPangoFontFamilyClass;
begin
  Result := PPangoFontFamilyClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function PANGO_TYPE_FONT_FACE: TGType;
begin
  PANGO_TYPE_FONT_FACE := pango_font_face_get_type;
end;

function PANGO_FONT_FACE(obj: Pointer): PPangoFontFace;
begin
  Result := PPangoFontFace(g_type_check_instance_cast(obj, PANGO_TYPE_FONT_FACE));
end;

function PANGO_FONT_FACE_CLASS(klass: Pointer): PPangoFontFaceClass;
begin
  Result := PPangoFontFaceClass(g_type_check_class_cast(klass, PANGO_TYPE_FONT_FACE));
end;

function PANGO_IS_FONT_FACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FONT_FACE);
end;

function PANGO_IS_FONT_FACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_FONT_FACE);
end;

function PANGO_FONT_FACE_GET_CLASS(obj: Pointer): PPangoFontFaceClass;
begin
  Result := PPangoFontFaceClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function PANGO_TYPE_FONT: TGType;
begin
  PANGO_TYPE_FONT := pango_font_get_type;
end;

function PANGO_FONT(obj: Pointer): PPangoFont;
begin
  Result := PPangoFont(g_type_check_instance_cast(obj, PANGO_TYPE_FONT));
end;

function PANGO_FONT_CLASS(klass: Pointer): PPangoFontClass;
begin
  Result := PPangoFontClass(g_type_check_class_cast(klass, PANGO_TYPE_FONT));
end;

function PANGO_IS_FONT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FONT);
end;

function PANGO_IS_FONT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_FONT);
end;

function PANGO_FONT_GET_CLASS(obj: Pointer): PPangoFontClass;
begin
  Result := PPangoFontClass(PGTypeInstance(obj)^.g_class);
end;

// =====


function PANGO_TYPE_FONT_DESCRIPTION: TGType;
begin
  PANGO_TYPE_FONT_DESCRIPTION := pango_font_description_get_type;
end;

function PANGO_TYPE_FONT_METRICS: TGType;
begin
  PANGO_TYPE_FONT_METRICS := pango_font_metrics_get_type;
end;

function PANGO_GET_UNKNOWN_GLYPH(wc: longint): longint;
begin
  PANGO_GET_UNKNOWN_GLYPH := (TPangoGlyph(wc)) or PANGO_GLYPH_UNKNOWN_FLAG;
end;


{$ENDIF read_implementation}
