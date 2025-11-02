program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_adwaita;

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));
    gtk_window_close(GTK_WINDOW(windowList^.Data));
  end;

  procedure menu_clicked_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  var
    action_name: Pgchar;
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    action_name := g_action_get_name(G_ACTION(action));
    g_printf('Menu: "%s" wurde gecklickt'#10, action_name);
    if g_strcmp0(action_name, 'quit') = 0 then begin
      app := g_application_get_default;
      windowList := gtk_application_get_windows(GTK_APPLICATION(app));
      gtk_window_close(GTK_WINDOW(windowList^.Data));
    end;
  end;

  // https://www.perplexity.ai/search/gib-mir-ein-gtk4-adwaita-beisp-KCumFnzCRZyupZ7rYh2hBA

  function CreateMenu: PGtkWidget;
  var
    menu, about_menu: PGMenu;
    action: PGSimpleAction;
    app: PGApplication;
    item: PGMenuItem;
  begin
    app := g_application_get_default;
    Result := gtk_menu_button_new;
    gtk_menu_button_set_icon_name(GTK_MENU_BUTTON(Result), 'open-menu-symbolic');

    menu := g_menu_new;
    g_menu_append(menu, 'Hilfe...', 'app.help');

    about_menu := g_menu_new;

    g_menu_append(about_menu, 'Deutsch...', 'app.about.de');
    g_menu_append(about_menu, 'Englisch...', 'app.about.en');

    g_menu_append_submenu(menu, 'About...', G_MENU_MODEL(about_menu));
    g_menu_append(menu, 'Quit', 'app.quit');
    gtk_menu_button_set_menu_model(GTK_MENU_BUTTON(Result), G_MENU_MODEL(menu));

    item:=g_menu_item_new('Beenden', 'app.quit');
//    g_menu_item_set_attribute(item, G_MENU_ATTRIBUTE_sLABEL, 'uses-markup');
    g_menu_append_item(menu, item);


    action := g_simple_action_new('help', nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@menu_clicked_cp), nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));

    action := g_simple_action_new('about.de', nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@menu_clicked_cp), nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));

    action := g_simple_action_new('about.en', nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@menu_clicked_cp), nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));

    action := g_simple_action_new('quit', nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@menu_clicked_cp), nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, toolbar_view, header_bar, label_, box, button,
    menu_button: PGtkWidget;
  begin
    window := adw_application_window_new(app);
    toolbar_view := adw_toolbar_view_new;
    header_bar := adw_header_bar_new;

    menu_button := CreateMenu;
    adw_header_bar_pack_end(ADW_HEADER_BAR(header_bar), menu_button);
    adw_header_bar_set_show_end_title_buttons(ADW_HEADER_BAR(header_bar), True);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

    label_ := gtk_label_new('Hello World');
    gtk_box_append(GTK_BOX(box), label_);

    button := gtk_button_new_with_label('Quit');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), nil);

    adw_toolbar_view_add_top_bar(ADW_TOOLBAR_VIEW(toolbar_view), header_bar);
    adw_toolbar_view_set_content(ADW_TOOLBAR_VIEW(toolbar_view), box);

    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    adw_application_window_set_content(ADW_APPLICATION_WINDOW(window), toolbar_view);
    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    status: longint;
    app: PAdwApplication;
  begin
    app := adw_application_new('org.example.Hello', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
