program project1;

// https://github.com/hughsie/colord-gtk

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GTK4,

  cd_version,
  cd_enum,
  cd_color,
  cd_math,
  cd_spectrum,

  cd_buffer,
  cd_edid,               // cd_color
  cd_icc,                // cd_color, cd_edid,
  cd_icc_store,          // cd_icc
  cd_icc_utils,          // cd_icc, cd_math
  cd_device,
  cd_device_sync,        // cd_device
  cd_sensor,             // cd_color, cd_spectrum,
  cd_client,             // cd_sensor, cd_device
  cd_client_sync,        // cd_client, cd_icc, cd_device, cd_icc, cd_sensor
  cd_dom,
  cd_interp,
  cd_interp_akima,       // cd_interp
  cd_interp_linear,      // cd_interp
  cd_it8,                // cd_color, cd_math, cd_spectrum
  cd_it8_utils,          // cd_it8, cd_spectrum, cd_color
  cd_profile,            // cd_icc
  cd_profile_sync,
  cd_quirk,
  cd_sensor_sync,        // cd_sensor, cd_color, cd_spectrum
  cd_transform,          // cd_icc

  fp_colord_gtk4,
  fp_colord,
  fp_colord_session;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  const
    counter: cint = 0;
  begin
    g_print('Hello World'#10);

    Inc(counter);
    gtk_button_set_label(GTK_BUTTON(widget), pchar('Ich wurde ' + IntToStr(counter) + ' gelickt'));
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, cdsamplewidget: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);

    cdsamplewidget := cd_sample_widget_new;
    gtk_widget_set_size_request(cdsamplewidget, 150, 50);
    gtk_box_append(GTK_BOX(box), cdsamplewidget);

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
