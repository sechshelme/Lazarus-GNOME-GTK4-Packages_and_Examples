unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4;

type
  TMyWidget = record
    parent_instance: TGtkDrawingArea;
    x1, y1, x2, y2: double;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkDrawingAreaClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;
procedure my_widget_set_coords(self: PMyWidget; x1, y1, x2, y2: double);
procedure my_widget_get_coords(self: PMyWidget; x1, y1, x2, y2: Pdouble);

implementation

// ==== private

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  with self^ do begin
    x1 := 0.0;
    y1 := 0.0;
    x2 := 0.0;
    y2 := 0.0;
  end;
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_DRAWING_AREA, 'MyWidget', SizeOf(TMyWidgetClass), nil, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGTKWidget;
var
  self: PMyWidget absolute Result;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

procedure my_widget_set_coords(self: PMyWidget; x1, y1, x2, y2: double);
begin
  self^.x1 := x1;
  self^.y1 := y1;
  self^.x2 := x2;
  self^.y2 := y2;
end;

procedure my_widget_get_coords(self: PMyWidget; x1, y1, x2, y2: Pdouble);
begin
  x1^ := self^.x1;
  y1^ := self^.y1;
  x2^ := self^.x2;
  y2^ := self^.y2;
end;

end.
