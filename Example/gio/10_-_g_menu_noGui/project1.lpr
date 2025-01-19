program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools;


  // https://www.perplexity.ai/search/ich-habe-ein-g-menu-erstellt-w-ISC6_tydSmOh2RjQB0x37Q

  procedure print_Menu(menu: PGMenuModel; space: integer = 0);
  var
    n_items: Tgint;
    i: integer;
    lab: Pgchar;
    submenu: PGMenuModel;
  begin
    n_items := g_menu_model_get_n_items(menu);
    g_printf('%*sCount: %d'#10, space, '', n_items);
    for i := 0 to n_items - 1 do begin
      if g_menu_model_get_item_attribute(menu, i, G_MENU_ATTRIBUTE_LABEL, 's', @lab) then begin
        g_printf('%*sItem %d: %-16s', space, '', i, lab);
        g_free(lab);
      end;
      if g_menu_model_get_item_attribute(menu, i, G_MENU_ATTRIBUTE_ACTION, 's', @lab) then begin
        g_printf('%*sDetail %d: %-8s'#10, space, '', i, lab);
        g_free(lab);
      end;
      if g_menu_model_get_item_attribute(menu, i, 'accel', 's', @lab) then begin
        g_printf('%*sAccel %d: %-8s'#10, space, '', i, lab);
        g_free(lab);
      end;

      submenu := g_menu_model_get_item_link(menu, i, G_MENU_LINK_SUBMENU);
      if submenu <> nil then begin
        print_Menu(submenu, space + 2);
        g_object_unref(submenu);
      end;
    end;
  end;

  function CreateMenu: PGMenu;
  var
    mainMenu, optionMenu, colorSubMenu, fileMenu, helpMenu: PGMenu;
    action: PGSimpleAction;
    test_item: PGMenuItem;
  begin

    // --- Datei
    fileMenu := g_menu_new;
    g_menu_append(fileMenu, '_Neu', 'app.new');

    //    action := g_simple_action_new('quit', nil);
    //    g_action_map_add_action(G_ACTION_MAP(nil), G_ACTION(action));
    //    g_signal_connect(action, 'activate', G_CALLBACK(@menuaction_cp), nil);

    g_menu_append(fileMenu, '_oeffnen', 'app.open');
    g_menu_append(fileMenu, '_speichern', 'app.save');
    g_menu_append(fileMenu, nil, nil);
    g_menu_append(fileMenu, '_beenden', 'app.quit');

    test_item := g_menu_item_new('test', 'app.quit');
    g_menu_item_set_attribute(test_item, 'accel', 's', '<Ctrl>q');
    g_menu_append_item(fileMenu, test_item);


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

  function main(argc: cint; argv: PPChar): cint;
  var
    obj: PGObject;
    menu: PGMenu;
  begin
    obj := g_object_new(G_TYPE_OBJECT, nil);

    menu := CreateMenu;
    g_object_set_data_full(G_OBJECT(obj), 'main_menu', menu, @g_object_unref);
    print_Menu(G_MENU_MODEL(menu));

    g_object_unref(obj);
  end;


begin
  main(argc, argv);
end.
