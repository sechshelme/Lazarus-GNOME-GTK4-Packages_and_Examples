program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GDK4,
  fp_GTK4;

  procedure click_cp(widget: PGtkWidget; Data: Tgpointer);
  var
    frame: PGtkWidget absolute Data;
  const
    isGreen: boolean = False;
  begin
    if isGreen then begin
      gtk_widget_remove_css_class(frame, 'green-frame');
      gtk_widget_add_css_class(frame, 'blue-frame');
    end else begin
      gtk_widget_remove_css_class(frame, 'blue-frame');
      gtk_widget_add_css_class(frame, 'green-frame');
    end;

    isGreen := not isGreen;
    ;
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, frame, button, box: PGtkWidget;
    provider: PGtkCssProvider;
    css_data: pchar =
    'window { background-color: pink; }' +
      'frame.blue-frame { ' +
      '   border: 2px solid #888888; ' +
      '   padding: 10px; ' +
      '   background-color: lightblue; ' +
      '}' +
      'frame.green-frame { ' +
      '   border: 2px solid #888888; ' +
      '   padding: 10px; ' +
      '   background-color: lightgreen; ' +
      '}' +
      'button.bevel-button { ' +
      '   border: 2px solid #888888;' +
      '   border-radius: 5px;' +
      '   background-image: linear-gradient(to bottom, #ffffff, #dddddd);' +
      '   padding: 5px 10px;' +
      '   transition: all 0.3s ease;' +
      '}' +
      'button.bevel-button:hover { ' +
      '   background-image: linear-gradient(to bottom, #f0f0f0, #d0d0d0);' +
      '   border-color: #666666;' +
      '}' +
      'button.bevel-button:active { ' +
      '   background-image: linear-gradient(to bottom, #d0d0d0, #e0e0e0);' +
      '   border-color: #444444;' +
      '}';
    display: PGdkDisplay;
  begin
    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_data(provider, css_data, -1);

    display := gdk_display_get_default;
    gtk_style_context_add_provider_for_display(display, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    frame := gtk_frame_new('Frame mit Border');
    gtk_widget_add_css_class(frame, 'blue-frame');

    button := gtk_button_new_with_label('Bevel-Button');
    gtk_widget_add_css_class(button, 'bevel-button');
    g_signal_connect(button, 'clicked', G_CALLBACK(@click_cp), frame);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(box, 10);
    gtk_widget_set_margin_end(box, 10);
    gtk_widget_set_margin_top(box, 10);
    gtk_widget_set_margin_bottom(box, 10);

    gtk_box_append(GTK_BOX(box), frame);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
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
