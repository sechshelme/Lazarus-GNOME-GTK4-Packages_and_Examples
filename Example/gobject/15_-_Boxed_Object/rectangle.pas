unit Rectangle;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TERectangle = record
    private
    x, y, w, h: Tgint;
  end;
  PERectangle = ^TERectangle;

function e_rectangle_get_type: TGType;
function e_rectangle_new(x,y,w,h:Tgint):PERectangle;
procedure e_rectangle_move(r: PERectangle; x, y: Tgint);
procedure e_rectangle_resize(r: PERectangle; x, y: Tgint);
function e_rectangle_get_x(r: PERectangle):Tgint;
function e_rectangle_get_y(r: PERectangle):Tgint;
function e_rectangle_get_w(r: PERectangle):Tgint;
function e_rectangle_get_h(r: PERectangle):Tgint;

function E_TYPE_RECTANGLE: TGType;
function E_RECTANGLE(obj: Pointer): PERectangle;
function E_IS_RECTANGLE(obj: Pointer): Tgboolean;


implementation

function e_rectangle_new(x, y, w, h: Tgint): PERectangle;
begin
  Result:=g_malloc(SizeOf(TERectangle));
  Result^.x:=x;
  Result^.y:=y;
  Result^.w:=w;
  Result^.h:=h;
end;

procedure e_rectangle_move(r: PERectangle; x, y: Tgint);
begin
  if r <> nil then begin
    r^.x += x;
    r^.y += y;
  end;
end;

procedure e_rectangle_resize(r: PERectangle; x, y: Tgint);
begin
  if r <> nil then begin
    r^.w += x;
    r^.h += y;
  end;
end;

function e_rectangle_get_x(r: PERectangle): Tgint;
begin
  Result:=r^.x;
end;

function e_rectangle_get_y(r: PERectangle): Tgint;
begin
  Result:=r^.y;
end;

function e_rectangle_get_w(r: PERectangle): Tgint;
begin
  Result:=r^.w;
end;

function e_rectangle_get_h(r: PERectangle): Tgint;
begin
  Result:=r^.h;
end;

function e_rectangle_copy(boxed: Tgpointer): Tgpointer; cdecl;
begin
  Result := nil;
  if boxed <> nil then begin
    Result := g_memdup2(boxed, SizeOf(TERectangle));
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
