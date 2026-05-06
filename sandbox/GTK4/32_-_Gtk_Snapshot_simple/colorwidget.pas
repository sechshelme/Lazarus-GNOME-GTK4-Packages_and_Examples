unit ColorWidget;

interface

uses
  fp_glib2, fp_GTK4;

type
  TColorWidget = record
    parent_instance: TGtkBox;
  end;
  PColorWidget = ^TColorWidget;

  TColorWidgetClass = record
    parent_class: TGtkBoxClass;
  end;
  PColorWidgetClass = ^TColorWidgetClass;

function color_widget_get_type: TGType;
function color_widget_new: PGTKWidget;

implementation

// ==== private

var
  parent_class: PColorWidgetClass = nil;
  signal_id: Tguint = 0;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);

  signal_id := g_signal_new('color-set', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE, 1, GDK_TYPE_RGBA);
end;

procedure new_color_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  s: pchar absolute user_data;
  col: TGdkRGBA;
begin
  gdk_rgba_parse(@col, s);
  g_signal_emit(gtk_widget_get_parent(widget), signal_id, 0, @col);
  WriteLn('red');
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
const
  cols: array of pchar = ('red', 'green', 'blue', 'yellow');
var
  self: PColorWidget absolute instance;
  button, image: PGtkWidget;
  i: integer;
  c: TGdkRGBA;
  bytes: PGBytes;
  texture: PGdkTexture;
begin
  gtk_orientable_set_orientation(GTK_ORIENTABLE(self), GTK_ORIENTATION_HORIZONTAL);

  for i := 0 to Length(cols) - 1 do begin
    gdk_rgba_parse(@c, cols[i]);
    bytes := g_bytes_new(@c, SizeOf(TGdkRGBA));
    texture := gdk_memory_texture_new(1, 1, GDK_MEMORY_R32G32B32A32_FLOAT, bytes, 4 * 4);
    g_bytes_unref(bytes);
    image := gtk_image_new_from_paintable(GDK_PAINTABLE(texture));
    g_object_unref(texture);

    button := gtk_button_new;
    gtk_box_append(GTK_BOX(self), button);
    gtk_button_set_child(GTK_BUTTON(button), image);

    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_cp), cols[i]);
  end;
end;


// ==== public

function color_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_BOX, 'ColorWidget', SizeOf(TColorWidgetClass), @class_init, SizeOf(TColorWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function color_widget_new: PGTKWidget;
var
  self: PColorWidget absolute Result;
begin
  Result := g_object_new(color_widget_get_type, nil);
end;

end.
