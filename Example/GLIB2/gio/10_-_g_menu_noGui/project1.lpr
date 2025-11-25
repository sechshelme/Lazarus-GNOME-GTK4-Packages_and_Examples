program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools;


  procedure print_Menu(menu: PGMenuModel; space: integer = 0);
  var
    n_items: Tgint;
    i: integer;
    lab: Pgchar;
    submenu: PGMenuModel;
    NewLine: boolean;
  begin
    n_items := g_menu_model_get_n_items(menu);
    g_printf('%*sCount: %d'#10, space, '', n_items);
    for i := 0 to n_items - 1 do begin
      g_printf('%*s%2d.', space, '', i);

      if g_menu_model_get_item_attribute(menu, i, G_MENU_ATTRIBUTE_LABEL, 's', @lab) then begin
        g_printf('%*sItem: %-16s', space, '', lab);
        g_free(lab);
      end;
      if g_menu_model_get_item_attribute(menu, i, G_MENU_ATTRIBUTE_ACTION, 's', @lab) then begin
        g_printf('%*sDetail: %-8s', space, '', lab);
        g_free(lab);
      end;
      if g_menu_model_get_item_attribute(menu, i, 'accel', 's', @lab) then begin
        g_printf('%*sAccel: %-8s', space, '', lab);
        g_free(lab);
      end;

      g_printf(#10);

      submenu := g_menu_model_get_item_link(menu, i, G_MENU_LINK_SUBMENU);
      if submenu <> nil then begin
        print_Menu(submenu, space + 2);
        g_object_unref(submenu);
      end;
    end;
  end;

  procedure menuaction_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  begin
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

    g_menu_append(fileMenu, '_oeffnen', 'app.open');
    g_menu_append(fileMenu, '_speichern', 'app.save');
    g_menu_append(fileMenu, '-', nil);

    quit_item := g_menu_item_new('Beenden...', 'app.quit');
    g_menu_item_set_attribute(quit_item, 'accel', 's', '<Ctrl>q');
    g_menu_append_item(fileMenu, quit_item);
    g_object_unref(quit_item);

    action := g_simple_action_new('quit', nil);
    //    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_signal_connect(action, 'activate', G_CALLBACK(@menuaction_cp), nil);
    //    gtk_application_set_accels_for_action(GTK_APPLICATION(app), 'app.quit', @[PChar('<Control>q'), nil]);

    // --- Optionen
    colorSubMenu := g_menu_new;
    g_menu_append(colorSubMenu, '_Rot', 'app.red');
    g_menu_append(colorSubMenu, '_Gruen', 'app.green');
    g_menu_append(colorSubMenu, '_Blau', 'app.blue');

    optionMenu := g_menu_new;
    g_menu_append(optionMenu, '_Optionen..', 'app.option');
    g_menu_append_submenu(optionMenu, '_Farben', G_MENU_MODEL(colorSubMenu));
    g_object_unref(colorSubMenu);

    // --- Hilfe
    helpMenu := g_menu_new;
    g_menu_append(helpMenu, '_Hilfe...', 'app.help');
    g_menu_append(helpMenu, '_About...', 'app.about');

    // --- Main Menu
    mainMenu := g_menu_new;

    g_menu_append_submenu(mainMenu, '_Datei', G_MENU_MODEL(fileMenu));
    g_object_unref(fileMenu);

    g_menu_append_submenu(mainMenu, '_Optionen', G_MENU_MODEL(optionMenu));
    g_object_unref(optionMenu);

    g_menu_append_submenu(mainMenu, '_Hilfe', G_MENU_MODEL(helpMenu));
    g_object_unref(helpMenu);

    Result := mainMenu;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    obj: PGObject;
    menu: PGMenu;
  begin
    obj := g_object_new(G_TYPE_OBJECT, nil);

    menu := CreateMenu;

    print_Menu(G_MENU_MODEL(menu));
    g_object_unref(menu);

    g_object_unref(obj);

    Result := 0;
  end;


begin
  main(argc, argv);
end.
