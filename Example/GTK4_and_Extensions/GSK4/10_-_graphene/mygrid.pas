unit MyGrid;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyGrid = record
    parent_instance: TGtkGrid;
  end;
  PMyGrid = ^TMyGrid;

  TMyGridClass = record
    parent_class: TGtkGridClass;
  end;
  PMyGridClass = ^TMyGridClass;

function my_grid_get_type: TGType;
function my_grid_new: PGTKWidget;
procedure my_grid_set_spacing(self: PMyGrid; spacing: integer);

implementation

// ==== private

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyGrid absolute instance;
begin
  my_grid_set_spacing(self, 5);
end;

// ==== public

function my_grid_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_GRID, 'MyGrid', SizeOf(TMyGridClass), nil, SizeOf(TMyGrid), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_grid_new: PGTKWidget;
begin
  Result := g_object_new(my_grid_get_type, nil);
end;

procedure my_grid_set_spacing(self: PMyGrid; spacing: integer);
var
  grid: PGtkGrid absolute self;
begin
  gtk_grid_set_column_spacing(GTK_GRID(grid), spacing);
  gtk_grid_set_row_spacing(GTK_GRID(grid), spacing);
  gtk_widget_set_margin_top(GTK_WIDGET(grid), spacing);
  gtk_widget_set_margin_start(GTK_WIDGET(grid), spacing);
  gtk_widget_set_margin_end(GTK_WIDGET(grid), spacing);
  gtk_widget_set_margin_bottom(GTK_WIDGET(grid), spacing);
end;

end.
