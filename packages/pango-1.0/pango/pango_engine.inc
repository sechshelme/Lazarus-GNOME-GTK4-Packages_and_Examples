/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 26-11-2024   16:54                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  PANGO_RENDER_TYPE_NONE = 'PangoRenderNone';

type
  TPangoEngineClass = record
    parent_class: TGObjectClass;
  end;
  PPangoEngineClass = ^TPangoEngineClass;

function pango_engine_get_type: TGType; cdecl; external libpango;

const
  PANGO_ENGINE_TYPE_LANG = 'PangoEngineLang';

type
  TPangoEngineLangClass = record
    parent_class: TPangoEngineClass;
    script_break: procedure(engine: PPangoEngineLang; Text: pchar; len: longint; analysis: PPangoAnalysis; attrs: PPangoLogAttr;
      attrs_len: longint); cdecl;
  end;
  PPangoEngineLangClass = ^TPangoEngineLangClass;


function pango_engine_lang_get_type: TGType; cdecl; external libpango;

const
  PANGO_ENGINE_TYPE_SHAPE = 'PangoEngineShape';

type
  TPangoEngineShapeClass = record
    parent_class: TPangoEngineClass;
    script_shape: procedure(engine: PPangoEngineShape; font: PPangoFont; item_text: pchar; item_length: dword; analysis: PPangoAnalysis;
      glyphs: PPangoGlyphString; paragraph_text: pchar; paragraph_length: dword); cdecl;
    covers: function(engine: PPangoEngineShape; font: PPangoFont; language: PPangoLanguage; wc: Tgunichar): TPangoCoverageLevel; cdecl;
  end;
  PPangoEngineShapeClass = ^TPangoEngineShapeClass;

function pango_engine_shape_get_type: TGType; cdecl; external libpango;

type
  TPangoEngineScriptInfo = record
    script: TPangoScript;
    langs: Pgchar;
  end;
  PPangoEngineScriptInfo = ^TPangoEngineScriptInfo;

  TPangoEngineInfo = record
    id: Pgchar;
    engine_type: Pgchar;
    render_type: Pgchar;
    scripts: PPangoEngineScriptInfo;
    n_scripts: Tgint;
  end;
  PPangoEngineInfo = ^TPangoEngineInfo;
  PPPangoEngineInfo = ^PPangoEngineInfo;

procedure script_engine_list(engines: PPPangoEngineInfo; n_engines: Plongint); cdecl; external libpango;
procedure script_engine_init(module: PGTypeModule); cdecl; external libpango;
procedure script_engine_exit; cdecl; external libpango;
function script_engine_create(id: pchar): PPangoEngine; cdecl; external libpango;

// === Konventiert am: 23-11-24 19:33:33 ===

function PANGO_TYPE_ENGINE: TGType;
function PANGO_ENGINE(obj: Pointer): PPangoEngine;
function PANGO_ENGINE_CLASS(klass: Pointer): PPangoEngineClass;
function PANGO_IS_ENGINE(obj: Pointer): Tgboolean;
function PANGO_IS_ENGINE_CLASS(klass: Pointer): Tgboolean;
function PANGO_ENGINE_GET_CLASS(obj: Pointer): PPangoEngineClass;

function PANGO_TYPE_ENGINE_LANG: TGType;
function PANGO_ENGINE_LANG(obj: Pointer): PPangoEngineLang;
function PANGO_ENGINE_LANG_CLASS(klass: Pointer): PPangoEngineLangClass;
function PANGO_IS_ENGINE_LANG(obj: Pointer): Tgboolean;
function PANGO_IS_ENGINE_LANG_CLASS(klass: Pointer): Tgboolean;
function PANGO_ENGINE_LANG_GET_CLASS(obj: Pointer): PPangoEngineLangClass;

function PANGO_TYPE_ENGINE_SHAPE: TGType;
function PANGO_ENGINE_SHAPE(obj: Pointer): PPangoEngineShape;
function PANGO_ENGINE_SHAPE_CLASS(klass: Pointer): PPangoEngineShapeClass;
function PANGO_IS_ENGINE_SHAPE(obj: Pointer): Tgboolean;
function PANGO_IS_ENGINE_SHAPE_CLASS(klass: Pointer): Tgboolean;
function PANGO_ENGINE_SHAPE_GET_CLASS(obj: Pointer): PPangoEngineShapeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_ENGINE: TGType;
begin
  PANGO_TYPE_ENGINE := pango_engine_get_type;
end;

function PANGO_ENGINE(obj: Pointer): PPangoEngine;
begin
  Result := PPangoEngine(g_type_check_instance_cast(obj, PANGO_TYPE_ENGINE));
end;

function PANGO_ENGINE_CLASS(klass: Pointer): PPangoEngineClass;
begin
  Result := PPangoEngineClass(g_type_check_class_cast(klass, PANGO_TYPE_ENGINE));
end;

function PANGO_IS_ENGINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_ENGINE);
end;

function PANGO_IS_ENGINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_ENGINE);
end;

function PANGO_ENGINE_GET_CLASS(obj: Pointer): PPangoEngineClass;
begin
  Result := PPangoEngineClass(PGTypeInstance(obj)^.g_class);
end;

// =====

function PANGO_TYPE_ENGINE_LANG: TGType;
begin
  PANGO_TYPE_ENGINE_LANG := pango_engine_lang_get_type;
end;

function PANGO_ENGINE_LANG(obj: Pointer): PPangoEngineLang;
begin
  Result := PPangoEngineLang(g_type_check_instance_cast(obj, PANGO_TYPE_ENGINE_LANG));
end;

function PANGO_ENGINE_LANG_CLASS(klass: Pointer): PPangoEngineLangClass;
begin
  Result := PPangoEngineLangClass(g_type_check_class_cast(klass, PANGO_TYPE_ENGINE_LANG));
end;

function PANGO_IS_ENGINE_LANG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_ENGINE_LANG);
end;

function PANGO_IS_ENGINE_LANG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_ENGINE_LANG);
end;

function PANGO_ENGINE_LANG_GET_CLASS(obj: Pointer): PPangoEngineLangClass;
begin
  Result := PPangoEngineLangClass(PGTypeInstance(obj)^.g_class);
end;

// =====

function PANGO_TYPE_ENGINE_SHAPE: TGType;
begin
  PANGO_TYPE_ENGINE_SHAPE := pango_engine_shape_get_type;
end;

function PANGO_ENGINE_SHAPE(obj: Pointer): PPangoEngineShape;
begin
  Result := PPangoEngineShape(g_type_check_instance_cast(obj, PANGO_TYPE_ENGINE_SHAPE));
end;

function PANGO_ENGINE_SHAPE_CLASS(klass: Pointer): PPangoEngineShapeClass;
begin
  Result := PPangoEngineShapeClass(g_type_check_class_cast(klass, PANGO_TYPE_ENGINE_SHAPE));
end;

function PANGO_IS_ENGINE_SHAPE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_ENGINE_SHAPE);
end;

function PANGO_IS_ENGINE_SHAPE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_ENGINE_SHAPE);
end;

function PANGO_ENGINE_SHAPE_GET_CLASS(obj: Pointer): PPangoEngineShapeClass;
begin
  Result := PPangoEngineShapeClass(PGTypeInstance(obj)^.g_class);
end;

// =====


{$ENDIF read_implementation}
