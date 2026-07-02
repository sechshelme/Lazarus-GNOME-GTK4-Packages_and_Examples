program project1;

uses
  fp_glib2,
  fp_GTK4;

  procedure show_about_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    parent_window: PGtkWindow;
    about_window, label_: PGtkWidget;
  begin
    parent_window := GTK_WINDOW(user_data);

    about_window := gtk_window_new;
    gtk_window_set_title(GTK_WINDOW(about_window), 'Info');
    gtk_window_set_transient_for(GTK_WINDOW(about_window), parent_window);
    gtk_window_set_modal(GTK_WINDOW(about_window), True);
    gtk_window_set_default_size(GTK_WINDOW(about_window), 200, 100);

    label_ := gtk_label_new('Dies ist ein einfaches Info-Fenster.');
    gtk_window_set_child(GTK_WINDOW(about_window), label_);

    gtk_window_present(GTK_WINDOW(about_window));
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, header_bar, title_label, menu_button, icon,
    about_button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 200);

    header_bar := gtk_header_bar_new;

    title_label := gtk_label_new('Mein Fenster');
    gtk_widget_add_css_class(title_label, 'title');
    gtk_header_bar_set_title_widget(GTK_HEADER_BAR(header_bar), title_label);

    gtk_header_bar_set_show_title_buttons(GTK_HEADER_BAR(header_bar), True);

    about_button := gtk_button_new;
    icon := gtk_image_new_from_icon_name('help-about');
    gtk_button_set_child(GTK_BUTTON(about_button), icon);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), about_button);
    g_signal_connect(about_button, 'clicked', G_CALLBACK(@show_about_cp), window);

    menu_button := gtk_button_new;
    icon := gtk_image_new_from_icon_name('open-menu-symbolic');
    gtk_button_set_child(GTK_BUTTON(menu_button), icon);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), menu_button);

    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);

    gtk_window_set_child(GTK_WINDOW(window), gtk_label_new('Inhalt'));
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
  end;

begin
  main;
end.
