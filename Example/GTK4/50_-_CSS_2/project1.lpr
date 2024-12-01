program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GDK4,
  fp_GTK4;

  procedure SetColor(w: PGtkWidget; const col: string);
  var
    provider: PGtkCssProvider;
    s, ac: string;
    context: PGtkStyleContext;
  begin
    if GTK_IS_BUTTON(w) then begin
      ac := '.colored:active { background-color: darkgray; }';
    end else begin
      ac := '';
    end;

    s := '.colored { background-color: ' + col + '; }' + ac;
    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_data(provider, PChar(s), -1);

    context := gtk_widget_get_style_context(w);
    gtk_style_context_add_provider(context, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_USER);
    g_object_unref(provider);
  end;

  procedure click_cb(widget: PGtkWidget; Data: Tgpointer);
  var
    frame: PGtkWidget absolute Data;
    Name: pchar;
  begin
    Name := gtk_widget_get_name(widget);
    SetColor(frame, Name);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, frame, button, vbox, hbox: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);
    gtk_widget_add_css_class(window, 'colored');
    SetColor(window, 'yellow');

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(vbox, 10);
    gtk_widget_set_margin_end(vbox, 10);
    gtk_widget_set_margin_top(vbox, 10);
    gtk_widget_set_margin_bottom(vbox, 10);

    frame := gtk_frame_new('Frame mit Border');
    gtk_frame_set_label_align(GTK_FRAME(frame), 0.5);
    gtk_widget_set_size_request(frame, 200, 100);
    gtk_widget_add_css_class(frame, 'colored');
    gtk_box_append(GTK_BOX(vbox), frame);

    hbox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(vbox), hbox);
    gtk_widget_add_css_class(hbox, 'colored');
    SetColor(hbox, 'cyan');

    button := gtk_button_new_with_label('red');
    gtk_widget_set_name(GTK_WIDGET(button), 'red');
    gtk_widget_add_css_class(button, 'colored');
    SetColor(button, 'red');
    g_signal_connect(button, 'clicked', G_CALLBACK(@click_cb), frame);
    gtk_box_append(GTK_BOX(hbox), button);

    button := gtk_button_new_with_label('blue');
    gtk_widget_set_name(GTK_WIDGET(button), 'blue');
    gtk_widget_add_css_class(button, 'colored');
    SetColor(button, 'blue');
    g_signal_connect(button, 'clicked', G_CALLBACK(@click_cb), frame);
    gtk_box_append(GTK_BOX(hbox), button);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    gtk_widget_add_css_class(button, 'colored');
    SetColor(button, 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@click_cb), frame);
    gtk_box_append(GTK_BOX(hbox), button);


    gtk_window_set_child(GTK_WINDOW(window), vbox);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    //    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    app := g_object_new(GTK_TYPE_APPLICATION, nil);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
