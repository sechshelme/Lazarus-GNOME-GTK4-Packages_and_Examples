program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_cairo,
  fp_GTK4;



  procedure show_about_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    parent_window: PGtkWindow;
    new_window, label_: PGtkWidget;
  begin
    parent_window := GTK_WINDOW(user_data);

    // Neues einfaches Fenster erzeugen
    new_window := gtk_window_new;
    gtk_window_set_title(GTK_WINDOW(new_window), 'Info');
    gtk_window_set_transient_for(GTK_WINDOW(new_window), parent_window);
    gtk_window_set_modal(GTK_WINDOW(new_window), TRUE);
    gtk_window_set_default_size(GTK_WINDOW(new_window), 200, 100);

    // Einfaches Label als Fenstermitglied
    label_ := gtk_label_new('Dies ist ein einfaches Info-Fenster.');
    gtk_window_set_child(GTK_WINDOW(new_window), label_);

    // Fenster anzeigen
    gtk_window_present(GTK_WINDOW(new_window));  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, header_bar, title_label, menu_button, icon,
      about_button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 200);

    // HeaderBar erzeugen
    header_bar := gtk_header_bar_new;

    // Titel als GtkLabel setzen
    title_label := gtk_label_new('Mein Fenster');
    gtk_widget_add_css_class(title_label, 'title');
    gtk_header_bar_set_title_widget(GTK_HEADER_BAR(header_bar), title_label);

    // Fenstersteuerungsknöpfe anzeigen
    gtk_header_bar_set_show_title_buttons(GTK_HEADER_BAR(header_bar), True);

    // About-Button
    about_button := gtk_button_new;
    icon := gtk_image_new_from_icon_name('help-about');
    gtk_button_set_child(GTK_BUTTON(about_button), icon);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), about_button);
    g_signal_connect(about_button, 'clicked', G_CALLBACK(@show_about_cp), window);

    // Menü-Button
    menu_button := gtk_button_new;
    icon := gtk_image_new_from_icon_name('open-menu-symbolic');
    gtk_button_set_child(GTK_BUTTON(menu_button), icon);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), menu_button);

    // HeaderBar als Titelleiste setzen
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);

    // Einfaches Label als Fensterinhalt
    gtk_window_set_child(GTK_WINDOW(window), gtk_label_new('Inhalt'));

    // Fenster zeigen
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
