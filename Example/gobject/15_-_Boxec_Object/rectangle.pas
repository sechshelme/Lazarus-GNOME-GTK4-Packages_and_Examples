unit Rectangle;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TERectangle = record
  private
    x,y,w,h:Tgint;
  end;
  PExRectangle = ^TERectangle;

function E_rectangle_get_type: TGType;
function Ex_person_new: PExRectangle;
function Ex_person_new_with_data(Name: Pgchar; age: Tgint): PExRectangle;
procedure Ex_person_set_name(self: PExRectangle; Name: Pgchar);
procedure Ex_person_set_age(self: PExRectangle; age: Tgint);
function Ex_person_get_name(self: PExRectangle): Pgchar;
function Ex_person_get_age(self: PExRectangle): Tgint;

function EX_TYPE_RECTANGLE: TGType;
function EX_RECTANGLE(obj: Pointer): PExRectangle;
function EX_IS_RECTANGLE(obj: Pointer): Tgboolean;


implementation

function e_rectangle_copy(boxed: Tgpointer): Tgpointer; cdecl;
var
  copy: Tgpointer;
begin
  Result:=nil;
  if boxed<>nil then begin
    copy:=g_malloc(SizeOf(TERectangle));
  end;

end;

procedure e_rectangle_free(boxed: Tgpointer); cdecl;
begin
    g_free(boxed);
end;

function E_rectangle_get_type: TGType;
const
  rectangle_type: TGType = 0;
var
  rectangle_info: TGTypeInfo;
begin
  if rectangle_type = 0 then begin
    rectangle_info.class_size := SizeOf(TERectangle);
    rectangle_info.base_init := nil;
    rectangle_info.base_finalize := nil;
    rectangle_info.class_init := nil;
    rectangle_info.class_finalize := nil;
    rectangle_info.class_data := nil;
    rectangle_info.instance_size := SizeOf(TERectangle);
    rectangle_info.n_preallocs := 0;
    rectangle_info.instance_init := nil;
    rectangle_info.value_table := nil;

    rectangle_type := g_boxed_type_register_static('ERectangle',@e_rectangle_copy, @e_rectangle_free);
  end;
  Result := rectangle_type;
end;

function Ex_person_new: PExRectangle;
begin
  Result := g_object_new(EX_TYPE_RECTANGLE, nil);
end;

function Ex_person_new_with_data(Name: Pgchar; age: Tgint): PExRectangle;
begin
  Result := g_object_new(EX_TYPE_RECTANGLE,
    'name', Name,
    'age', age,
    nil);
end;

procedure Ex_person_set_name(self: PExRectangle; Name: Pgchar);
begin
  g_object_set(self, 'name', Name, nil);
end;

function Ex_person_get_name(self: PExRectangle): Pgchar;
begin
  Result := self^.Name;
end;

procedure Ex_person_set_age(self: PExRectangle; age: Tgint);
begin
  self^.age := age;
end;

function Ex_person_get_age(self: PExRectangle): Tgint;
begin
  Result := self^.age;
end;

// ====

function EX_TYPE_RECTANGLE: TGType;
begin
  EX_TYPE_RECTANGLE := E_rectangle_get_type;
end;

function EX_RECTANGLE(obj: Pointer): PExRectangle;
begin
  Result := PExRectangle(g_type_check_instance_cast(obj, EX_TYPE_RECTANGLE));
end;

function EX_PERSON_CLASS(klass: Pointer): PExPersonClass;
begin
  Result := PExPersonClass(g_type_check_class_cast(klass, EX_TYPE_RECTANGLE));
end;

function EX_IS_RECTANGLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, EX_TYPE_RECTANGLE);
end;

function EX_IS_PERSON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, EX_TYPE_RECTANGLE);
end;

function EX_PERSON_GET_CLASS(obj: Pointer): PExPersonClass;
begin
  Result := PExPersonClass(PGTypeInstance(obj)^.g_class);
end;

end.
