program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

  procedure btn_click_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer);
  var
    action_name: Pgchar;
    ch: Pgchar absolute user_data;
    message: Pgchar;
  begin
    action_name := g_action_get_name(G_ACTION(action));
    g_printf('Action Name: "%s"'#10, action_name);
    g_printf('Es wurde: "%s" geklickt'#10, ch);

    GVariantShow(parameter);
    //    g_variant_get(parameter, 's', @message);
    //  g_printf('Message: "%s" geklickt'#10, message);
  end;

  function CreateMenu(app: PGtkApplication): PGtkWidget;
  var
    menu: PGMenu;
    action: PGSimpleAction;
    vt: PGVariantType;
    param: PGVariant;
  begin
    Result := gtk_menu_button_new;
    gtk_menu_button_set_label(GTK_MENU_BUTTON(Result), 'Drück mich...');

    menu := g_menu_new;
    g_menu_append(menu, 'Option 1', 'app.option1');
    g_menu_append(menu, 'Option 2', 'app.option2');
    gtk_menu_button_set_menu_model(GTK_MENU_BUTTON(Result), G_MENU_MODEL(menu));

    action := g_simple_action_new('option1', nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_signal_connect(action, 'activate', G_CALLBACK(@btn_click_cp), Pgchar('Button 1'));

    action := g_simple_action_new('option2', nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_signal_connect(action, 'activate', G_CALLBACK(@btn_click_cp), Pgchar('Button 2'));
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, vbox: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(vbox, 10);
    gtk_widget_set_margin_end(vbox, 10);
    gtk_widget_set_margin_top(vbox, 10);
    gtk_widget_set_margin_bottom(vbox, 10);

    //    gtk_box_append(GTK_BOX(vbox), CreateMenu);
    gtk_box_append(GTK_BOX(vbox), CreateMenu(app));

    gtk_window_set_child(GTK_WINDOW(window), vbox);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_FLAGS_NONE);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
