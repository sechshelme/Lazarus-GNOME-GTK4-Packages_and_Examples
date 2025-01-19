program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools;

  // https://www.perplexity.ai/search/kann-man-in-gtk4-win-typisches-Uh1opi2XT_m29krYlBBn7g


  procedure menuaction_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  begin
  end;

  function CreateMenu: PGMenu;
  var
    fileMenu, optionMenu, helpMenu, rgbMenu: PGMenu;
    action: PGSimpleAction;
    quit_item: PGMenuItem;
  begin
    Result := g_menu_new;

    // --- Datei Menu
    fileMenu := g_menu_new;
    g_menu_append_submenu(Result, '_Datei', G_MENU_MODEL(fileMenu));

    g_menu_append(fileMenu, '¨Offnen...', 'app.open');

    quit_item := g_menu_item_new('Beenden...', 'app.quit');
    //    g_menu_item_set_attribute(quit_item, 'accel', 's', '<Ctrl><Alt>x q');
    g_menu_append_item(fileMenu, quit_item);


    //    g_menu_append(fileMenu, 'Beenden...', 'app.quit');
    action := g_simple_action_new('quit', nil);
    //    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_signal_connect(action, 'activate', G_CALLBACK(@menuaction_cp), nil);

    // --- Optionen Menu
    optionMenu := g_menu_new;
    g_menu_append(optionMenu, 'Optionen...', 'app.options');
    g_menu_append_submenu(Result, '_Optionen', G_MENU_MODEL(optionMenu));

    // ------ RGB Menu
    rgbMenu := g_menu_new;
    g_menu_append(rgbMenu, '_Rot', 'app.red');
    g_menu_append(rgbMenu, '_Grün', 'app.green');
    g_menu_append(rgbMenu, '_Blau', 'app.blue');
    g_menu_append_submenu(optionMenu, '_Farben', G_MENU_MODEL(rgbMenu));
    g_menu_append(rgbMenu, '_Gelb', 'app.blue');
    g_menu_append_submenu(optionMenu, '_Farben', G_MENU_MODEL(rgbMenu));

    // --- Hilfe Menu
    helpMenu := g_menu_new;
    g_menu_append(helpMenu, 'Hilfe...', 'app.help');
    g_menu_append(helpMenu, 'About...', 'app.about');
    g_menu_append_submenu(Result, '_Hilfe', G_MENU_MODEL(helpMenu));

  end;

  procedure print_Menu(menu: PGMenuModel; space:Integer=0);
  var
    n_items: Tgint;
    i: integer;
    lab: Pgchar;
    submenu: PGMenuModel;
  begin
    n_items := g_menu_model_get_n_items(menu);
    g_printf('Count; %d'#10, n_items);
    for i := 0 to n_items - 1 do begin
      if g_menu_model_get_item_attribute(menu, i, G_MENU_ATTRIBUTE_LABEL, 's', @lab) then begin
        g_printf('Item %d: %s'#10, i, lab);
        g_free(lab);
      end;
      submenu := g_menu_model_get_item_link(menu, i, 'submenu');
      if submenu <> nil then begin
        WriteLn('submenu');
        print_Menu(submenu,2);
      end;
    end;
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    mainMenu, subMenu: PGMenu;
  begin
    subMenu := g_menu_new;
    g_menu_append(subMenu, '_Rot', 'app.red');
    g_menu_append(subMenu, '_Grün', 'app.green');
    g_menu_append(subMenu, '_Blau', 'app.blue');

    mainMenu := g_menu_new;

    g_menu_append_submenu(mainMenu, '_Hilfe', G_MENU_MODEL(subMenu));
    g_object_set_data_full(G_OBJECT(mainMenu), 'menu', subMenu, @g_object_unref);

    g_menu_append(mainMenu, 'Option1 ', 'app.red');
    g_menu_append(mainMenu, 'Option2 ', 'app.red');

    print_Menu(G_MENU_MODEL(mainMenu));

    g_object_unref(mainMenu);
    //    g_object_unref(subMenu);
  end;

begin
  main(argc, argv);
end.
