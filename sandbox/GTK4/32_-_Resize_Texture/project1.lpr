program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

type
  TAniData = record
  end;
  PAniData = ^TAniData;

const
  anyDataKey = 'anyKey';

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure anyData_free_cp(Data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute Data;
  begin
    g_free(anyData);
  end;


  function CreateTexture(w, h: integer): PGtkWidget;
  var
    bytes: PGBytes;
    texture: PGdkTexture;
    buffer: pbyte;
    i: integer;
    stride: integer;
  begin
    stride := w * 4;
    buffer := g_malloc(h * stride);

    for i := 0 to (h * stride) - 1 do begin
      buffer[i] := Random($FF);
    end;

    bytes := g_bytes_new_take(buffer, h * stride);
    texture := gdk_memory_texture_new(w, h, GDK_MEMORY_A8B8G8R8, bytes, stride);
    g_bytes_unref(bytes);

    Result := gtk_image_new_from_paintable(GDK_PAINTABLE(texture));

    g_object_unref(texture);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, image: PGtkWidget;
    anyData: PAniData;
    col: TGdkRGBA;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    col.SetItems(1, 0, 0, 1);
    image := CreateTexture(100, 100);
    gtk_widget_set_vexpand(image, True);
    gtk_widget_set_hexpand(image, True);

    gtk_box_append(GTK_BOX(box), image);

    anyData := g_malloc(SizeOf(TAniData));

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
