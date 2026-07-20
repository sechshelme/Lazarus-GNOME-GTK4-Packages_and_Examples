program project1;

// diff -U 1 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/gtk-4.14.2/C-include/gtk/gtkslicelistmodel.h /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/gtk-4.22.4/C-include/gtk-4.0/gtk/gtkslicelistmodel.h > test.diff
uses
  rtsp_address_pool,

    rtsp_context,

  rtsp_thread_pool,
  rtsp_session_media,
  rtsp_session,
  rtsp_session_pool,

  rtsp_mount_points,


  rtsp_client,

  rtsp_stream_transport,
  rtsp_stream,

  rtsp_sdp,


  rtsp_media,



  rtsp_server_object,



  rtsp_auth,
  rtsp_media_factory,
  rtsp_media_factory_uri,
  rtsp_onvif_client,
  rtsp_onvif_media,
  rtsp_onvif_media_factory,
  rtsp_onvif_server,
  rtsp_params,
  rtsp_permissions,
  rtsp_server,
  rtsp_token,



  fp_gst_sdp,
  fp_gst_rtsp,
  fp_gst_vulkan,
  fp_gst_audio,
  fp_gst_video,
  fp_gst_gl,
  fp_gst_base,
  fp_gst,

  fp_girepository_2,
  fp_glib_unix,
  fp_gio_unix_2,
  fp_GTK4,
  fp_glib2;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: integer = 0;
  var
    s: Pgchar;
  begin
    Inc(counter);
    s := g_strdup_printf('Ich wurde %d gelickt', counter);
    gtk_button_set_label(GTK_BUTTON(widget), s);
    g_free(s);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button: PGtkWidget;
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

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
    pipeline: PGstElement;
    bus: PGstBus;
    msg: PGstMessage;
  begin
    gst_init(@argc, @argv);
    pipeline := gst_parse_launch('playbin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm', nil);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    bus := gst_element_get_bus(pipeline);
    msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_ERROR or GST_MESSAGE_EOS);

    if msg <> nil then  begin
      if msg^._type = GST_MESSAGE_ERROR then begin
        g_printerr('An error occurred!'#10);
      end;
      gst_message_unref(msg);
    end;

    gst_object_unref(bus);
    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);


    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
