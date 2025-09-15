unit json_reader;

interface

uses
  fp_glib2, fp_json_glib, json_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function JSON_READER_ERROR: TGQuark;

type
  PJsonReaderPrivate = type Pointer;

type
  PJsonReaderError = ^TJsonReaderError;
  TJsonReaderError = longint;

const
  JSON_READER_ERROR_NO_ARRAY = 0;
  JSON_READER_ERROR_INVALID_INDEX = 1;
  JSON_READER_ERROR_NO_OBJECT = 2;
  JSON_READER_ERROR_INVALID_MEMBER = 3;
  JSON_READER_ERROR_INVALID_NODE = 4;
  JSON_READER_ERROR_NO_VALUE = 5;
  JSON_READER_ERROR_INVALID_TYPE = 6;

type
  TJsonReader = record
    parent_instance: TGObject;
    priv: PJsonReaderPrivate;
  end;
  PJsonReader = ^TJsonReader;

  TJsonReaderClass = record
    parent_class: TGObjectClass;
    _json_padding0: procedure; cdecl;
    _json_padding1: procedure; cdecl;
    _json_padding2: procedure; cdecl;
    _json_padding3: procedure; cdecl;
    _json_padding4: procedure; cdecl;
  end;
  PJsonReaderClass = ^TJsonReaderClass;

function json_reader_error_quark: TGQuark; cdecl; external libjsonglib;
function json_reader_get_type: TGType; cdecl; external libjsonglib;
function json_reader_new(node: PJsonNode): PJsonReader; cdecl; external libjsonglib;
procedure json_reader_set_root(reader: PJsonReader; root: PJsonNode); cdecl; external libjsonglib;
function json_reader_get_error(reader: PJsonReader): PGError; cdecl; external libjsonglib;
function json_reader_is_array(reader: PJsonReader): Tgboolean; cdecl; external libjsonglib;
function json_reader_read_element(reader: PJsonReader; index_: Tguint): Tgboolean; cdecl; external libjsonglib;
procedure json_reader_end_element(reader: PJsonReader); cdecl; external libjsonglib;
function json_reader_count_elements(reader: PJsonReader): Tgint; cdecl; external libjsonglib;
function json_reader_is_object(reader: PJsonReader): Tgboolean; cdecl; external libjsonglib;
function json_reader_read_member(reader: PJsonReader; member_name: Pgchar): Tgboolean; cdecl; external libjsonglib;
procedure json_reader_end_member(reader: PJsonReader); cdecl; external libjsonglib;
function json_reader_count_members(reader: PJsonReader): Tgint; cdecl; external libjsonglib;
function json_reader_list_members(reader: PJsonReader): PPgchar; cdecl; external libjsonglib;
function json_reader_get_member_name(reader: PJsonReader): Pgchar; cdecl; external libjsonglib;
function json_reader_is_value(reader: PJsonReader): Tgboolean; cdecl; external libjsonglib;
function json_reader_get_value(reader: PJsonReader): PJsonNode; cdecl; external libjsonglib;
function json_reader_get_int_value(reader: PJsonReader): Tgint64; cdecl; external libjsonglib;
function json_reader_get_double_value(reader: PJsonReader): Tgdouble; cdecl; external libjsonglib;
function json_reader_get_string_value(reader: PJsonReader): Pgchar; cdecl; external libjsonglib;
function json_reader_get_boolean_value(reader: PJsonReader): Tgboolean; cdecl; external libjsonglib;
function json_reader_get_null_value(reader: PJsonReader): Tgboolean; cdecl; external libjsonglib;
function json_reader_get_current_node(reader: PJsonReader): PJsonNode; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:27:24 ===

function JSON_TYPE_READER: TGType;
function JSON_READER(obj: Pointer): PJsonReader;
function JSON_READER_CLASS(klass: Pointer): PJsonReaderClass;
function JSON_IS_READER(obj: Pointer): Tgboolean;
function JSON_IS_READER_CLASS(klass: Pointer): Tgboolean;
function JSON_READER_GET_CLASS(obj: Pointer): PJsonReaderClass;

implementation

function JSON_TYPE_READER: TGType;
begin
  JSON_TYPE_READER := json_reader_get_type;
end;

function JSON_READER(obj: Pointer): PJsonReader;
begin
  Result := PJsonReader(g_type_check_instance_cast(obj, JSON_TYPE_READER));
end;

function JSON_READER_CLASS(klass: Pointer): PJsonReaderClass;
begin
  Result := PJsonReaderClass(g_type_check_class_cast(klass, JSON_TYPE_READER));
end;

function JSON_IS_READER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSON_TYPE_READER);
end;

function JSON_IS_READER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, JSON_TYPE_READER);
end;

function JSON_READER_GET_CLASS(obj: Pointer): PJsonReaderClass;
begin
  Result := PJsonReaderClass(PGTypeInstance(obj)^.g_class);
end;


function JSON_READER_ERROR: TGQuark;
begin
  JSON_READER_ERROR := json_reader_error_quark;
end;


end.
