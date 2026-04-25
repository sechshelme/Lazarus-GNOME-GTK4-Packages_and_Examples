unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_mgl2, fp_graphene;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    gr: THMGL;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;
procedure my_widget_reset_data(self: PMyWidget);

implementation

// ==== private

function sample(gr: THMGL): longint; cdecl;
var
  y0, y1, y2, y3: THMDT;
  n: longint = 30;
begin
  y0 := mgl_create_data_size(n, 1, 1);
  mgl_data_modify(y0, '0.4*sin(2*pi*x)+0.3*cos(3*pi*x)-0.4*sin(4*pi*x)+0.2*rnd', 0);

  y1 := mgl_create_data_size(n, 1, 1);
  mgl_data_set(y1, y0);

  y2 := mgl_create_data_size(n, 1, 1);
  mgl_data_set(y2, y0);

  y3 := mgl_create_data_size(n, 1, 1);
  mgl_data_set(y3, y0);

  mgl_data_smooth(y1, 'line3', 0);
  mgl_data_smooth(y2, 'line5', 0);
  mgl_data_smooth(y3, 'quad5', 0);

  mgl_plot(gr, y0, 'k', '');
  mgl_add_legend(gr, 'NONE', 'k');
  mgl_plot(gr, y1, 'r', '');
  mgl_add_legend(gr, 'LINE_3', 'r');
  mgl_plot(gr, y2, 'g', '');
  mgl_add_legend(gr, 'LINE_5', 'g');
  mgl_plot(gr, y3, 'b', '');
  mgl_add_legend(gr, 'QUAD_5', 'b');
  mgl_legend(gr, 1, '', '');
  mgl_box_str(gr, 'w', 1);

  mgl_delete_data(y0);
  mgl_delete_data(y1);
  mgl_delete_data(y2);
  mgl_delete_data(y3);

  Result := 0;
end;

var
  parent_class: PMyWidgetClass = nil;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
  r: Tgraphene_rect_t;
  width, height: integer;
  texture: PGdkTexture;
  bytes: PGBytes;

  stride: longint;
  pixels: pbyte;

begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  if (width > 0) and (height > 0) then  begin
    with self^ do begin
      if (self^.gr = nil) or (mgl_get_width(self^.gr) <> width) or (mgl_get_height(self^.gr) <> height) then begin
        mgl_delete_graph(self^.gr);
        self^.gr := mgl_create_graph(width, height);
        mgl_set_def_sch(gr, 'w');
        mgl_rotate(gr, 60, 40, 0);
      end;

      mgl_clf(gr);
      mgl_fill_background(gr, 0.3, 0.3, 0.3, 1.0);

      stride := width * 4;

      //span := 1.0 / appData^.Mouse.zoom;
      //
      //x1 := -(appData^.Mouse.x / Width);
      //x2 := x1 + span;
      //
      //y1 := 1.0 + (appData^.Mouse.y / Height) - span;
      //y2 := y1 + span;
      //
      //mgl_zoom(gr, x1, y1, x2, y2);




      sample(gr);

      pixels := mgl_get_rgba(gr);

      bytes := g_bytes_new(pixels, height * stride);
      texture := gdk_memory_texture_new(width, height, GDK_MEMORY_R8G8B8A8, bytes, stride);

      graphene_rect_init(@r, 0, 0, width, height);

      gtk_snapshot_append_texture(snapshot, texture, @r);

      g_object_unref(texture);
      g_bytes_unref(bytes);
    end;
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    if gr <> nil then  begin
      mgl_delete_graph(gr);
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

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  with self^ do begin
    gr := nil;
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

procedure my_widget_reset_data(self: PMyWidget);
var
  w: PMyWidget absolute self;
begin
  with self^ do begin
  end;
  gtk_widget_queue_draw(GTK_WIDGET(w));
end;

end.
