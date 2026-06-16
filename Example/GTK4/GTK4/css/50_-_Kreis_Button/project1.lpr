program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GTK4;

  procedure click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    lab: pchar;
  begin
    lab := gtk_button_get_label(GTK_BUTTON(widget));
    g_print('Button ''%s'' wurde geklickt!'#10, lab);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  const
    color_classes: array of pchar = ('red', 'green', 'yellow');

  const
    css_data: pchar =
      'button.circular {' +
      '  min-width: 100px;' +
      '  min-height: 100px;' +
      '  border-radius: 50%;' +
      '  color: white;' +
      '  font-weight: bold;' +
      '  transition: background 150ms, box-shadow 150ms;' +
      '  margin: 0 10px 10px 0;' +
      '}' +
      'button.red {' +
      '  background: #e74c3c;' +
      '}' +
      'button.red:hover {' +
      '  background: #c0392b;' +
      '  box-shadow: 0 0 8px #c0392b;' +
      '}' +
      'button.red:active {' +
      '  background: #922b21;' +
      '  box-shadow: 0 0 12px #922b21;' +
      '}' +
      'button.green {' +
      '  background: #27ae60;' +
      '}' +
      'button.green:hover {' +
      '  background: #1e8449;' +
      '  box-shadow: 0 0 8px #1e8449;' +
      '}' +
      'button.green:active {' +
      '  background: #145a32;' +
      '  box-shadow: 0 0 12px #145a32;' +
      '}' +
      'button.yellow {' +
      '  background: #f1c40f;' +
      '  color: #222;' +
      '}' +
      'button.yellow:hover {' +
      '  background: #b7950b;' +
      '  box-shadow: 0 0 8px #b7950b;' +
      '}' +
      'button.yellow:active {' +
      '  background: #7d6608;' +
      '  box-shadow: 0 0 12px #7d6608;' +
      '}';
  var
    window, overlay, button_box, button: PGtkWidget;
    i: integer;
    provider: PGtkCssProvider;
    display: PGdkDisplay;

  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Drei bunte Kreis-Buttons rechts unten');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 300);

    // Hauptcontainer
    overlay := gtk_overlay_new();
    gtk_window_set_child(GTK_WINDOW(window), overlay);

    // Box für die Buttons
    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 20);

    // Drei Buttons erzeugen mit unterschiedlichen Farben
    for  i := 0 to Length(color_classes) - 1 do begin
      button := gtk_button_new_with_label(color_classes[i]);
      gtk_widget_set_size_request(button, 100, 100);
      gtk_widget_add_css_class(button, 'circular');
      gtk_widget_add_css_class(button, color_classes[i]);
      g_signal_connect(button, 'clicked', G_CALLBACK(@click_cp), nil);
      gtk_box_append(GTK_BOX(button_box), button);
    end;

    // Box rechts unten positionieren
    gtk_widget_set_halign(button_box, GTK_ALIGN_END);
    gtk_widget_set_valign(button_box, GTK_ALIGN_END);
    gtk_overlay_set_child(GTK_OVERLAY(overlay), button_box);

    // CSS-Provider global für das Display hinzufügen
    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_string(provider, css_data);
    display := gtk_widget_get_display(window);
    gtk_style_context_add_provider_for_display(display, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    g_object_unref(provider);

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
