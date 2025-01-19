program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

  // https://www.perplexity.ai/search/kann-man-in-gtk4-win-typisches-Uh1opi2XT_m29krYlBBn7g


  procedure menuaction_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  var
    action_name: Pgchar;
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));

    action_name := g_action_get_name(G_ACTION(action));
    g_printf('Action Name: "%s"'#10, action_name);

    if g_strcmp0(action_name, 'quit') = 0 then  begin
      gtk_window_close(GTK_WINDOW(windowList^.Data));
    end;
  end;

  function CreateMenu: PGMenu;
  var
    mainMenu, optionMenu, colorSubMenu, fileMenu, helpMenu: PGMenu;
    action: PGSimpleAction;
    app: PGApplication;
    quit_item: PGMenuItem;
  begin
    app := g_application_get_default;

    // --- Datei
    fileMenu := g_menu_new;
    g_menu_append(fileMenu, '_Neu', 'app.new');

    //    action := g_simple_action_new('quit', nil);
    //    g_action_map_add_action(G_ACTION_MAP(nil), G_ACTION(action));
    //    g_signal_connect(action, 'activate', G_CALLBACK(@menuaction_cp), nil);

    g_menu_append(fileMenu, '_oeffnen', 'app.open');
    g_menu_append(fileMenu, '_speichern', 'app.save');
    g_menu_append(fileMenu, '-', nil);

    quit_item := g_menu_item_new('Beenden...', 'app.quit');
    g_menu_item_set_attribute(quit_item, 'accel', 's', '<Ctrl>q');
    g_menu_append_item(fileMenu, quit_item);
    //    g_menu_append(fileMenu, '_beenden', 'app.quit');

    action := g_simple_action_new('quit', nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_signal_connect(action, 'activate', G_CALLBACK(@menuaction_cp), nil);
    gtk_application_set_accels_for_action(GTK_APPLICATION(app), 'app.quit', @[PChar('<Control>q'), nil]);

    // --- Optionne
    colorSubMenu := g_menu_new;
    g_menu_append(colorSubMenu, '_Rot', 'app.red');
    g_menu_append(colorSubMenu, '_Gruen', 'app.green');
    g_menu_append(colorSubMenu, '_Blau', 'app.blue');

    optionMenu := g_menu_new;
    g_menu_append(optionMenu, '_Optionen..', 'app.option');
    g_menu_append_submenu(optionMenu, '_Farben', G_MENU_MODEL(colorSubMenu));
    g_object_set_data_full(G_OBJECT(optionMenu), 'color_menu', colorSubMenu, @g_object_unref);

    // --- Hilfe
    helpMenu := g_menu_new;
    g_menu_append(helpMenu, '_Hilfe...', 'app.help');
    g_menu_append(helpMenu, '_About...', 'app.about');

    // --- Main Menu
    mainMenu := g_menu_new;

    g_menu_append_submenu(mainMenu, '_Datei', G_MENU_MODEL(fileMenu));
    g_object_set_data_full(G_OBJECT(mainMenu), 'file_menu', fileMenu, @g_object_unref);

    g_menu_append_submenu(mainMenu, '_Optionen', G_MENU_MODEL(optionMenu));
    g_object_set_data_full(G_OBJECT(mainMenu), 'option_menu', optionMenu, @g_object_unref);

    g_menu_append_submenu(mainMenu, '_Hilfe', G_MENU_MODEL(helpMenu));
    g_object_set_data_full(G_OBJECT(mainMenu), 'help_menu', helpMenu, @g_object_unref);

    Result := mainMenu;
  end;



  function CreateMenuButton(menu: PGMenu): PGtkWidget;
  begin
    Result := gtk_menu_button_new;
    gtk_menu_button_set_label(GTK_MENU_BUTTON(Result), 'Öffne Menu');

    gtk_menu_button_set_menu_model(GTK_MENU_BUTTON(Result), G_MENU_MODEL(menu));
  end;

  function CreateMainMenu(menu: PGMenu): PGtkWidget;
  begin
    Result := gtk_popover_menu_bar_new_from_model(G_MENU_MODEL(menu));
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, vbox, Button, label1: PGtkWidget;
    menu: PGMenu;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    menu:=    CreateMenu;
    g_object_set_data_full(G_OBJECT(window), 'menu', menu, @g_object_unref);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(vbox, 10);
    gtk_widget_set_margin_end(vbox, 10);
    gtk_widget_set_margin_top(vbox, 10);
    gtk_widget_set_margin_bottom(vbox, 10);

    gtk_box_prepend(GTK_BOX(vbox), CreateMainMenu(menu));

    gtk_box_append(GTK_BOX(vbox), CreateMenuButton(menu));
    gtk_box_append(GTK_BOX(vbox), CreateMenuButton(menu));

    Button := gtk_button_new_with_label('Button...');
    label1 := gtk_button_get_child(GTK_BUTTON(Button));
    gtk_label_set_selectable(GTK_LABEL(label1), True);
    gtk_label_set_extra_menu(GTK_LABEL(label1), G_MENU_MODEL(menu));
    gtk_box_append(GTK_BOX(vbox), Button);

    label1 := gtk_label_new('Label');
    gtk_label_set_selectable(GTK_LABEL(label1), True);
    gtk_label_set_extra_menu(GTK_LABEL(label1), G_MENU_MODEL(menu));
    gtk_box_append(GTK_BOX(vbox), label1);

    gtk_window_set_child(GTK_WINDOW(window), vbox);
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
