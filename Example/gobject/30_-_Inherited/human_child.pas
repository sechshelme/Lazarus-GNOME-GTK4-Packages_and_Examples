unit Human_Child;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2, Human_Parent;

type
  TEHumanExt = record
  private
    parent_instance: TEHuman;
    gender: Pgchar;
  end;
  PEHumanExt = ^TEHumanExt;

  TEHumanExtClass = record
  private
    parent_class: TEHumanClass;
  end;
  PEHumanExtClass = ^TEHumanExtClass;

function E_humanExt_get_type: TGType;
function E_humanExt_new: PEHumanExt;
function E_humanExt_new_with_data(Name: Pgchar; age: Tgint; gender: Pgchar): PEHumanExt;
procedure E_humanExt_set_gender(self: PEHumanExt; gender: Pgchar);
function E_humanExt_get_gender(self: PEHumanExt): Pgchar;

function E_TYPE_HUMANEXT: TGType;
function E_HUMANEXT(obj: Pointer): PEHumanExt;
function E_HUMANEXT_CLASS(klass: Pointer): PEHumanExtClass;
function E_IS_HUMANEXT(obj: Pointer): Tgboolean;
function E_IS_HUMANEXT_CLASS(klass: Pointer): Tgboolean;
function E_HUMANEXT_GET_CLASS(obj: Pointer): PEHumanExtClass;


implementation

var
  e_human_ext_parent_class: PEHumanClass = nil;


procedure E_humanExt_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHumanExt;
  ch: Pgchar;
begin
  self := E_HUMANEXT(object_);
  case property_id of
    1: begin
      ch := g_value_get_string(Value);
      if self^.gender <> nil then  begin
        g_free(self^.gender);
      end;
      if (g_strcmp0('Mann', ch) = 0) or (g_strcmp0('Frau', ch) = 0) then begin
        self^.gender := g_value_dup_string(Value);
      end else begin
        self^.gender := g_strdup('unbekannt');
      end;
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure E_humanExt_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHumanExt;
begin
  self := E_HUMANEXT(object_);
  case property_id of
    1: begin
      g_value_set_string(Value, self^.gender);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure E_humanExt_finalize(object_: PGObject); cdecl;
var
  self: PEHumanExt;
begin
  self := E_HUMANEXT(object_);
  g_free(self^.gender);
  G_OBJECT_CLASS(e_human_ext_parent_class)^.finalize(object_);
end;

procedure E_humanExt_init(self: PEHumanExt); cdecl;
begin
  self^.gender := nil;
end;

procedure E_humanExt_class_init(klass: PEHumanExtClass); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(klass);
  object_class^.set_property := @E_humanExt_set_property;
  object_class^.get_property := @E_humanExt_get_property;

  object_class^.finalize := @E_humanExt_finalize;
  e_human_ext_parent_class := g_type_class_peek_parent(klass);

  spec := g_param_spec_string('gender', 'Gender', 'Gender of the person', nil, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 1, spec);
end;

function E_humanExt_get_type: TGType;
const
  person_type: TGType = 0;
var
  type_info: TGTypeInfo;
begin
  if person_type = 0 then begin
    type_info.class_size := SizeOf(TEHumanExtClass);
    type_info.base_init := nil;
    type_info.base_finalize := nil;
    type_info.class_init := TGClassInitFunc(@E_humanExt_class_init);
    type_info.class_finalize := nil;
    type_info.class_data := nil;
    type_info.instance_size := SizeOf(TEHumanExt);
    type_info.n_preallocs := 0;
    type_info.instance_init := TGInstanceInitFunc(@E_humanExt_init);
    type_info.value_table := nil;

    person_type := g_type_register_static(E_TYPE_HUMAN, 'PersonExt', @type_info, 0);
  end;
  Result := person_type;
end;

function E_humanExt_new: PEHumanExt;
begin
  Result := g_object_new(E_TYPE_HUMANEXT, nil);
end;

function E_humanExt_new_with_data(Name: Pgchar; age: Tgint; gender: Pgchar): PEHumanExt;
begin
  Result := g_object_new(E_TYPE_HUMANEXT,
    'name', Name,
    'age', age,
    'gender', gender,
    nil);
end;

procedure E_humanExt_set_gender(self: PEHumanExt; gender: Pgchar);
begin
  g_object_set(self, 'gender', gender, nil);
end;

function E_humanExt_get_gender(self: PEHumanExt): Pgchar;
begin
  Result := self^.gender;
end;

// ====

function E_TYPE_HUMANEXT: TGType;
begin
  E_TYPE_HUMANEXT := E_humanExt_get_type;
end;

function E_HUMANEXT(obj: Pointer): PEHumanExt;
begin
  Result := PEHumanExt(g_type_check_instance_cast(obj, E_TYPE_HUMANEXT));
end;

function E_HUMANEXT_CLASS(klass: Pointer): PEHumanExtClass;
begin
  Result := PEHumanExtClass(g_type_check_class_cast(klass, E_TYPE_HUMANEXT));
end;

function E_IS_HUMANEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, E_TYPE_HUMANEXT);
end;

function E_IS_HUMANEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, E_TYPE_HUMANEXT);
end;

function E_HUMANEXT_GET_CLASS(obj: Pointer): PEHumanExtClass;
begin
  Result := PEHumanExtClass(PGTypeInstance(obj)^.g_class);
end;

end.
