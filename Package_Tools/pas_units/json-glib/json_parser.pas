unit json_parser;

interface

uses
  fp_glib2, fp_json_glib, json_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function JSON_PARSER_ERROR: TGQuark;

type
  PJsonParserError = ^TJsonParserError;
  TJsonParserError = longint;

const
  JSON_PARSER_ERROR_PARSE = 0;
  JSON_PARSER_ERROR_TRAILING_COMMA = 1;
  JSON_PARSER_ERROR_MISSING_COMMA = 2;
  JSON_PARSER_ERROR_MISSING_COLON = 3;
  JSON_PARSER_ERROR_INVALID_BAREWORD = 4;
  JSON_PARSER_ERROR_EMPTY_MEMBER_NAME = 5;
  JSON_PARSER_ERROR_INVALID_DATA = 6;
  JSON_PARSER_ERROR_UNKNOWN = 7;

type
  PJsonParserPrivate = type Pointer;

  TJsonParser = record
    parent_instance: TGObject;
    priv: PJsonParserPrivate;
  end;
  PJsonParser = ^TJsonParser;

  TJsonParserClass = record
    parent_class: TGObjectClass;
    parse_start: procedure(parser: PJsonParser); cdecl;
    object_start: procedure(parser: PJsonParser); cdecl;
    object_member: procedure(parser: PJsonParser; obj: PJsonObject; member_name: Pgchar); cdecl;
    object_end: procedure(parser: PJsonParser; obj: PJsonObject); cdecl;
    array_start: procedure(parser: PJsonParser); cdecl;
    array_element: procedure(parser: PJsonParser; arr: PJsonArray; index_: Tgint); cdecl;
    array_end: procedure(parser: PJsonParser; arr: PJsonArray); cdecl;
    parse_end: procedure(parser: PJsonParser); cdecl;
    error: procedure(parser: PJsonParser; error: PGError); cdecl;
    _json_reserved1: procedure; cdecl;
    _json_reserved2: procedure; cdecl;
    _json_reserved3: procedure; cdecl;
    _json_reserved4: procedure; cdecl;
    _json_reserved5: procedure; cdecl;
    _json_reserved6: procedure; cdecl;
    _json_reserved7: procedure; cdecl;
    _json_reserved8: procedure; cdecl;
  end;
  PJsonParserClass = ^TJsonParserClass;

function json_parser_error_quark: TGQuark; cdecl; external libjsonglib;
function json_parser_get_type: TGType; cdecl; external libjsonglib;
function json_parser_new: PJsonParser; cdecl; external libjsonglib;
function json_parser_new_immutable: PJsonParser; cdecl; external libjsonglib;
function json_parser_load_from_file(parser: PJsonParser; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libjsonglib;
function json_parser_load_from_mapped_file(parser: PJsonParser; filename: Pgchar; error: PPGError): Tgboolean; cdecl; external libjsonglib;
function json_parser_load_from_data(parser: PJsonParser; data: Pgchar; length: Tgssize; error: PPGError): Tgboolean; cdecl; external libjsonglib;
function json_parser_load_from_stream(parser: PJsonParser; stream: PGInputStream; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libjsonglib;
procedure json_parser_load_from_stream_async(parser: PJsonParser; stream: PGInputStream; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libjsonglib;
function json_parser_load_from_stream_finish(parser: PJsonParser; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libjsonglib;
function json_parser_get_root(parser: PJsonParser): PJsonNode; cdecl; external libjsonglib;
function json_parser_steal_root(parser: PJsonParser): PJsonNode; cdecl; external libjsonglib;
function json_parser_get_current_line(parser: PJsonParser): Tguint; cdecl; external libjsonglib;
function json_parser_get_current_pos(parser: PJsonParser): Tguint; cdecl; external libjsonglib;
function json_parser_has_assignment(parser: PJsonParser; variable_name: PPgchar): Tgboolean; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:26:48 ===

function JSON_TYPE_PARSER: TGType;
function JSON_PARSER(obj: Pointer): PJsonParser;
function JSON_PARSER_CLASS(klass: Pointer): PJsonParserClass;
function JSON_IS_PARSER(obj: Pointer): Tgboolean;
function JSON_IS_PARSER_CLASS(klass: Pointer): Tgboolean;
function JSON_PARSER_GET_CLASS(obj: Pointer): PJsonParserClass;

implementation

function JSON_TYPE_PARSER: TGType;
begin
  JSON_TYPE_PARSER := json_parser_get_type;
end;

function JSON_PARSER(obj: Pointer): PJsonParser;
begin
  Result := PJsonParser(g_type_check_instance_cast(obj, JSON_TYPE_PARSER));
end;

function JSON_PARSER_CLASS(klass: Pointer): PJsonParserClass;
begin
  Result := PJsonParserClass(g_type_check_class_cast(klass, JSON_TYPE_PARSER));
end;

function JSON_IS_PARSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSON_TYPE_PARSER);
end;

function JSON_IS_PARSER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, JSON_TYPE_PARSER);
end;

function JSON_PARSER_GET_CLASS(obj: Pointer): PJsonParserClass;
begin
  Result := PJsonParserClass(PGTypeInstance(obj)^.g_class);
end;


function JSON_PARSER_ERROR: TGQuark;
begin
  JSON_PARSER_ERROR := json_parser_error_quark;
end;


end.
