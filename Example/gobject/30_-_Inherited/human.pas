unit Human;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TEHuman = record
  private
    parent_instance: TGObject;
    FirstName,
    LastName: Pgchar;
    size:Tgfloat;
    age: Tgint;
  end;
  PEHuman = ^TEHuman;

  TEHumanClass = record
  private
    parent_class: TGObjectClass;
  end;
  PEHumanClass = ^TEHumanClass;

function e_human_get_type: TGType;
function e_human_new: PEHuman;
function e_human_new_with_data(FirstName, LastName: Pgchar; age: Tgint; size:Tgfloat): PEHuman;
procedure e_human_set_firstname(self: PEHuman; Name: Pgchar);
procedure e_human_set_lastname(self: PEHuman; Name: Pgchar);
function e_human_get_firstname(self: PEHuman): Pgchar;
function e_human_get_lastname(self: PEHuman): Pgchar;

function E_TYPE_HUMAN: TGType;
function E_HUMAN(obj: Pointer): PEHuman;
function E_HUMAN_CLASS(klass: Pointer): PEHumanClass;
function E_IS_HUMAN(obj: Pointer): Tgboolean;
function E_IS_HUMAN_CLASS(klass: Pointer): Tgboolean;
function E_HUMAN_GET_CLASS(obj: Pointer): PEHumanClass;


implementation

// ==== private

var
  e_human_parent_class: PGObjectClass = nil;

procedure e_human_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHuman;
begin
  self := E_HUMAN(object_);

  case property_id of
    1: begin
      if self^.FirstName <> nil then  begin
        g_free(self^.FirstName);
      end;
      self^.FirstName := g_value_dup_string(Value);
    end;
    2: begin
      if self^.LastName <> nil then  begin
        g_free(self^.LastName);
      end;
      self^.LastName := g_value_dup_string(Value);
    end;
    3: begin
      self^.age := g_value_get_int(Value);
    end;
    4: begin
      self^.size := g_value_get_float(Value);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure e_human_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHuman;
begin
  self := E_HUMAN(object_);

  case property_id of
    1: begin
      g_value_set_string(Value, self^.FirstName);
    end;
    2: begin
      g_value_set_string(Value, self^.LastName);
    end;
    3: begin
      g_value_set_int(Value, self^.age);
    end;
    4: begin
      g_value_set_float(Value, self^.size);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure e_human_finalize(object_: PGObject); cdecl;
var
  self: PEHuman;
begin
  self := E_HUMAN(object_);
  if self^.FirstName <> nil then  begin
    g_free(self^.FirstName);
  end;
  if self^.LastName <> nil then  begin
    g_free(self^.LastName);
  end;
  e_human_parent_class^.finalize(object_);
end;

procedure e_human_init(self: PEHuman); cdecl;
begin
  self^.FirstName := nil;
  self^.age := 0;
end;

procedure e_human_class_init(klass: PEHumanClass); cdecl;
var
  object_class: PGObjectClass;
  obj_properties: array[0..4] of PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(klass);

  object_class^.finalize := @e_human_finalize;
  e_human_parent_class := g_type_class_peek_parent(klass);

  object_class^.set_property := @e_human_set_property;
  object_class^.get_property := @e_human_get_property;

  obj_properties[0] := nil;
  obj_properties[1] := g_param_spec_string('firstname', 'FirstName', 'FirstName of the human', nil, G_PARAM_READWRITE);
  obj_properties[2] := g_param_spec_string('lastname', 'LastName', 'LastName of the human', nil, G_PARAM_READWRITE);
  obj_properties[3] := g_param_spec_int('age', 'Age', 'Age of the human', 0, 150, 0, G_PARAM_READWRITE);
  obj_properties[4] := g_param_spec_float('size', 'Sizw', 'Size of the human', 0.0, 3.0, 0.0, G_PARAM_READWRITE);

  g_object_class_install_properties(object_class, Length(obj_properties), obj_properties);
end;

// ==== public

function e_human_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  info: TGTypeInfo = (
  class_size: SizeOf(TEHumanClass);
  base_init: nil;
  base_finalize: nil;
  class_init: TGClassInitFunc(@e_human_class_init);
  class_finalize: nil;
  class_data: nil;
  instance_size: SizeOf(TEHuman);
  n_preallocs: 0;
  instance_init: TGInstanceInitFunc(@e_human_init);
  value_table: nil);
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static(G_TYPE_OBJECT, 'EHuman', @info, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function e_human_new: PEHuman;
begin
  Result := g_object_new(E_TYPE_HUMAN, nil);
end;

function e_human_new_with_data(FirstName, LastName: Pgchar; age: Tgint;  size: Tgfloat): PEHuman;
begin
  Result := g_object_new(E_TYPE_HUMAN,
    'firstname', FirstName,
    'lastname', LastName,
    'age', age,
    'size', size,
    nil);
end;

procedure e_human_set_firstname(self: PEHuman; Name: Pgchar);
begin
  g_object_set(self, 'firstname', Name, nil);
end;

procedure e_human_set_lastname(self: PEHuman; Name: Pgchar);
begin
  g_object_set(self, 'lastname', Name, nil);
end;

function e_human_get_firstname(self: PEHuman): Pgchar;
begin
  Result := self^.FirstName;
end;

function e_human_get_lastname(self: PEHuman): Pgchar;
begin
  Result := self^.LastName;
end;

// ====

function E_TYPE_HUMAN: TGType;
begin
  E_TYPE_HUMAN := e_human_get_type;
end;

function E_HUMAN(obj: Pointer): PEHuman;
begin
  Result := PEHuman(g_type_check_instance_cast(obj, E_TYPE_HUMAN));
end;

function E_HUMAN_CLASS(klass: Pointer): PEHumanClass;
begin
  Result := PEHumanClass(g_type_check_class_cast(klass, E_TYPE_HUMAN));
end;

function E_IS_HUMAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, E_TYPE_HUMAN);
end;

function E_IS_HUMAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, E_TYPE_HUMAN);
end;

function E_HUMAN_GET_CLASS(obj: Pointer): PEHumanClass;
begin
  Result := PEHumanClass(PGTypeInstance(obj)^.g_class);
end;

end.
