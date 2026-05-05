unit ColorWidget;

interface

uses
  fp_glib2, fp_GTK4;

type
  TColorWidget = record
    parent_instance: TGtkBox;
//    custom_color: PGdkRGBA;
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
  age_signal_id: Tguint = 0;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PColorWidget absolute obj;
begin
  with self^ do begin
//    g_free(custom_color);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);

  age_signal_id := g_signal_new('clicked', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE,    1, GDK_TYPE_RGBA);
end;

procedure new_color_r_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self:PGObject absolute user_data;
  col: TGdkRGBA;
begin
  gdk_rgba_parse(@col, 'red');
  g_signal_emit(self, age_signal_id, 0, @col);
  WriteLn('red');
end;

procedure new_color_g_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self:PGObject absolute user_data;
  col: TGdkRGBA;
begin
  gdk_rgba_parse(@col, 'lime');
  g_signal_emit(self, age_signal_id, 0, @col);
  WriteLn('red');
end;

procedure new_color_b_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self:PGObject absolute user_data;
  col: TGdkRGBA;
begin
  gdk_rgba_parse(@col, 'blue');
  g_signal_emit(self, age_signal_id, 0, @col);
  WriteLn('red');
end;

function CreateTexture(col: PGdkRGBA): PGtkWidget;
var
  bytes: PGBytes;
  texture: PGdkTexture;
begin
  bytes := g_bytes_new(@col^, SizeOf(TGdkRGBA));
  texture := gdk_memory_texture_new(1, 1, GDK_MEMORY_R32G32B32A32_FLOAT, bytes, 4 * 4);
  g_bytes_unref(bytes);
  Result := gtk_image_new_from_paintable(GDK_PAINTABLE(texture));
  g_object_unref(texture);
end;

function CreateColorButton(parent: PGtkWidget; col: pchar): PGtkWidget;
var
  c: TGdkRGBA;
  image: PGtkWidget;
begin
  gdk_rgba_parse(@c, col);
  image := CreateTexture(@c);
  Result := gtk_button_new;
  gtk_box_append(GTK_BOX(parent), Result);
  gtk_button_set_child(GTK_BUTTON(Result), image);
end;


procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PColorWidget absolute instance;
  button: PGtkWidget;
begin
    gtk_orientable_set_orientation(GTK_ORIENTABLE(self), GTK_ORIENTATION_HORIZONTAL);

    button := CreateColorButton(GTK_WIDGET( self), 'red');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_r_cp), self);

    button := CreateColorButton(GTK_WIDGET( self), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_g_cp), self);

    button := CreateColorButton(GTK_WIDGET( self), 'blue');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_b_cp),self);
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
