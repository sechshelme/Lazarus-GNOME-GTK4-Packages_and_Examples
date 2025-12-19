program project1;

uses
  vdpau,
  version_major,
  videotoolbox,              // vdpau
  vorbis_parser,
  xvmc,
  packet,
  qsv,
  version,
  defs,
  codec_id,
  codec,
  codec_par,
  codec_desc,
  d3d11va,
  dirac,
  dv_profile,
  dxva2,
  jni,
  mediacodec,

  //ac3_parser,
  //adts_parser,
  //avdct,
  //avfft,
  avcodec,
  bsf,




//  avformat,
//  avio,                 // struct verkleinert
//  version,
//  version_major,



  fp_ffmpeg,
  fp_glib2,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: integer = 0;
  var
    s: string;
  begin
    g_print('Hello World'#10);

    Inc(counter);
    str(counter, s);
    gtk_button_set_label(GTK_BUTTON(widget), pchar('Ich wurde ' + s + ' gelickt'));
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
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
