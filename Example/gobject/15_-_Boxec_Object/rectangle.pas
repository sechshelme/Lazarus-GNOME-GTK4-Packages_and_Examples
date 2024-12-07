unit Rectangle;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TERectangle = record
    x, y, w, h: Tgint;
  end;
  PERectangle = ^TERectangle;

function e_rectangle_get_type: TGType;
function e_rectangle_move(r: PERectangle; x, y: Tgint): Tgpointer; cdecl;
function e_rectangle_copy(boxed: Tgpointer): Tgpointer; cdecl;
procedure e_rectangle_free(boxed: Tgpointer); cdecl;

function E_TYPE_RECTANGLE: TGType;
function E_RECTANGLE(obj: Pointer): PERectangle;
function E_IS_RECTANGLE(obj: Pointer): Tgboolean;


implementation

function e_rectangle_move(r: PERectangle; x, y: Tgint): Tgpointer; cdecl;
begin
  if r <> nil then begin
    r^.x += x;
    r^.y += y;
  end;
end;

function e_rectangle_copy(boxed: Tgpointer): Tgpointer; cdecl;
var
  copy: PERectangle absolute Result;
  r: PERectangle absolute boxed;
begin
  Result := nil;
  if r <> nil then begin
    copy := g_malloc(SizeOf(TERectangle));
    copy^ := r^;
  end;
end;

procedure e_rectangle_free(boxed: Tgpointer); cdecl;
begin
  g_free(boxed);
end;

function e_rectangle_get_type: TGType;
const
  rectangle_type: TGType = 0;
begin
  if rectangle_type = 0 then begin
    rectangle_type := g_boxed_type_register_static('ERectangle', @e_rectangle_copy, @e_rectangle_free);
  end;
  Result := rectangle_type;
end;

// ====

function E_TYPE_RECTANGLE: TGType;
begin
  E_TYPE_RECTANGLE := e_rectangle_get_type;
end;

function E_RECTANGLE(obj: Pointer): PERectangle;
begin
  Result := PERectangle(g_type_check_instance_cast(obj, E_TYPE_RECTANGLE));
end;

function E_IS_RECTANGLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, E_TYPE_RECTANGLE);
end;

end.
