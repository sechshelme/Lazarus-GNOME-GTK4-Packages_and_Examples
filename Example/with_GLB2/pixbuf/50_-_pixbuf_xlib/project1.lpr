program project1;

uses
  x,
  xlib,
  fp_glib2,
  fp_gdk_pixbuf_xlib2,
  fp_gdk_pixbuf2;


  procedure main;
  var
    display: PDisplay;
    screen: Integer;
    win, rw: TWindow;
    pixbuf: PGdkPixbuf;
    err: PGError = nil;
  begin
    display := XOpenDisplay(nil);
    screen := DefaultScreen(display);
    rw := RootWindow(display, screen);
    win := XCreateSimpleWindow(display, rw, 100, 100, 400, 300, 1, BlackPixel(display, screen), WhitePixel(display, screen));
    XMapWindow(display, win);

    gdk_pixbuf_xlib_init(display, screen);

    pixbuf := gdk_pixbuf_new_from_file('bild.png', @err);
    if pixbuf = nil then begin
      g_printf('Fehler beim Laden des Bildes: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;
    g_printf('Size: %d x %d'#10, gdk_pixbuf_get_width(pixbuf), gdk_pixbuf_get_height(pixbuf));

    XFlush(display);
    g_usleep(1000000);

    gdk_pixbuf_xlib_render_to_drawable(pixbuf, win, DefaultGC(display, screen), 0, 0, 0, 0, gdk_pixbuf_get_width(pixbuf), gdk_pixbuf_get_height(pixbuf), XLIB_RGB_DITHER_NORMAL, 0, 0);

    XFlush(display);

    g_usleep(5000000);

    g_object_unref(pixbuf);
    XDestroyWindow(display, win);
    XCloseDisplay(display);
  end;

begin
  main;
end.
