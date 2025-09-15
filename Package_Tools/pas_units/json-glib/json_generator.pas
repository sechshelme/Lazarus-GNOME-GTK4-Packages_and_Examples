unit json_generator;

interface

uses
  fp_glib2, fp_json_glib, json_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PJsonGeneratorPrivate = type Pointer;

  TJsonGenerator = record
    parent_instance: TGObject;
    priv: PJsonGeneratorPrivate;
  end;
  PJsonGenerator = ^TJsonGenerator;

  TJsonGeneratorClass = record
    parent_class: TGObjectClass;
    _json_reserved1: procedure; cdecl;
    _json_reserved2: procedure; cdecl;
    _json_reserved3: procedure; cdecl;
    _json_reserved4: procedure; cdecl;
  end;
  PJsonGeneratorClass = ^TJsonGeneratorClass;

function json_generator_get_type: TGType; cdecl; external libjsonglib;
function json_generator_new: PJsonGenerator; cdecl; external libjsonglib;
procedure json_generator_set_pretty(generator: PJsonGenerator; is_pretty: Tgboolean); cdecl; external libjsonglib;
function json_generator_get_pretty(generator: PJsonGenerator): Tgboolean; cdecl; external libjsonglib;
procedure json_generator_set_indent(generator: PJsonGenerator; indent_level: Tguint); cdecl; external libjsonglib;
function json_generator_get_indent(generator: PJsonGenerator): Tguint; cdecl; external libjsonglib;
procedure json_generator_set_indent_char(generator: PJsonGenerator; indent_char: Tgunichar); cdecl; external libjsonglib;
function json_generator_get_indent_char(generator: PJsonGenerator): Tgunichar; cdecl; external libjsonglib;
procedure json_generator_set_root(generator: PJsonGenerator; node: PJsonNode); cdecl; external libjsonglib;
function json_generator_get_root(generator: PJsonGenerator): PJsonNode; cdecl; external libjsonglib;
function json_generator_to_gstring(generator: PJsonGenerator; _string: PGString): PGString; cdecl; external libjsonglib;
function json_generator_to_data(generator: PJsonGenerator; length: Pgsize): Pgchar; cdecl; external libjsonglib;
function json_generator_to_file(generator: PJsonGenerator; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libjsonglib;
function json_generator_to_stream(generator: PJsonGenerator; stream: PGOutputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:26:14 ===

function JSON_TYPE_GENERATOR: TGType;
function JSON_GENERATOR(obj: Pointer): PJsonGenerator;
function JSON_GENERATOR_CLASS(klass: Pointer): PJsonGeneratorClass;
function JSON_IS_GENERATOR(obj: Pointer): Tgboolean;
function JSON_IS_GENERATOR_CLASS(klass: Pointer): Tgboolean;
function JSON_GENERATOR_GET_CLASS(obj: Pointer): PJsonGeneratorClass;

implementation

function JSON_TYPE_GENERATOR: TGType;
begin
  JSON_TYPE_GENERATOR := json_generator_get_type;
end;

function JSON_GENERATOR(obj: Pointer): PJsonGenerator;
begin
  Result := PJsonGenerator(g_type_check_instance_cast(obj, JSON_TYPE_GENERATOR));
end;

function JSON_GENERATOR_CLASS(klass: Pointer): PJsonGeneratorClass;
begin
  Result := PJsonGeneratorClass(g_type_check_class_cast(klass, JSON_TYPE_GENERATOR));
end;

function JSON_IS_GENERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSON_TYPE_GENERATOR);
end;

function JSON_IS_GENERATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, JSON_TYPE_GENERATOR);
end;

function JSON_GENERATOR_GET_CLASS(obj: Pointer): PJsonGeneratorClass;
begin
  Result := PJsonGeneratorClass(PGTypeInstance(obj)^.g_class);
end;



end.
