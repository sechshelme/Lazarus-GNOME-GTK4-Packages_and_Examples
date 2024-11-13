program project1;

uses
  ctypes,
  glib280,
  GTK4,
  GDK4,
  gst124;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/toolkit-integration.html?gi-language=c

type
  TCustomData = record
    playbin: PGstElement;
    sink_widget, slider, streams_list: PGtkWidget;
    slider_update_signal_id: Tgulong;
    state: TGstState;
    duration: Tgint64;
  end;
  PCustomData = ^TCustomData;

  procedure play_cb(button: PGtkButton; Data: PCustomData); cdecl;
  begin
    gst_element_set_state(Data^.playbin, GST_STATE_PLAYING);
  end;

  procedure pause_cb(button: PGtkButton; Data: PCustomData); cdecl;
  begin
    gst_element_set_state(Data^.playbin, GST_STATE_PAUSED);
  end;

  procedure stop_cb(button: PGtkButton; Data: PCustomData); cdecl;
  begin
    gst_element_set_state(Data^.playbin, GST_STATE_READY);
  end;

  procedure delete_event_cb(widget: PGtkWidget; event: pgdkevent; Data: PCustomData); cdecl;
  begin
    stop_cb(nil, Data);
    //    gtk_main_quit();
  end;

  procedure slider_cb(range: PGtkRange; Data: PCustomData); cdecl;
  var
    Value: Tdouble;
  begin
    Value := gtk_range_get_value(GTK_RANGE(Data^.slider));
    gst_element_seek_simple(Data^.playbin, GST_FORMAT_TIME, GST_SEEK_FLAG_FLUSH or GST_SEEK_FLAG_KEY_UNIT, Round(Value * GST_SECOND));
  end;

  procedure activate(app: PGtkApplication; Data: PCustomData);
  var
    main_window, play_button, constrols, main_hbox, main_box,
    pause_button, stop_button: PGtkWidget;
  begin
    main_window := gtk_application_window_new(app);
    //  g_signal_connect(G_OBJECT(main_window), 'delete-event', G_CALLBACK(@delete_event_cb), data);

    play_button := gtk_button_new_from_icon_name('media-plaback-start');
    g_signal_connect(G_OBJECT(play_button), 'clicked', G_CALLBACK(@play_cb), Data);

    pause_button := gtk_button_new_from_icon_name('media-plaback-pause');
    g_signal_connect(G_OBJECT(pause_button), 'clicked', G_CALLBACK(@play_cb), Data);

    stop_button := gtk_button_new_from_icon_name('media-plaback-stop');
    g_signal_connect(G_OBJECT(stop_button), 'clicked', G_CALLBACK(@play_cb), Data);

    Data^.slider := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 100, 1);
    gtk_scale_set_draw_value(GTK_SCALE(Data^.slider), gFalse);
    Data^.slider_update_signal_id := g_signal_connect(G_OBJECT(Data^.slider), 'value-changed', G_CALLBACK(@slider_cb), Data);

    Data^.streams_list := gtk_text_view_new;
    gtk_text_view_set_editable(GTK_TEXT_VIEW(Data^.streams_list), gFalse);

    constrols := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(constrols), play_button);
    gtk_box_append(GTK_BOX(constrols), pause_button);
    gtk_box_append(GTK_BOX(constrols), stop_button);
    gtk_box_append(GTK_BOX(constrols), Data^.slider);

    main_hbox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(main_hbox), Data^.sink_widget);
    gtk_box_append(GTK_BOX(main_hbox), Data^.streams_list);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_box_append(GTK_BOX(main_box), main_hbox);
    gtk_box_append(GTK_BOX(main_box), constrols);
    gtk_window_set_child(GTK_WINDOW(main_window), main_box);
    gtk_window_set_title(GTK_WINDOW(main_window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(main_window), 200, 200);

    gtk_window_present(GTK_WINDOW(main_window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    Data: TCustomData;
    app: PGtkApplication;
    videosink, gtkglsink: PGstElement;
    status: LongInt;
  begin
    gtk_init;

    gst_init(@argc, @argv);
    FillChar(Data, SizeOf(Data), $00);
    Data.duration := GST_CLOCK_TIME_NONE;

    Data.playbin := gst_element_factory_make('playbin', 'playbin');
    if Data.playbin=nil then g_printerr('playbin error');
    videosink := gst_element_factory_make('glsinkbin', 'glsinkbin');
    if videosink=nil then g_printerr('videosink error');
//    gtkglsink := gst_element_factory_make('gtk4glsink', 'gtkglsink');
//    gtkglsink := gst_element_factory_make('clappersinkes', 'gtkglsink');
    gtkglsink := gst_element_factory_make('gtk4paintablesink', 'gtkglsink');
    if gtkglsink=nil then g_printerr('gtkglsink error');

    if (gtkglsink <> nil) and (videosink <> nil) then begin
      g_printerr('Successfully created GTK GL Sink');
      g_object_set(videosink,'sink',gtkglsink,nil);
      WriteLn('11111111111111111');
      g_object_get(gtkglsink,'widget',@Data.sink_widget,nil);
      WriteLn('222222222222222222');
    end;

    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @Data);

    // gst zeugs

    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Result := 0;
  end;

begin
  main(argc, argv);
end.
