program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GDK4,
  fp_GTK4;


  procedure quit_clicked_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    app: PGtkApplication absolute Data;
  begin
    g_application_quit(G_APPLICATION(app));
  end;

const
  css_data1 = 'window { background-image: conic-gradient(        from 0deg at 50% 50%,        #ff0000 0deg,        #00ff00 90deg,        #0000ff 180deg,        #ffff00 270deg,        #ff0000 360deg    ); }';
  css_data2 =
    '@keyframes color_change {' +
    '    0% { background-color: red; }' +
    '    50% { background-color: yellow; }' +
    '    100% { background-color: red; }' +
    '}' +

    '@keyframes move {' +
    '    0% { transform: translate(0, 0); }' +
    '    25% { transform: translate(300px, 0); }' +
    '    50% { transform: translate(300px, 300px); }' +
    '    75% { transform: translate(0, 300px); }' +
    '    100% { transform: translate(0, 0); }' +
    '}' +

//    'drawingarea {' +
    'button {' +
//    '    width: 20px;' +
//    '    height: 20px;' +
    '    background-color: red;' +
    '    border-radius: 50%;' +
//    '    position: absolute;' +
    '    animation: move 4s linear infinite;' +
    '}' +


    'window {' +
    '    background-color: red;' +
    '    animation: color_change 4s linear infinite;' +
    '}';


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, mainBox, button, buttonBox, dot: PGtkWidget;
    i: integer;
    provider: PGtkCssProvider;
  begin
    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_string(provider, css_data2);
    gtk_style_context_add_provider_for_display(gdk_display_get_default, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_USER);
    g_object_unref(provider);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_vexpand(mainBox, True);
    gtk_widget_set_valign(mainBox, GTK_ALIGN_END);
    gtk_window_set_child(GTK_WINDOW(window), mainBox);

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_widget_set_halign(buttonbox, GTK_ALIGN_END);
    gtk_widget_set_valign(buttonbox, GTK_ALIGN_END);
    gtk_widget_set_margin_end(buttonbox, 5);
    gtk_widget_set_margin_bottom(buttonbox, 5);
    gtk_box_append(GTK_BOX(mainBox), buttonBox);

    dot:=gtk_drawing_area_new;;
    gtk_widget_set_vexpand(dot, True);
    gtk_widget_set_hexpand(dot, True);
    gtk_box_append(GTK_BOX(mainBox), dot);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), app);
    gtk_box_append(GTK_BOX(buttonBox), button);

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
  Randomize;
  main(argc, argv);
end.
