unit ImageWindow;

interface

uses
  fp_cairo,
  fp_glib2,
  fp_GTK4,
  fp_GDK4,
  fp_gdk_pixbuf2,
  fp_GLIBTools;

procedure CreateImageWindow(app: PGtkApplication);

implementation

var
  image: PGtkWidget;

function timer_func(user_data: Tgpointer): Tgboolean; cdecl;
var
  iter: PGdkPixbufAnimationIter absolute user_data;
  pixbuf: PGdkPixbuf;
begin
  pixbuf := gdk_pixbuf_animation_iter_get_pixbuf(iter);
  gtk_image_set_from_pixbuf(GTK_IMAGE(image), pixbuf);

  gdk_pixbuf_animation_iter_advance(iter, nil);
end;

procedure CreateImageWindow(app: PGtkApplication);
var
  window, box, Label1: PGtkWidget;
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
    'title', 'Pixbuf Demo (Image)',
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

  image := g_object_new(GTK_TYPE_IMAGE,
    'width-request', AniProp.Width,
    'height-request', AniProp.Height,
    nil);
  gtk_box_append(GTK_BOX(box), image);

  AniProp.delay := gdk_pixbuf_animation_iter_get_delay_time(iter);
  g_timeout_add(AniProp.delay, @timer_func, iter);

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
