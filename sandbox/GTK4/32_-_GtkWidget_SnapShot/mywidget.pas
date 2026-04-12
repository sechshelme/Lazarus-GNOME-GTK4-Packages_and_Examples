unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkBox;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkBoxClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PMyWidget;

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

procedure my_widget_set_property(obj: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PMyWidget;
  ch: Pgchar;
begin
  self := MY_WIDGET(obj);
  case property_id of
    1: begin
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, property_id, pspec);
    end;
  end;
end;

procedure my_widget_get_property(obj: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PMyWidget;
begin
  self := MY_WIDGET(obj);
  case property_id of
    1: begin
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, property_id, pspec);
    end;
  end;
end;

procedure my_widget_finalize(obj: PGObject); cdecl;
var
  self: PMyWidget;
begin
  self := MY_WIDGET(obj);

  G_OBJECT_CLASS(my_widget_parent_class)^.finalize(obj);
end;

procedure my_widget_init(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
end;

procedure mysnapshoot(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  rect: Tgraphene_rect_t;
  color: TGdkRGBA;
  width, height: single;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);
  WriteLn(width: 4: 2, ' x ', height: 4: 2);

  graphene_rect_init(@rect, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @rect);

  graphene_rect_init(@rect, 0.0, 0.0, width, height);
  gdk_rgba_parse(@color, 'red');
  gtk_snapshot_append_color(snapshot, @color, @rect);

  graphene_rect_init(@rect, 10.0, 10.0, width - 20.0, height - 20.0);
  gdk_rgba_parse(@color, 'green');
  gtk_snapshot_append_color(snapshot, @color, @rect);

  gtk_snapshot_pop(snapshot);
end;

procedure my_widget_measure(widget: PGtkWidget; orientation: TGtkOrientation; for_size: longint; minimum: Plongint; natural: Plongint; minimum_baseline: Plongint; natural_baseline: Plongint); cdecl;
begin
  //  if minimum <> nil then minimum^ := 100; // Mindestens 100px
  //  if natural <> nil then natural^ := 200; // Gerne 200px
end;

procedure my_widget_class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
  wc: PGtkWidgetClass;
begin
  object_class := G_OBJECT_CLASS(g_class);
  object_class^.set_property := @my_widget_set_property;
  object_class^.get_property := @my_widget_get_property;

  object_class^.finalize := @my_widget_finalize;
  my_widget_parent_class := g_type_class_peek_parent(g_class);

  wc := GTK_WIDGET_CLASS(g_class);
  wc^.snapshot := @mysnapshoot;
  wc^.measure := @my_widget_measure;


  //  spec := g_param_spec_string('gender', 'Gender', 'Gender of the human', nil, G_PARAM_READWRITE);
  //  g_object_class_install_property(object_class, 1, spec);

  age_signal_id := g_signal_new('clicked',
    G_TYPE_FROM_CLASS(g_class),
    G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED,
    0,
    nil,
    nil,
    nil,
    G_TYPE_NONE,
    1,
    G_TYPE_INT);
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @my_widget_class_init, SizeOf(TMyWidget), @my_widget_init, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PMyWidget;
begin
  Result := g_object_new(MY_TYPE_WIDGET, nil);
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
