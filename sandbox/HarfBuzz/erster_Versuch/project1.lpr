program project1;

uses
  hb_common,
  hb_buffer,


  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  begin
    g_print('Click'#10);
  end;


var
  surface:Pcairo_surface_t=nil;
  cr:Pcairo_t=nil              ;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin
    cairo_set_source_surface(cr, surface, 0.8, 0.8);
    cairo_paint(cr);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, drawing_area: PGtkWidget;
     const text:Pgchar = 'Hello, HarfBuzz! ÄÖÜöäüÿŸlllwww';
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 100);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    drawing_area := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_set_size_request(drawing_area, 300, 300);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_box_append(GTK_BOX(box), button);

    // ==========

     surface:=cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 400, 100);
     cr:=cairo_create(surface);
     cairo_set_source_rgb(cr, 1.0,1.0,1.0);
     cairo_paint(cr);

     buf:=hb_buffer_create;





     cairo_select_font_face(cr, 'Sans',CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
     cairo_set_font_size(cr, 18);



     cairo_set_source_rgb(cr, 0.0,0.0,0.0);


    // ==========
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
