unit tdouble;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes, fp_glib2;


type
  TTDouble = record
    parent: TGObject;
    Value: Tgdouble;
  end;
  PTDouble = ^TTDouble;

  TTDoubleClass = record
    parent_class: TGObjectClass;
  end;
  PTDoubleClass=^TTDoubleClass;

  function t_double_get_type: TGType;
  function t_double_new(Value: Tgdouble): PTDouble;
  function t_doube_get_value(self: PTDouble; Value: Pgdouble): Tgboolean;
  procedure t_double_set_value(self: PTDouble; Value: Tgdouble);
  procedure t_double_mul(self:PTDouble;value:Tgdouble);

  function T_TYPE_DOUBLE: TGType;
  function T_DOUBLE(obj: Pointer): PTDouble;
  function T_IS_DOUBLE(obj: Pointer): Tgboolean;

implementation

procedure t_double_class_init(_class: PTDoubleClass); cdecl;
begin
  WriteLn('class_init');
end;

procedure t_double_init(self: TTDouble); cdecl;
begin
  WriteLn('init');
end;

function t_double_get_type: TGType;
const
  type_: TGType = 0;
var
  info: TGTypeInfo;
begin
  if type_ = 0 then begin
    info.class_size := SizeOf(TTDoubleClass);
    info.base_init := nil;
    info.base_finalize := nil;
    info.class_init := TGClassInitFunc(@t_double_class_init);
    info.class_finalize := nil;
    info.class_data := nil;
    info.instance_size := SizeOf(TTDouble);
    info.n_preallocs := 0;
    info.instance_init := TGInstanceInitFunc(@t_double_init);
    info.value_table := nil;
    type_ := g_type_register_static(G_TYPE_OBJECT, 'TDouble', @info, 0);
  end;
  Result := type_;
end;

function t_doube_get_value(self: PTDouble; Value: Pgdouble): Tgboolean;
begin
  if T_IS_DOUBLE(self) then begin
    Value^ := self^.Value;
    Result := True;
  end else begin
    g_return_if_fail_warning(G_LOG_DOMAIN, nil, 'gFALSE');
    Result := False;
  end;
end;

procedure t_double_set_value(self: PTDouble; Value: Tgdouble);
begin
  if T_IS_DOUBLE(self) then begin
    self^.Value := Value;
  end else begin
    g_return_if_fail_warning(G_LOG_DOMAIN, nil, 'gFALSE');
  end;
end;

procedure t_double_mul(self:PTDouble;value:Tgdouble);
begin
  if T_IS_DOUBLE(self) then begin
    self^.Value *= Value;
  end else begin
    g_return_if_fail_warning(G_LOG_DOMAIN, nil, 'gFALSE');
  end;
end;

function t_double_new(Value: Tgdouble): PTDouble;
var
  d: PTDouble;
begin
  d := g_object_new(T_TYPE_DOUBLE, nil);
  d^.Value := Value;
  Result := d;
end;

function T_TYPE_DOUBLE: TGType;
begin
  Result := t_double_get_type;
end;

function T_DOUBLE(obj: Pointer): PTDouble;
begin
  Result := PTDouble(g_type_check_instance_cast(obj, T_TYPE_DOUBLE));
end;

function T_IS_DOUBLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, T_TYPE_DOUBLE);
end;

end.

