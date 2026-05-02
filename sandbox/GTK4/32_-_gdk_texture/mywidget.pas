unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene, fp_pango;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PMyWidget;

implementation

// ==== private

var
  parent_class: PMyWidgetClass = nil;

procedure finalize_cp(obj: PGObject); cdecl;
var
  child: PGTKWidget;
begin
  child := gtk_widget_get_first_child(GTK_WIDGET(obj));
  while child <> nil do begin
    gtk_widget_unparent(child);
    child := gtk_widget_get_first_child(GTK_WIDGET(obj));
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
const
  TEXTURE_SIZE = 2;
  texture_data: array of Tguint8 = (255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 255, 255, 255, 255, 255);
var
  bytes: PGBytes;
  texture: PGdkTexture;
  picture: PGtkWidget;
begin
  bytes := g_bytes_new_static(Pguint8(texture_data), Length(texture_data));
  texture := gdk_memory_texture_new(TEXTURE_SIZE, TEXTURE_SIZE, GDK_MEMORY_R8G8B8A8, bytes, TEXTURE_SIZE * 4);

  g_bytes_unref(bytes);

  picture := gtk_picture_new_for_paintable(GDK_PAINTABLE(texture));
  g_object_unref(texture);

  gtk_picture_set_can_shrink(GTK_PICTURE(picture), True);

  gtk_picture_set_content_fit(GTK_PICTURE(picture), GTK_CONTENT_FIT_FILL);
  gtk_widget_set_parent(picture, GTK_WIDGET(self));
end;

procedure my_widget_class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  gtk_widget_class_set_layout_manager_type(GTK_WIDGET_CLASS(g_class), GTK_TYPE_BIN_LAYOUT);
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @my_widget_class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PMyWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

end.
