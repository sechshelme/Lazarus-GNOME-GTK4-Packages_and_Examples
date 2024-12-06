unit Person_inherit;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2, Person;

type
  TExPersonExt = record
  private
    parent_instance: TExPerson;
    gender: Pgchar;
  end;
  PExPersonExt = ^TExPersonExt;

  TExPersonExtClass = record
  private
    parent_class: TExPersonClass;
  end;
  PExPersonExtClass = ^TExPersonExtClass;

function Ex_personExt_get_type: TGType;
function Ex_personExt_new: PExPersonExt;
function Ex_personExt_new_with_data(Name: Pgchar; age: Tgint; gender: Pgchar): PExPersonExt;
procedure Ex_personExt_set_gender(self: PExPersonExt; gender: Pgchar);
function Ex_personExt_get_gender(self: PExPersonExt): Pgchar;

function EX_TYPE_PERSONEXT: TGType;
function EX_PERSONEXT(obj: Pointer): PExPERSONEXT;
function EX_PERSONEXT_CLASS(klass: Pointer): PExPERSONEXTClass;
function EX_IS_PERSONEXT(obj: Pointer): Tgboolean;
function EX_IS_PERSONEXT_CLASS(klass: Pointer): Tgboolean;
function EX_PERSONEXT_GET_CLASS(obj: Pointer): PExPERSONEXTClass;


implementation

var
  ex_person_ext_parent_class: PExPersonClass = nil;


procedure Ex_personExt_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPersonExt;
  ch: Pgchar;
begin
  self := EX_PERSONEXT(object_);
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

procedure Ex_personExt_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPersonExt;
begin
  self := EX_PERSONEXT(object_);
  case property_id of
    1: begin
      g_value_set_string(Value, self^.gender);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure Ex_personExt_finalize(object_: PGObject); cdecl;
var
  self: PExPersonExt;
begin
  self := EX_PERSONEXT(object_);
  g_free(self^.gender);
  G_OBJECT_CLASS(ex_person_ext_parent_class)^.finalize(object_);
end;

procedure Ex_personExt_init(self: PExPersonExt); cdecl;
begin
  self^.gender := nil;
end;

procedure Ex_personExt_class_init(klass: PExPersonExtClass); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(klass);
  object_class^.set_property := @Ex_personExt_set_property;
  object_class^.get_property := @Ex_personExt_get_property;

  object_class^.finalize := @Ex_personExt_finalize;
  ex_person_ext_parent_class := g_type_class_peek_parent(klass);

  spec := g_param_spec_string('gender', 'Gender', 'Gender of the person', nil, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 1, spec);
end;

function Ex_personExt_get_type: TGType;
const
  person_type: TGType = 0;
var
  type_info: TGTypeInfo;
begin
  if person_type = 0 then begin
    type_info.class_size := SizeOf(TExPersonExtClass);
    type_info.base_init := nil;
    type_info.base_finalize := nil;
    type_info.class_init := TGClassInitFunc(@Ex_personExt_class_init);
    type_info.class_finalize := nil;
    type_info.class_data := nil;
    type_info.instance_size := SizeOf(TExPersonExt);
    type_info.n_preallocs := 0;
    type_info.instance_init := TGInstanceInitFunc(@Ex_personExt_init);
    type_info.value_table := nil;

    person_type := g_type_register_static(EX_TYPE_PERSON, 'PersonExt', @type_info, 0);
  end;
  Result := person_type;
end;

function Ex_personExt_new: PExPersonExt;
begin
  Result := g_object_new(EX_TYPE_PERSONEXT, nil);
end;

function Ex_personExt_new_with_data(Name: Pgchar; age: Tgint; gender: Pgchar): PExPersonExt;
begin
  Result := g_object_new(EX_TYPE_PERSONEXT,
    'name', Name,
    'age', age,
    'gender', gender,
    nil);
end;

procedure Ex_personExt_set_gender(self: PExPersonExt; gender: Pgchar);
begin
  g_object_set(self, 'gender', gender, nil);
end;

function Ex_personExt_get_gender(self: PExPersonExt): Pgchar;
begin
  Result := self^.gender;
end;

// ====

function EX_TYPE_PERSONEXT: TGType;
begin
  EX_TYPE_PERSONEXT := ex_PERSONEXT_get_type;
end;

function EX_PERSONEXT(obj: Pointer): PExPERSONEXT;
begin
  Result := PExPERSONEXT(g_type_check_instance_cast(obj, EX_TYPE_PERSONEXT));
end;

function EX_PERSONEXT_CLASS(klass: Pointer): PExPERSONEXTClass;
begin
  Result := PExPERSONEXTClass(g_type_check_class_cast(klass, EX_TYPE_PERSONEXT));
end;

function EX_IS_PERSONEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, EX_TYPE_PERSONEXT);
end;

function EX_IS_PERSONEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, EX_TYPE_PERSONEXT);
end;

function EX_PERSONEXT_GET_CLASS(obj: Pointer): PExPERSONEXTClass;
begin
  Result := PExPERSONEXTClass(PGTypeInstance(obj)^.g_class);
end;

end.
