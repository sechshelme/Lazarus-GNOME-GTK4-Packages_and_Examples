unit Rectangle;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TERectangle = record
  private
    x, y, w, h: Tgint;
    Name: Pgchar;
  end;
  PERectangle = ^TERectangle;

function e_rectangle_get_type: TGType;
function e_rectangle_new(x, y, w, h: Tgint; Name: Pgchar): PERectangle;
procedure e_rectangle_move(r: PERectangle; x, y: Tgint);
procedure e_rectangle_resize(r: PERectangle; x, y: Tgint);
function e_rectangle_get_x(r: PERectangle): Tgint;
function e_rectangle_get_y(r: PERectangle): Tgint;
function e_rectangle_get_w(r: PERectangle): Tgint;
function e_rectangle_get_h(r: PERectangle): Tgint;
function e_rectangle_get_name(r: PERectangle): Pgchar;
procedure e_rectangle_set_name(r: PERectangle; Name: Pgchar);

function E_TYPE_RECTANGLE: TGType;
function E_RECTANGLE(obj: Pointer): PERectangle;
function E_IS_RECTANGLE(obj: Pointer): Tgboolean;

implementation

// ==== privat

function e_rectangle_copy(boxed: Tgpointer): Tgpointer; cdecl;
var
  srcRect: PERectangle absolute boxed;
  desRect: PERectangle absolute Result;
begin
  desRect := g_memdup2(srcRect, SizeOf(TERectangle));
  if srcRect^.Name = nil then begin
    desRect^.Name := nil;
  end else begin
    desRect^.Name := g_strdup(srcRect^.Name);
  end;
end;

procedure e_rectangle_free(boxed: Tgpointer); cdecl;
var
  r: PERectangle absolute boxed;
begin
  if r^.Name <> nil then begin
    g_free(r^.Name);
  end;
  g_free(boxed);
end;

// ==== public

function e_rectangle_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_boxed_type_register_static('ERectangle', @e_rectangle_copy, @e_rectangle_free);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function e_rectangle_new(x, y, w, h: Tgint; Name: Pgchar): PERectangle;
begin
  Result := g_malloc(SizeOf(TERectangle));
  Result^.x := x;
  Result^.y := y;
  Result^.w := w;
  Result^.h := h;
  Result^.Name := g_strdup(Name);
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
  Result := r^.x;
end;

function e_rectangle_get_y(r: PERectangle): Tgint;
begin
  Result := r^.y;
end;

function e_rectangle_get_w(r: PERectangle): Tgint;
begin
  Result := r^.w;
end;

function e_rectangle_get_h(r: PERectangle): Tgint;
begin
  Result := r^.h;
end;

function e_rectangle_get_name(r: PERectangle): Pgchar;
begin
  Result := r^.Name;
end;

procedure e_rectangle_set_name(r: PERectangle; Name: Pgchar);
begin
  if r^.Name <> nil then begin
    g_free(r^.Name);
  end;
  r^.Name := g_strdup(Name);
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
