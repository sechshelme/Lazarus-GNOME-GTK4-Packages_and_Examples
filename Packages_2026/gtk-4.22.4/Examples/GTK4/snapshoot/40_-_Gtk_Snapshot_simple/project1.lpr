program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  ColorButtonBox,
  SnapshotWidget,
  ButtonBox,
  HelpWindow;

  procedure color_set_cp(widget: PGtkWidget; col: PGdkRGBA; user_data: Tgpointer); cdecl;
  begin
    snapshot_widget_set_color(user_data, col);
  end;

  procedure button_clicked_cp(widget: PGtkWidget; index: Tgint; user_data: Tgpointer); cdecl;
  var
    w: PColorButtonBox absolute user_data;
  const
    help_window: PGtkWidget = nil;
  begin
    case index of
      0: begin
        color_button_box_add_button(w, 'cyan');
      end;
      1: begin
        if not color_button_box_insert_button(w, 'magenta', 1) then begin
          g_printf('Konnte Button nicht einfügen, ungültiger Index !'#10);
        end;
      end;
      2: begin
        if not color_button_box_remove(w, 1) then begin
          g_printf('Konnte Button nicht löschen !'#10);
        end;
      end;
      3: begin
        if help_window = nil then begin
          help_window := help_window_new();
          g_signal_connect_swapped(help_window, 'destroy', G_CALLBACK(@g_nullify_pointer), @help_window);
        end;
        gtk_window_present(GTK_WINDOW(help_window));
      end;
      4: begin
        gtk_window_destroy(GTK_WINDOW(gtk_widget_get_root(widget)));
      end;
    end;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, snapshot, header_bar, color_box, button_box: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    // Windows
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Snapshot Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    // Snapshot
    snapshot := GTK_WIDGET(snapshot_widget_new);
    gtk_widget_set_vexpand(snapshot, True);
    gtk_widget_set_hexpand(snapshot, True);
    gtk_box_append(GTK_BOX(box), snapshot);

    // Header Bar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);

    color_box := color_button_box_new_with_buttons('red,green,blue,yellow');
    g_signal_connect(color_box, 'color-set', G_CALLBACK(@color_set_cp), snapshot);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), color_box);

    // Bottom Button Box
    button_box := button_box_new('add,insert,remove,help...,Quit');
    g_signal_connect(button_box, 'button-clicked', G_CALLBACK(@button_clicked_cp), color_box);
    gtk_box_append(GTK_BOX(box), button_box);

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
