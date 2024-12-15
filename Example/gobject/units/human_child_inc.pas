unit Human_Child_Inc;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2, Human, Human_Child;

type
  TEHumanInc = record
  private
    parent_instance: TEHumanExt;
    timerOn: Tgboolean;
    time: TGTime;
  end;
  PEHumanInc = ^TEHumanInc;

  TEHumanIncClass = record
  private
    parent_class: TEHumanExtClass;
  end;
  PEHumanIncClass = ^TEHumanIncClass;

function E_humanInc_get_type: TGType;

function E_TYPE_HUMANINC: TGType;
function E_HUMANINC(obj: Pointer): PEHumanInc;
function E_HUMANINC_CLASS(klass: Pointer): PEHumanIncClass;
function E_IS_HUMANINC(obj: Pointer): Tgboolean;
function E_IS_HUMANINC_CLASS(klass: Pointer): Tgboolean;
function E_HUMANINC_GET_CLASS(obj: Pointer): PEHumanIncClass;


implementation

// ==== private

var
  e_human_inc_parent_class: PEHumanIncClass = nil;

  my_signal_id: Tgint = 0;


procedure E_humanInc_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHumanInc;
  ch: Pgchar;
begin
  self := E_HUMANINC(object_);
  case property_id of
    1: begin
      self^.timerOn := g_value_get_boolean(Value);
    end;
    2: begin
      self^.time := g_value_get_int(Value);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure E_humanInc_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHumanInc;
begin
  self := E_HUMANINC(object_);
  case property_id of
    1: begin
      g_value_set_boolean(Value, self^.timerOn);
    end;
    2: begin
      g_value_set_int(Value, self^.time);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure E_humanInc_finalize(object_: PGObject); cdecl;
var
  self: PEHumanInc;
begin
  self := E_HUMANINC(object_);
  G_OBJECT_CLASS(e_human_inc_parent_class)^.finalize(object_);
end;

function timercallback(user_data: Tgpointer): Tgboolean; cdecl;
var
  self: PEHumanInc absolute user_data;
  age: Tgint;
begin
  g_object_get(self, 'age', @age, nil);
  Inc(age);
  g_object_set(self, 'age', age, nil);
  if age >= 100 then  begin
    g_signal_emit(self, my_signal_id, 0);
  end;
  Result := True;
end;

procedure E_humanInc_init(self: PEHumanInc); cdecl;
begin
  self^.time := -1;
  self^.timerOn := gFalse;
  g_timeout_add_seconds(1, @timercallback, self);
end;

procedure E_humanInc_class_init(klass: PEHumanIncClass); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(klass);
  object_class^.set_property := @E_humanInc_set_property;
  object_class^.get_property := @E_humanInc_get_property;

  object_class^.finalize := @E_humanInc_finalize;
  e_human_inc_parent_class := g_type_class_peek_parent(klass);

  spec := g_param_spec_boolean('timeon', 'TimeOn', 'TimeOn vor Age of the human', gFalse, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 1, spec);
  spec := g_param_spec_int('time', 'Time', 'Time vor Age of the human', 0, 100, 0, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 2, spec);


  my_signal_id := g_signal_new('age-signal',
    G_TYPE_FROM_CLASS(klass),
    G_SIGNAL_RUN_LAST or G_SIGNAL_NO_RECURSE or G_SIGNAL_NO_HOOKS,
    0,
    nil,
    nil,
    nil,
    G_TYPE_NONE,
    0);
end;

// ==== public

function E_humanInc_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  info: TGTypeInfo = (
  class_size: SizeOf(TEHumanIncClass);
  base_init: nil;
  base_finalize: nil;
  class_init: TGClassInitFunc(@E_humanInc_class_init);
  class_finalize: nil;
  class_data: nil;
  instance_size: SizeOf(TEHumanInc);
  n_preallocs: 0;
  instance_init: TGInstanceInitFunc(@E_humanInc_init);
  value_table: nil);
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static(E_TYPE_HUMANEXT, 'HumanInc', @info, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

// ====

function E_TYPE_HUMANINC: TGType;
begin
  Result := E_humanInc_get_type;
end;

function E_HUMANINC(obj: Pointer): PEHumanInc;
begin
  Result := PEHumanInc(g_type_check_instance_cast(obj, E_TYPE_HUMANEXT));
end;

function E_HUMANINC_CLASS(klass: Pointer): PEHumanIncClass;
begin
  Result := PEHumanIncClass(g_type_check_class_cast(klass, E_TYPE_HUMANEXT));
end;

function E_IS_HUMANINC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, E_TYPE_HUMANEXT);
end;

function E_IS_HUMANINC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, E_TYPE_HUMANEXT);
end;

function E_HUMANINC_GET_CLASS(obj: Pointer): PEHumanIncClass;
begin
  Result := PEHumanIncClass(PGTypeInstance(obj)^.g_class);
end;

end.
