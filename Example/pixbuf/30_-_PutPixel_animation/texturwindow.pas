unit TexturWindow;


interface

uses
  ctypes,
  fp_cairo,
  fp_glib2,
  fp_GTK4,
  fp_GDK4,
  fp_gdk_pixbuf2,

  fp_GLIBTools;

procedure CreateTexturWindow(app: PGtkApplication);

implementation

var
  picture: PGtkWidget;

function timer_func(user_data: Tgpointer): Tgboolean; cdecl;
var
  iter: PGdkPixbufAnimationIter absolute user_data;
  pixbuf: PGdkPixbuf;
  texture: PGtkWidget;
begin
  if gdk_pixbuf_animation_iter_advance(iter, nil) then begin
    pixbuf := gdk_pixbuf_animation_iter_get_pixbuf(iter);
   texture := gtk_image_new_from_pixbuf(pixbuf);
    if texture=nil then WriteLn(1234567);


    gtk_picture_set_paintable(GTK_PICTURE(picture), GDK_PAINTABLE(texture));
    g_object_unref(texture);
WriteLn('xxxxxxxxxxxx');
  end;


  Result := G_SOURCE_CONTINUE;
end;

procedure CreateTexturWindow(app: PGtkApplication);
var
  window, box, Label1: PGtkWidget;
  animation: PGdkPixbufAnimation;
  iter: PGdkPixbufAnimationIter;

  err: PGError;

  AniProp: record
    Width, Height, delay: longint;
      end;
  pc: Pgchar;
  pixbuf: PGdkPixbuf;
  texture: PGdkTexture;

begin
  // === Widget

  window := g_object_new(GTK_TYPE_WINDOW,
    'application', app,
    'title', 'Pixbuf Demo (Textur)',
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
    Exit;
  end;
  AniProp.Width := gdk_pixbuf_animation_get_width(animation);
  AniProp.Height := gdk_pixbuf_animation_get_height(animation);
  g_print('Animation width: %d'#10, AniProp.Width);
  g_print('Animation height: %d'#10, AniProp.Height);

  iter := gdk_pixbuf_animation_get_iter(animation, nil);

  picture := g_object_new(GTK_TYPE_PICTURE,
    'width-request', AniProp.Width,
    'height-request', AniProp.Height,
    nil);
  gtk_box_append(GTK_BOX(box), picture);

  pixbuf := gdk_pixbuf_animation_iter_get_pixbuf(iter);
  texture := gdk_texture_new_for_pixbuf(pixbuf);
  gtk_picture_set_paintable(GTK_PICTURE(picture), GDK_PAINTABLE(texture));


  //   gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(picture), @draw_func, iter, nil);

  AniProp.delay := gdk_pixbuf_animation_iter_get_delay_time(iter);
  g_timeout_add(AniProp.delay, @timer_func, iter);

  pc := g_malloc(100);
  g_snprintf(pc, 100, 'Animation: '#10'  width: %d'#10'  height: %d'#10'  delay: %dms'#10, AniProp.Width, AniProp.Height, AniProp.delay);
  Label1 := g_object_new(GTK_TYPE_LABEL,
    'label', pc,
    nil);

  g_free(pc);

  GObjectShowProperty(window);
  gtk_box_append(GTK_BOX(box), Label1);

  gtk_window_set_child(GTK_WINDOW(window), box);
  gtk_widget_show(window);
end;

end.
