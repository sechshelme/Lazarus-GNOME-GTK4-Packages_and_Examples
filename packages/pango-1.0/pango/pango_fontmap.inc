
{$IFDEF read_interface}

type
  TPangoFontMapClass = record
    parent_class: TGObjectClass;
    load_font: function(fontmap: PPangoFontMap; context: PPangoContext; desc: PPangoFontDescription): PPangoFont; cdecl;
    list_families: procedure(fontmap: PPangoFontMap; families: PPPPangoFontFamily; n_families: Plongint); cdecl;
    load_fontset: function(fontmap: PPangoFontMap; context: PPangoContext; desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl;
    shape_engine_type: pchar;
    get_serial: function(fontmap: PPangoFontMap): Tguint; cdecl;
    changed: procedure(fontmap: PPangoFontMap); cdecl;
    get_family: function(fontmap: PPangoFontMap; Name: pchar): PPangoFontFamily; cdecl;
    get_face: function(fontmap: PPangoFontMap; font: PPangoFont): PPangoFontFace; cdecl;
  end;
  PPangoFontMapClass = ^TPangoFontMapClass;

function pango_font_map_get_type: TGType; cdecl; external libpango;
function pango_font_map_create_context(fontmap: PPangoFontMap): PPangoContext; cdecl; external libpango;
function pango_font_map_load_font(fontmap: PPangoFontMap; context: PPangoContext; desc: PPangoFontDescription): PPangoFont; cdecl; external libpango;
function pango_font_map_load_fontset(fontmap: PPangoFontMap; context: PPangoContext; desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl; external libpango;
procedure pango_font_map_list_families(fontmap: PPangoFontMap; families: PPPPangoFontFamily; n_families: Plongint); cdecl; external libpango;
function pango_font_map_get_serial(fontmap: PPangoFontMap): Tguint; cdecl; external libpango;
procedure pango_font_map_changed(fontmap: PPangoFontMap); cdecl; external libpango;
function pango_font_map_get_family(fontmap: PPangoFontMap; Name: pchar): PPangoFontFamily; cdecl; external libpango;
function pango_font_map_reload_font(fontmap: PPangoFontMap; font: PPangoFont; scale: Tdouble; context: PPangoContext; variations: pchar): PPangoFont; cdecl; external libpango;

// === Konventiert am: 23-11-24 19:08:02 ===

function PANGO_TYPE_FONT_MAP: TGType;
function PANGO_FONT_MAP(obj: Pointer): PPangoFontMap;
function PANGO_FONT_MAP_CLASS(klass: Pointer): PPangoFontMapClass;
function PANGO_IS_FONT_MAP(obj: Pointer): Tgboolean;
function PANGO_IS_FONT_MAP_CLASS(klass: Pointer): Tgboolean;
function PANGO_FONT_MAP_GET_CLASS(obj: Pointer): PPangoFontMapClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FONT_MAP: TGType;
begin
  PANGO_TYPE_FONT_MAP := pango_font_map_get_type;
end;

function PANGO_FONT_MAP(obj: Pointer): PPangoFontMap;
begin
  Result := PPangoFontMap(g_type_check_instance_cast(obj, PANGO_TYPE_FONT_MAP));
end;

function PANGO_FONT_MAP_CLASS(klass: Pointer): PPangoFontMapClass;
begin
  Result := PPangoFontMapClass(g_type_check_class_cast(klass, PANGO_TYPE_FONT_MAP));
end;

function PANGO_IS_FONT_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FONT_MAP);
end;

function PANGO_IS_FONT_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_FONT_MAP);
end;

function PANGO_FONT_MAP_GET_CLASS(obj: Pointer): PPangoFontMapClass;
begin
  Result := PPangoFontMapClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
