unit json_builder;

interface

uses
  fp_glib2, fp_json_glib, json_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PJsonBuilderPrivate = type Pointer;

  TJsonBuilder = record
    parent_instance: TGObject;
    priv: PJsonBuilderPrivate;
  end;
  PJsonBuilder = ^TJsonBuilder;

  TJsonBuilderClass = record
    parent_class: TGObjectClass;
    _json_reserved1: procedure; cdecl;
    _json_reserved2: procedure; cdecl;
  end;
  PJsonBuilderClass = ^TJsonBuilderClass;

function json_builder_get_type: TGType; cdecl; external libjsonglib;
function json_builder_new: PJsonBuilder; cdecl; external libjsonglib;
function json_builder_new_immutable: PJsonBuilder; cdecl; external libjsonglib;
function json_builder_get_root(builder: PJsonBuilder): PJsonNode; cdecl; external libjsonglib;
procedure json_builder_reset(builder: PJsonBuilder); cdecl; external libjsonglib;
function json_builder_begin_array(builder: PJsonBuilder): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_end_array(builder: PJsonBuilder): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_begin_object(builder: PJsonBuilder): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_end_object(builder: PJsonBuilder): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_set_member_name(builder: PJsonBuilder; member_name: Pgchar): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_add_value(builder: PJsonBuilder; node: PJsonNode): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_add_int_value(builder: PJsonBuilder; value: Tgint64): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_add_double_value(builder: PJsonBuilder; value: Tgdouble): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_add_boolean_value(builder: PJsonBuilder; value: Tgboolean): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_add_string_value(builder: PJsonBuilder; value: Pgchar): PJsonBuilder; cdecl; external libjsonglib;
function json_builder_add_null_value(builder: PJsonBuilder): PJsonBuilder; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:26:08 ===

function JSON_TYPE_BUILDER: TGType;
function JSON_BUILDER(obj: Pointer): PJsonBuilder;
function JSON_BUILDER_CLASS(klass: Pointer): PJsonBuilderClass;
function JSON_IS_BUILDER(obj: Pointer): Tgboolean;
function JSON_IS_BUILDER_CLASS(klass: Pointer): Tgboolean;
function JSON_BUILDER_GET_CLASS(obj: Pointer): PJsonBuilderClass;

implementation

function JSON_TYPE_BUILDER: TGType;
begin
  JSON_TYPE_BUILDER := json_builder_get_type;
end;

function JSON_BUILDER(obj: Pointer): PJsonBuilder;
begin
  Result := PJsonBuilder(g_type_check_instance_cast(obj, JSON_TYPE_BUILDER));
end;

function JSON_BUILDER_CLASS(klass: Pointer): PJsonBuilderClass;
begin
  Result := PJsonBuilderClass(g_type_check_class_cast(klass, JSON_TYPE_BUILDER));
end;

function JSON_IS_BUILDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSON_TYPE_BUILDER);
end;

function JSON_IS_BUILDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, JSON_TYPE_BUILDER);
end;

function JSON_BUILDER_GET_CLASS(obj: Pointer): PJsonBuilderClass;
begin
  Result := PJsonBuilderClass(PGTypeInstance(obj)^.g_class);
end;



end.
