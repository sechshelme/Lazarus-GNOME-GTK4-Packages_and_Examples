program project1;

uses
  ctypes,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin
    cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
    cairo_set_line_width(cr, 5.0);
    cairo_move_to(cr, 50.0, 50.0);
    cairo_line_to(cr, 350.0, 350.0);
    cairo_stroke(cr);

    cairo_set_source_rgb(cr, 0.0, 0.0, 1.0);
    cairo_arc(cr, 200.0, 200.0, 100.0, 0.0, 2 * G_PI);
    cairo_fill(cr);
  end;

type
  Tcmd = (cmQuit, cmPlus, cmMinus, cmDark, cmNoDark);

var
  FontScale: Tgint = 10;

  procedure button_click_cb({%H-}widget: PGtkWidget; Data: Tgpointer);
  var
    cmd: Tcmd absolute Data;
    app: PGApplication;
    windowList: PGList;
    ch: Pgchar;
  begin
    app := g_application_get_default;

    case cmd of
      cmQuit: begin
        windowList := gtk_application_get_windows(GTK_APPLICATION(app));
        gtk_window_close(GTK_WINDOW(windowList^.Data));
      end;
      cmMinus: begin
       Dec(FontScale);
        ch := g_strdup_printf('%d', FontScale);
        g_object_set(gtk_settings_get_default, 'gtk-font-name', ch, nil);
        g_free(ch);
      end;
      cmPlus: begin
        Inc(FontScale);
        ch := g_strdup_printf('%d', FontScale);
        g_object_set(gtk_settings_get_default, 'gtk-font-name', ch, nil);
        g_free(ch);
      end;
      cmDark: begin
        g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);
      end;
      cmNoDark: begin
        g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gFalse, nil);
      end;
    end;     WriteLn(FontScale);
  end;

  procedure createButton(parent: PGtkWidget; lab: Pgchar; cmd: Tcmd);
  var
    button: PGtkWidget;
  begin
    button := gtk_button_new_with_label(lab);
    gtk_widget_set_hexpand(button, True);
    gtk_widget_set_halign(button, GTK_ALIGN_CENTER);
    gtk_box_append(GTK_BOX(parent), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_click_cb), GINT_TO_POINTER(longint(cmd)));
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, box, drawing_area, button_box: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_box_append(GTK_BOX(box), button_box);

    createButton(button_box, 'Quit', cmQuit);
    createButton(button_box, 'Plus', cmPlus);
    createButton(button_box, 'Minus', cmMinus);
    createButton(button_box, 'Dark', cmDark);
    createButton(button_box, 'No Dark', cmNoDark);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    //    g_object_set (gtk_settings_get_default (),
    //                  'gtk-enable-animations', FALSE,
    //                  'gtk-font-name', 'Adwaita Sans 33',
    //                  'gtk-icon-theme-name', 'Adwaita',
    //                  'gtk-decoration-layout', ':close',
    //                  'gtk-hint-font-metrics', TRUE,
    ////                  'gtk-font-rendering', GTK_FONT_RENDERING_MANUAL,
    //                  nil);




    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
