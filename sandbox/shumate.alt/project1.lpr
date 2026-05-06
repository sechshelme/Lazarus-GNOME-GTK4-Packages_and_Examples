program project1;

uses

shumate_compass,
shumate_coordinate,
shumate_data_source,
shumate_data_source_request,
shumate_enum_types,
shumate_file_cache,
shumate_layer,
shumate_license,
shumate_location,
shumate_map,
shumate_map_layer,
shumate_map_source,
shumate_map_source_registry,
shumate_marker,
shumate_marker_layer,
shumate_marshal,
shumate_path_layer,
shumate_point,
shumate_raster_renderer,
shumate_scale,
shumate_simple_map,
shumate_symbol_event,
shumate_tile,
shumate_tile_downloader,
shumate_user_agent,
shumate_vector_reader,
shumate_vector_reader_iter,
shumate_vector_renderer,
shumate_vector_sprite,
shumate_vector_sprite_sheet,
shumate_version,
shumate_viewport,

  fp_glib2,
  fp_GTK4, fp_shumate;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  begin
    g_print('Hello World'#10);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  const
//    path1 = '/home/tux/Schreibtisch/sound/test.mp3';
  //  path2 = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Example/pixbuf/30_-_Animation/pinguin.gif';
  var
    window, box, button, picture: PGtkWidget;
    media_file: PGtkMediaStream;
    err: PGError;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    media_file := gtk_media_file_new_for_filename(path1);
    if gtk_media_stream_is_prepared(media_file) then begin
      WriteLn('io');
    end;

    err := gtk_media_stream_get_error(media_file);
    if err <> nil then begin
      WriteLn('error: ',err^.message );
      g_free(err);
    end;

    if gtk_media_stream_has_video(media_file) then begin
      WriteLn('video');
    end;
    if gtk_media_stream_has_audio(media_file) then begin
      WriteLn('audio');
    end;
    //    gtk_media_stream_set_loop(GTK_MEDIA_STREAM(media_file), True);
    //    gtk_media_stream_set_playing(GTK_MEDIA_STREAM(media_file), True);
    gtk_media_stream_play(media_file);

    picture := gtk_picture_new_for_paintable(GDK_PAINTABLE(media_file));
    gtk_widget_set_vexpand(picture, True);
    gtk_widget_set_hexpand(picture, True);
    gtk_box_append(GTK_BOX(box), picture);

    button := gtk_button_new_with_label('Hello World');

    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);

    gtk_box_append(GTK_BOX(box), button);

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
