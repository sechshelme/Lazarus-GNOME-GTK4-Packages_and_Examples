unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

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
function my_widget_new: PGTKWidget;

implementation

// ==== private

var
  parent_class: PMyWidgetClass = nil;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  r: Tgraphene_rect_t;
  w, h: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
  buffer: pbyte;
  stride, i: integer;
begin
  w := gtk_widget_get_width(widget);
  h := gtk_widget_get_height(widget);

  if (w > 0) and (h > 0) then  begin
    stride := w * 4;
    buffer := g_malloc(h * stride);
    for i := 0 to (h * stride) - 1 do begin
      buffer[i] := Random($FF);
    end;

    bytes := g_bytes_new_take(buffer, h * stride);
    texture := gdk_memory_texture_new(w, h, GDK_MEMORY_A8B8G8R8, bytes, stride);

    graphene_rect_init(@r, 0, 0, w, h);

    gtk_snapshot_append_texture(snapshot, texture, @r);

    g_object_unref(texture);
    g_bytes_unref(bytes);
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  with self^ do begin
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
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @class_init, SizeOf(TMyWidget), @init_cp, 0);
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

end.
