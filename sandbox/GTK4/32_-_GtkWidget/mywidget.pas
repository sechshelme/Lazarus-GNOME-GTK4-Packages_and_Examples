unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4;

type
  TMyWidget = record
    parent_instance: TGtkBox;
    cols, rows: Tgint;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkBoxClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

  TMyWidgetPrivate = record
    testdata:Integer;
  end;
  PMyWidgetPrivate = ^TMyWidgetPrivate;

function my_widget_get_type: TGType;
function my_widget_new(c, r: Tguint): PGtkWidget;
procedure my_widget_set_coords(w: PMyWidget; c, r: Tguint);

function MY_TYPE_WIDGET: TGType;
function MY_WIDGET(obj: Pointer): PMyWidget;
function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
function MY_IS_WIDGET(obj: Pointer): Tgboolean;
function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;

implementation

// ==== private

var
  my_widget_parent_class: PMyWidgetClass = nil;
  age_signal_id: Tguint = 0;

const
  BtnKey = 'btnKey';

procedure init(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin
end;

procedure set_property(obj: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PMyWidget;
  priv: PMyWidgetPrivate;
begin
  self := MY_WIDGET(obj);

  priv := g_type_instance_get_private(PGTypeInstance(self), my_widget_get_type);
  priv^.testdata:=1234;


  case property_id of
    1: begin
      self^.cols := g_value_get_uint(Value);
    end;
    2: begin
      self^.rows := g_value_get_uint(Value);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, property_id, pspec);
    end;
  end;

//  if gtk_widget_get_root(GTK_WIDGET(self)) <> nil then begin
    my_widget_set_coords(self, self^.cols, self^.rows);
//  end;
end;

procedure get_property(obj: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PMyWidget;
  priv: PMyWidgetPrivate;
begin
  self := MY_WIDGET(obj);

  priv := g_type_instance_get_private(PGTypeInstance(self), my_widget_get_type);
WriteLn( priv^.testdata);

  case property_id of
    1: begin
      g_value_set_uint(Value, self^.cols);
    end;
    2: begin
      g_value_set_uint(Value, self^.rows);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, property_id, pspec);
    end;
  end;
end;

procedure constructed(obj: PGObject); cdecl;
var
  self: PMyWidget;
begin
  G_OBJECT_CLASS(my_widget_parent_class)^.constructed(obj);
  self := MY_WIDGET(obj);
  my_widget_set_coords(self, self^.cols, self^.rows);
end;

procedure finalize(obj: PGObject); cdecl;
var
  self: PMyWidget;
begin
  self := MY_WIDGET(obj);

  G_OBJECT_CLASS(my_widget_parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(g_class);
  object_class^.set_property := @set_property;
  object_class^.get_property := @get_property;

  object_class^.finalize := @finalize;
  object_class^.constructed := @constructed;
  my_widget_parent_class := g_type_class_peek_parent(g_class);

  spec := g_param_spec_uint('columns', 'Columns', 'Columns of the MyWidget', 1, G_MAXUINT, 3, G_PARAM_READWRITE or G_PARAM_CONSTRUCT);
  g_object_class_install_property(object_class, 1, spec);
  spec := g_param_spec_uint('rows', 'Rows', 'Rows of the MyWidget', 1, G_MAXUINT, 3, G_PARAM_READWRITE or G_PARAM_CONSTRUCT);
  g_object_class_install_property(object_class, 2, spec);

  age_signal_id := g_signal_new('clicked', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE,
    1, G_TYPE_INT);
end;

procedure click_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self: PMyWidget absolute user_data;
  nr: PtrInt;
  q: Pgchar;
  detail: TGQuark;
begin
  nr := PtrInt(g_object_get_data(G_OBJECT(widget), BtnKey));
  q := g_strdup_printf('%d', nr);
  detail := g_quark_from_string(q);
  g_signal_emit(self, age_signal_id, detail, nr);
  g_free(q);
end;



// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_BOX, 'MyWidget', SizeOf(TMyWidgetClass), @class_init, SizeOf(TMyWidget), @init, 0);
    g_once_init_leave(@type_id, id);
      g_type_add_instance_private(type_id, sizeof(TMyWidgetPrivate));
  end;
  Result := type_id;
end;

function my_widget_new(c, r: Tguint): PGtkWidget;
var
  self: PMyWidget;
begin
  self := g_object_new(MY_TYPE_WIDGET, 'orientation', GTK_ORIENTATION_VERTICAL, 'columns', c, 'rows', r, nil);
  Result := GTK_WIDGET(self);
end;

procedure my_widget_set_coords(w: PMyWidget; c, r: Tguint);
var
  grid, button, old_grid: PGtkWidget;
  i: integer;
  lab: Pgchar;
  cnt: Tguint;
begin
  w^.cols := c;
  w^.rows := r;

  g_object_notify(G_OBJECT(w), 'columns');
  g_object_notify(G_OBJECT(w), 'rows');

  old_grid := gtk_widget_get_first_child(GTK_WIDGET(w));
  if old_grid <> nil then begin
    gtk_box_remove(GTK_BOX(w), old_grid);
  end;

  grid := gtk_grid_new;
  gtk_grid_set_column_spacing(GTK_GRID(grid), 5);
  gtk_grid_set_row_spacing(GTK_GRID(grid), 5);
  gtk_box_append(GTK_BOX(w), grid);

  cnt := c * r;

  for i := 0 to cnt - 1 do begin
    lab := g_strdup_printf('%d', i);
    button := gtk_button_new_with_label(lab);
    g_free(lab);
    g_object_set_data(G_OBJECT(button), BtnKey, Pointer(i));

    gtk_grid_attach(GTK_GRID(grid), button, i mod c, i div c, 1, 1);
    g_signal_connect(button, 'clicked', G_CALLBACK(@click_cp), w);
  end;
end;

// ====

function MY_TYPE_WIDGET: TGType;
begin
  Result := my_widget_get_type;
end;

function MY_WIDGET(obj: Pointer): PMyWidget;
begin
  Result := PMyWidget(g_type_check_instance_cast(obj, MY_TYPE_WIDGET));
end;

function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(g_type_check_class_cast(klass, MY_TYPE_WIDGET));
end;

function MY_IS_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MY_TYPE_WIDGET);
end;

function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, MY_TYPE_WIDGET);
end;

function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(PGTypeInstance(obj)^.g_class);
end;


end.
