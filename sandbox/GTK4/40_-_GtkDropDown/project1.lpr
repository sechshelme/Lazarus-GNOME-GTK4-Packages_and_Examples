program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

  procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  // === DropDown 1

  procedure on_dropdown_selection_changed(dropdown: PGObject; pspec: PGParamSpec; user_data: Tgpointer); cdecl;
  var
    outputLabel: PGtkLabel absolute user_data;
    selected_index: Tguint;
    string_list: PGtkStringList;
    selected_string: pchar;
  begin
    selected_index := gtk_drop_down_get_selected(GTK_DROP_DOWN(dropdown));

    if selected_index = GTK_INVALID_LIST_POSITION then begin
      gtk_label_set_label(outputLabel, '(unknow)');
    end else begin
      string_list := GTK_STRING_LIST(gtk_drop_down_get_model(GTK_DROP_DOWN(dropdown)));
      selected_string := gtk_string_list_get_string(string_list, selected_index);
      gtk_label_set_label(outputLabel, selected_string);
    end;
  end;

  procedure on_button_clicked(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    dropdown: PGtkDropDown absolute user_data;
    selected_index: Tguint;
    string_list: PGtkStringList;
    selected_string: pchar;
  begin
    selected_index := gtk_drop_down_get_selected(dropdown);

    if selected_index = GTK_INVALID_LIST_POSITION then begin
      gtk_button_set_label(GTK_BUTTON(widget), '(unknow)');
    end else begin
      string_list := GTK_STRING_LIST(gtk_drop_down_get_model(dropdown));
      selected_string := gtk_string_list_get_string(string_list, selected_index);
      gtk_button_set_label(GTK_BUTTON(widget), selected_string);
    end;
  end;

  function createDropDownBox1: PGtkWidget;
  const
    s: array of Pgchar = ('null', 'eins', 'zwei', 'drei', 'vier', 'fünf', nil);
  var
    starsList: PGtkStringList;
    entry, starsDropDown, outputButton, outputLabel: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    entry := gtk_entry_new;

    outputLabel := gtk_label_new('(none)');

    starsList := gtk_string_list_new(PPgchar(s));
    starsDropDown := gtk_drop_down_new(G_LIST_MODEL(starsList), nil);
    g_signal_connect(starsDropDown, 'notify::selected', G_CALLBACK(@on_dropdown_selection_changed), outputLabel);

    outputButton := gtk_button_new_with_label('output');
    g_signal_connect(outputButton, 'clicked', G_CALLBACK(@on_button_clicked), starsDropDown);

    gtk_box_append(GTK_BOX(Result), entry);
    gtk_box_append(GTK_BOX(Result), starsDropDown);
    gtk_box_append(GTK_BOX(Result), outputButton);
    gtk_box_append(GTK_BOX(Result), outputLabel);
  end;

  // === DropDown 2

  procedure setup_stars_listitem_cb(factory: PGtkListItemFactory; list_item: PGtkListItem); cdecl;
  var
    widget: PGtkWidget;
  begin
    widget := gtk_label_new('');
    gtk_list_item_set_child(list_item, widget);
  end;

  procedure bind_stars_listitem_cb(factory: PGtkListItemFactory; list_item: PGtkListItem); cdecl;
  var
    widget: PGtkWidget;
    stringObj: PGtkStringObject;
  begin
    widget := gtk_list_item_get_child(list_item);
    stringObj := PGtkStringObject(gtk_list_item_get_item(list_item));
    gtk_label_set_text(GTK_LABEL(widget), gtk_string_object_get_string(stringObj));
  end;

  function createDropDownBox2: PGtkWidget;
  const
    s: array of Pgchar = ('eins', 'zwei', 'drei', 'vier', 'fünf', nil);
  var
    starsList: PGtkStringList;
    entry, starsDropDown: PGtkWidget;
    starsFactory: PGtkListItemFactory;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    entry := gtk_entry_new;
    gtk_box_append(GTK_BOX(Result), entry);

    starsList := gtk_string_list_new(PPgchar(s));

    starsFactory := gtk_signal_list_item_factory_new;
    g_signal_connect(starsFactory, 'setup', G_CALLBACK(@setup_stars_listitem_cb), nil);
    g_signal_connect(starsFactory, 'bind', G_CALLBACK(@bind_stars_listitem_cb), nil);


    starsDropDown := gtk_drop_down_new(G_LIST_MODEL(starsList), nil);
    gtk_drop_down_set_factory(GTK_DROP_DOWN(starsDropDown), GTK_LIST_ITEM_FACTORY(starsFactory));

    gtk_box_append(GTK_BOX(Result), starsDropDown);
  end;


  // ================


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, main_box, button, dd: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Drop Down Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), main_box);

    dd := createDropDownBox1;
    gtk_box_append(GTK_BOX(main_box), dd);

    dd := createDropDownBox2;
    gtk_box_append(GTK_BOX(main_box), dd);

    button := gtk_button_new_with_label('Quit');
    gtk_widget_set_tooltip_text(button, 'Beendet das Programm');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), window);
    gtk_box_append(GTK_BOX(main_box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.dropdown', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
    Exit(status);
  end;

begin
  main(argc, argv);
end.
