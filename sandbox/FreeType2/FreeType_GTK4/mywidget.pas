unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    buffer: PByte;
    buffer_width: Integer;
    buffer_height: Integer;
    buffer_stride: Integer;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;

implementation

var
  parent_class: PMyWidgetClass = nil;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
  r: Tgraphene_rect_t;
  w, h, y, x, pixel_idx: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
begin
  w := gtk_widget_get_width(widget);
  h := gtk_widget_get_height(widget);

  if (w <= 0) or (h <= 0) then Exit;

  with self^ do begin
    if (w > buffer_width) or (h > buffer_height) then begin
      if buffer <> nil then g_free(buffer);

      buffer_stride := w * 4;
      buffer := g_malloc(h * buffer_stride);
      buffer_width := w;
      buffer_height := h;
    end;

    for y := 0 to h - 1 do begin
      for x := 0 to w - 1 do begin
        pixel_idx := (y * buffer_stride) + (x * 4);

        buffer[pixel_idx + 0] := Random($FF);
        buffer[pixel_idx + 1] := Random($FF);
        buffer[pixel_idx + 2] := Random($FF);
        buffer[pixel_idx + 3] := $FF;
      end;
    end;

    bytes := g_bytes_new_static(buffer, buffer_height * buffer_stride);
      texture := gdk_memory_texture_new(w, h, GDK_MEMORY_R8G8B8A8, bytes, buffer_stride);
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
    if buffer <> nil then begin
      g_free(buffer);
      buffer := nil;
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

function tick_cp(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  with self^ do begin
    buffer := nil;
    buffer_width := 0;
    buffer_height := 0;
    buffer_stride := 0;

    gtk_widget_add_tick_callback(GTK_WIDGET(self), @tick_cp, self, nil);
  end;
end;

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
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

end.

