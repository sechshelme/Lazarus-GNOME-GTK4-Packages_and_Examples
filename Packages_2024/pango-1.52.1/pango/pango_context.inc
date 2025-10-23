
{$IFDEF read_interface}

type
  TPangoContext = record
  end;
  PPangoContext = ^TPangoContext;

  TPangoContextClass = record
  end;
  PPangoContextClass = ^TPangoContextClass;

function pango_context_get_type: TGType; cdecl; external libpango;
function pango_context_new: PPangoContext; cdecl; external libpango;
procedure pango_context_changed(context: PPangoContext); cdecl; external libpango;
procedure pango_context_set_font_map(context: PPangoContext; font_map: PPangoFontMap); cdecl; external libpango;
function pango_context_get_font_map(context: PPangoContext): PPangoFontMap; cdecl; external libpango;
function pango_context_get_serial(context: PPangoContext): Tguint; cdecl; external libpango;
procedure pango_context_list_families(context: PPangoContext; families: PPPPangoFontFamily; n_families: Plongint); cdecl; external libpango;
function pango_context_load_font(context: PPangoContext; desc: PPangoFontDescription): PPangoFont; cdecl; external libpango;
function pango_context_load_fontset(context: PPangoContext; desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontset; cdecl; external libpango;
function pango_context_get_metrics(context: PPangoContext; desc: PPangoFontDescription; language: PPangoLanguage): PPangoFontMetrics; cdecl; external libpango;
procedure pango_context_set_font_description(context: PPangoContext; desc: PPangoFontDescription); cdecl; external libpango;
function pango_context_get_font_description(context: PPangoContext): PPangoFontDescription; cdecl; external libpango;
function pango_context_get_language(context: PPangoContext): PPangoLanguage; cdecl; external libpango;
procedure pango_context_set_language(context: PPangoContext; language: PPangoLanguage); cdecl; external libpango;
procedure pango_context_set_base_dir(context: PPangoContext; direction: TPangoDirection); cdecl; external libpango;
function pango_context_get_base_dir(context: PPangoContext): TPangoDirection; cdecl; external libpango;
procedure pango_context_set_base_gravity(context: PPangoContext; gravity: TPangoGravity); cdecl; external libpango;
function pango_context_get_base_gravity(context: PPangoContext): TPangoGravity; cdecl; external libpango;
function pango_context_get_gravity(context: PPangoContext): TPangoGravity; cdecl; external libpango;
procedure pango_context_set_gravity_hint(context: PPangoContext; hint: TPangoGravityHint); cdecl; external libpango;
function pango_context_get_gravity_hint(context: PPangoContext): TPangoGravityHint; cdecl; external libpango;
procedure pango_context_set_matrix(context: PPangoContext; matrix: PPangoMatrix); cdecl; external libpango;
function pango_context_get_matrix(context: PPangoContext): PPangoMatrix; cdecl; external libpango;
procedure pango_context_set_round_glyph_positions(context: PPangoContext; round_positions: Tgboolean); cdecl; external libpango;
function pango_context_get_round_glyph_positions(context: PPangoContext): Tgboolean; cdecl; external libpango;

// === Konventiert am: 23-11-24 19:09:50 ===

function PANGO_TYPE_CONTEXT: TGType;
function PANGO_CONTEXT(obj: Pointer): PPangoContext;
function PANGO_CONTEXT_CLASS(klass: Pointer): PPangoContextClass;
function PANGO_IS_CONTEXT(obj: Pointer): Tgboolean;
function PANGO_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function PANGO_CONTEXT_GET_CLASS(obj: Pointer): PPangoContextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_CONTEXT: TGType;
begin
  PANGO_TYPE_CONTEXT := pango_context_get_type;
end;

function PANGO_CONTEXT(obj: Pointer): PPangoContext;
begin
  Result := PPangoContext(g_type_check_instance_cast(obj, PANGO_TYPE_CONTEXT));
end;

function PANGO_CONTEXT_CLASS(klass: Pointer): PPangoContextClass;
begin
  Result := PPangoContextClass(g_type_check_class_cast(klass, PANGO_TYPE_CONTEXT));
end;

function PANGO_IS_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_CONTEXT);
end;

function PANGO_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_CONTEXT);
end;

function PANGO_CONTEXT_GET_CLASS(obj: Pointer): PPangoContextClass;
begin
  Result := PPangoContextClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
