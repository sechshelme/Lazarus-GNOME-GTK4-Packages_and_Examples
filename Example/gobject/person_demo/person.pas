unit Person;

interface

uses
  fp_glib2;

type
  TPerson = record
    parent_instance: TGObject;
    Name: Pgchar;
    age: Tgint;
  end;
  PPerson = ^TPerson;

  TPersonClass = record
    parent_class: TGObjectClass;
  end;
  PPersonClass = ^TPersonClass;


function person_get_type: TGType;
function person_new: PPerson;
function person_new_with_data(Name: Pgchar; age: Tgint): PPerson;
procedure person_set_name(self: PPerson; Name: Pgchar);
procedure person_set_age(self: PPerson; age: Tgint);
function person_get_name(self: PPerson): Pgchar;
function person_get_age(self: PPerson): Tgint;

function TYPE_PERSON: TGType;
function PERSON(obj: Pointer): PPerson;
function IS_PERSON(obj: Pointer): Tgboolean;

function g_param_spec_string(Name: Pgchar; nick: Pgchar; blurb: Pgchar; default_value: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgobject2_0;


implementation

type
  Tobj_propertie = (PROP_0, PROP_NAME, PROP_AGE);

var
  obj_properties: array[Tobj_propertie] of PGParamSpec = (nil, nil, nil);

procedure person_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PPerson;
begin
  self := PERSON(object_);

  case Tobj_propertie(property_id) of
    PROP_NAME: begin
      g_free(self^.Name);
      self^.Name := g_value_dup_string(Value);
    end;
    PROP_AGE: begin
      self^.age := g_value_get_int(Value);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure person_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PPerson;
begin
  self := PERSON(object_);

  case Tobj_propertie(property_id) of
    PROP_NAME: begin
      g_value_set_string(Value, self^.Name);
    end;
    PROP_AGE: begin
      g_value_set_int(Value, self^.age);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure person_init(self: PPerson);
begin
  self^.Name := nil;
  self^.age := 0;
end;

procedure person_class_init(klass: PPersonClass);
var
  object_class: PGObjectClass;
begin
  object_class := G_OBJECT_CLASS(klass);

  object_class^.set_property := @person_set_property;
  object_class^.get_property := @person_get_property;

  obj_properties[PROP_NAME] := g_param_spec_string('name', 'Name', 'Name of the person', nil, G_PARAM_READWRITE);
  obj_properties[PROP_AGE] := g_param_spec_int('age', 'Age', 'Age of the person', 0, 150, 0, G_PARAM_READWRITE);

  g_object_class_install_properties(object_class, Length(obj_properties), obj_properties);
end;

function person_get_type: TGType;
const
  person_type_id: Tgsize = 0;
var
  type_id: TGType;
  info: TGTypeInfo;
begin
  if g_once_init_enter(@person_type_id) then begin
    info.class_size := SizeOf(TPersonClass);
    info.base_init := nil;
    info.base_finalize := nil;
    info.class_init := TGClassInitFunc(@person_class_init);
    info.class_finalize := nil;
    info.class_data := nil;
    info.instance_size := SizeOf(TPerson);
    info.n_preallocs := 0;
    info.instance_init := TGInstanceInitFunc(@person_init);
    info.value_table := nil;

    type_id := g_type_register_static(G_TYPE_OBJECT, 'Person', @info, 0);
    g_once_init_leave(@person_type_id, type_id);
  end;
  Result := person_type_id;
end;

function person_new: PPerson;
begin
  Result := g_object_new(TYPE_PERSON, nil);
end;

function person_new_with_data(Name: Pgchar; age: Tgint): PPerson;
begin
  Result := g_object_new(TYPE_PERSON,
    'name', Name,
    'age', age,
    nil);
end;

procedure person_set_name(self: PPerson; Name: Pgchar);
begin
  g_free(self^.Name);
  self^.Name := g_strdup(Name);
end;

procedure person_set_age(self: PPerson; age: Tgint);
begin
  self^.age := age;
end;

function person_get_name(self: PPerson): Pgchar;
begin
  Result := self^.Name;
end;

function person_get_age(self: PPerson): Tgint;
begin
  Result := self^.age;
end;

function TYPE_PERSON: TGType;
begin
  Result := person_get_type;
end;

function PERSON(obj: Pointer): PPerson;
begin
  Result := PPerson(g_type_check_instance_cast(obj, TYPE_PERSON));
end;

function IS_PERSON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, TYPE_PERSON);
end;

end.
