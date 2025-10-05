unit CairoWindow;

interface

uses
  fp_cairo,
  fp_glib2,
  fp_GTK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

procedure CreateCairoWindow(app: PGtkApplication);

implementation

procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
var
  pixbuf: PGdkPixbuf;
  iter: PGdkPixbufAnimationIter absolute user_data;
begin
  gdk_pixbuf_animation_iter_advance(iter, nil);

  pixbuf := gdk_pixbuf_animation_iter_get_pixbuf(iter);
  if pixbuf <> nil then begin
    gdk_cairo_set_source_pixbuf(cr, pixbuf, 0, 0);
  end;

  cairo_paint(cr);
end;

function timer_func(user_data: Tgpointer): Tgboolean; cdecl;
var
  drawing_area: PGtkWidget absolute user_data;
begin
  gtk_widget_queue_draw(drawing_area);
  Result := G_SOURCE_CONTINUE;
end;

procedure CreateCairoWindow(app: PGtkApplication);
var
  window, drawing_area, box, Label1: PGtkWidget;
  animation: PGdkPixbufAnimation;
  iter: PGdkPixbufAnimationIter;

  err: PGError;

  AniProp: record
    Width, Height, delay: longint;
      end;

  pc: Pgchar;

begin
  window := g_object_new(GTK_TYPE_WINDOW,
    'application', app,
    'title', 'Pixbuf Demo (Cairo)',
    'default-width', 200,
    'default-height', 200,
    'resizable', gTrue,
    nil);

  box := g_object_new(GTK_TYPE_BOX,
    'orientation', GTK_ORIENTATION_VERTICAL,
    'hexpand', gTrue,
    'vexpand', gTrue,
    'margin-start', 10,
    'margin-end', 10,
    'margin-top', 10,
    'margin-bottom', 10,
    'spacing', 10,
    nil);

  err := nil;
  animation := gdk_pixbuf_animation_new_from_file('pinguin.gif', @err);
  if animation = nil then begin
    g_printerr('Ungültige Animations-Datei !'#10);
    g_printerr('  Fehlerbereich: %s'#10, g_quark_to_string(err^.domain));
    g_printerr('  Fehlercode: %d'#10, err^.code);
    g_printerr('  Fehlermeldung: %s#10', err^.message);
    g_error_free(err);
    Exit;
  end;
  AniProp.Width := gdk_pixbuf_animation_get_width(animation);
  AniProp.Height := gdk_pixbuf_animation_get_height(animation);

  iter := gdk_pixbuf_animation_get_iter(animation, nil);
  g_object_unref(animation);

  drawing_area := g_object_new(GTK_TYPE_DRAWING_AREA,
    'width-request', AniProp.Width,
    'height-request', AniProp.Height,
    nil);
  gtk_box_append(GTK_BOX(box), drawing_area);
  gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, iter, nil);

  AniProp.delay := gdk_pixbuf_animation_iter_get_delay_time(iter);
  g_timeout_add(AniProp.delay, @timer_func, drawing_area);

  pc := g_malloc(100);
  g_snprintf(pc, 100, '<b>Animation:</b> '#10'  <b>width:</b> %d'#10'  <b>height:</b> %d'#10'  <b>delay:</b> %dms'#10, AniProp.Width, AniProp.Height, AniProp.delay);
  Label1 := g_object_new(GTK_TYPE_LABEL,
    'label', pc,
    'use-markup', gTrue,
    nil);
  g_free(pc);

  gtk_box_append(GTK_BOX(box), Label1);

  gtk_window_set_child(GTK_WINDOW(window), box);
  gtk_window_present(GTK_WINDOW(window));
end;


end.
