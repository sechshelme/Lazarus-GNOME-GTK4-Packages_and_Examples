program project1;

uses
  poppler,
  poppler_action,
  poppler_annot,
  poppler_attachment,
  poppler_date,
  poppler_document,
  poppler_enums,
  poppler_features,
  poppler_form_field,
  poppler_layer,
  poppler_media,
  poppler_movie,
  poppler_page,
  poppler_structure_element,




  Math,
  ctypes,
  fp_cairo,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

var
  document: PPopplerDocument = nil;
  page: PPopplerPage = nil;



  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    pdf_width, pdf_height, scale_x, scale_y, scale: double;
  begin
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    poppler_page_get_size(page, @pdf_width, @pdf_height);

    scale_x := width / pdf_width;
    scale_y := height / pdf_height;
    if scale_x < scale_y then begin
      scale := scale_x;
    end else begin
      scale := scale_y;
    end;

    cairo_scale(cr, scale, scale);

    poppler_page_render(page, cr);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, drawing_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
    path_uri: Pgchar;
    err: PGError = nil;
  begin
    path_uri := g_filename_to_uri('/home/tux/Downloads/1553760606.pdf', nil, @err);
    if path_uri = nil then begin
      g_printerr('g_filename_to_uri()   %s'#10, err^.message);
      g_error_free(err);
    end;

    document := poppler_document_new_from_file(path_uri, nil, @err);
    g_free(path_uri);
    if document = nil then begin
      g_printerr('poppler_document_new_from_file()   %s'#10, err^.message);
      g_error_free(err);
    end;

    page := poppler_document_get_page(document, 0);
    if page = nil then begin
      g_printerr('poppler_document_get_page()'#10);
      g_object_unref(document);
      g_error_free(err);
    end;


    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);

    g_object_unref(page);
    g_object_unref(document);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.

