program project1;

uses
  //avformat,
  //avio,                 // struct verkleinert
  //version,
  //version_major,

  // === avutil
  buffer,
  dict,
  rational,
  frame,                           // dict, buffer, rational
  uuid,
  version,
  video_enc_params,                // frame
  video_hint,                      // frame
  xtea,
  twofish,
  tx,
  tree,
  timecode,
  timestamp,                       // rational
  pixelutils,
  pixfmt,
  pixdesc,                         // pixfmt
  random_seed,
  rc4,
  replaygain,
  ripemd,
  samplefmt,
  sha,
  sha512,
  spherical,
  stereo3d,                        // frame
  tea,
  threadmessage,
  time,
  channel_layout,
  opt,                             // rational, dict, pixfmt, samplefmt, channel_layout, log
  log,
  parseutils,                      // rational, log
  imgutils,                        // pixfmt, pixdesc, rational
  intreadwrite,
  lfg,
  lzo,
  mastering_display_metadata,      // rational, frame
  intfloat,
  mathematics,                     // rational
  md5,
  mem,
  motion_vector,
  murmur3,
  hdr_dynamic_metadata,           // rational, frame
  hdr_dynamic_vivid_metadata,     // rational, frame
  hmac,


  //adler32,
  //aes,
  //aes_ctr,
  //ambient_viewing_environment,
  //audio_fifo,
  //avassert,
  //avstring,
  //avutil,
  //base64,
  //blowfish,
  //bprint,
  //bswap,
  //camellia,
  //cast5,
  //common,
  //cpu,
  //crc,
  //csp,
  //des,
  //detection_bbox,
  //display,
  //dovi_meta,
  //downmix_info,
  //encryption_info,
  //error,
  //eval,
  //executor,
  //ffversion,
  //fifo,
  //file_,
  //film_grain_params,
  //hash,


  hwcontext,
  hwcontext_cuda,
  hwcontext_d3d11va,
  hwcontext_drm,
  hwcontext_dxva2,
  hwcontext_mediacodec,
  hwcontext_opencl,
  hwcontext_qsv,
  hwcontext_vaapi,
  hwcontext_vdpau,
  hwcontext_videotoolbox,
  hwcontext_vulkan,




  fp_glib2,
  fp_GTK4,
  fp_ffmpeg;

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
